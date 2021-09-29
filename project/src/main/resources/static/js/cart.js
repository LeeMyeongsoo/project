let basket = {
    totalCount: 0, 
    totalPrice: 0,

	//하나만 삭제하기
	delOneItem:function(pos){
		var c_id = document.getElementById("selected_id"+pos);
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url:"/cart/cartOneDel",
				data: {
					"id": c_id.value
				},
				type: "POST",
				success:function(){
					//전송 처리 결과가 성공이면
			        c_id.parentElement.parentElement.parentElement.remove();
					alert("삭제되었습니다.");
			        this.reCalc();
			        this.updateUI();
				},
				error:function(){
					alert("삭제실패");
				}
			});
		}
	},
    //체크한 장바구니 상품 비우기
    delCheckedItem: function(){
		let	checkArr = new Array();
        document.querySelectorAll("input[name=list]:checked").forEach(function (item) {
			checkArr.push(item.value);
            item.parentElement.parentElement.parentElement.remove();
        });
        //AJAX 서버 업데이트 전송
		$.ajax({
			url:"/cart/cartSelectDel",
			data: {
				"id":checkArr
			},
			traditional: true,
			type: "POST",
			success:function(data){
				alert(data+"개의 상품이 삭제되었습니다.");
				//전송 처리 결과가 성공이면
		        this.reCalc();
		        this.updateUI();
			},
			error:function(){
				alert("상품을 선택해 주세요.");
			}
		});
		
        
    },
    //장바구니 전체 비우기
    delAllItem: function(){
        document.querySelectorAll('.row.data').forEach(function (item) {
            item.remove();
          });
		if(confirm("전체 삭제를 하시겠습니까?"))
          //AJAX 서버 업데이트 전송
        $.ajax({
			url:"/cart/cartAllDel",
			type: "POST",
			success:function(data){
				alert(data+"개의 상품이 삭제되었습니다.");
				//전송 처리 결과가 성공이면
		          this.totalCount = 0;
		          this.totalPrice = 0;
		          this.reCalc();
		          this.updateUI();
			},
			error:function(){
				alert("상품을 선택해 주세요.");
			}
		});
          
    },
    //재계산
    reCalc: function(){
        this.totalCount = 0;
        this.totalPrice = 0;
        document.querySelectorAll(".p_num").forEach(function (item) {
            if(item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked == true){
                var count = parseInt(item.getAttribute('value'));
                this.totalCount += count;
                var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
                this.totalPrice += count * price;
            }
        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
    },
    //화면 업데이트
    updateUI: function () {
        document.querySelector('#sum_p_num').textContent = '상품갯수: ' + this.totalCount.formatNumber() + '개';
        document.querySelector('#sum_p_price').textContent = '합계금액: ' + this.totalPrice.formatNumber() + '원';
    },
    //개별 수량 변경
    changePNum: function (pos) {
        var item = document.querySelector('input[name=p_num'+pos+']');
		var c_id = document.getElementById("selected_id"+pos);
        var p_num = parseInt(item.getAttribute('value'));
        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
        
        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

        item.setAttribute('value', newval);
        item.value = newval;

        var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
        item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
        //AJAX 업데이트 전송
		$.ajax({
			url:"/cart/cartAmountUpdate",
			data: {
				"id": c_id.value,
				"amount": item.value
			},
			type: "POST",
			success:function(){
				//전송 처리 결과가 성공이면
		          this.reCalc();
		          this.updateUI();
			},
			error:function(){
				alert("error");
			}
		});
    },
    checkItem: function () {
        this.reCalc();
        this.updateUI();
    }
}

// 숫자 3자리 콤마찍기
Number.prototype.formatNumber = function(){
    if(this==0) return 0;
    let regex = /(^[+-]?\d+)(\d{3})/;
    let nstr = (this + '');
    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
    return nstr;
};

// 전체 상품 클릭 시
function checkAll() {
    if($('#cbx_chkAll').is(':checked')) {
		$('input:checkbox[name="list"]').prop('checked', true);
    } else {
		$('input:checkbox[name="list"]').prop('checked', false);
        checkFlag = "false";
    }
	basket.checkItem();
}

$('.checkOne').on('click', function(){
	var checkFlag = true;
	$('.checkOne').each(function(){
		checkFlag = checkFlag && $(this).is(':checked');
	})
	$('#cbx_chkAll').prop('checked', checkFlag);
	basket.checkItem();
})

