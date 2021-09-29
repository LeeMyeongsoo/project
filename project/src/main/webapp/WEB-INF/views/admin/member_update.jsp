<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="ko">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="megakit,business,company,agency,multipurpose,modern,bootstrap4">

	<meta name="author" content="themefisher.com">

	<title>회원정보수정</title>

	<!-- bootstrap.min css -->
	<link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
	<!-- Icon Font Css -->
	<link rel="stylesheet" href="/plugins/themify/css/themify-icons.css">
	<link rel="stylesheet" href="/plugins/fontawesome/css/all.css">
	<link rel="stylesheet" href="/plugins/magnific-popup/dist/magnific-popup.css">
	<!-- Owl Carousel CSS -->
	<link rel="stylesheet" href="/plugins/slick-carousel/slick/slick.css">
	<link rel="stylesheet" href="/plugins/slick-carousel/slick/slick-theme.css">

	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="/css/style.css">

	<!-- 규상 -->
	<style>
		.container1 {
			margin: 0 auto;
			width: 480px;
		}

		.form_label {
			font-size: 14px;
			font-weight: 700;
			margin: 0;
		}

		.form_input {
			background: #f1fbff;
			border: 1px solid #EEF2F6;
			box-shadow: none;
			width: 100%;
			height: 45px;
			margin-bottom: 10px;
			padding: 10px 14px 10px 14px;
		}

		.form_input_30 {
			background: #f1fbff;
			border: 1px solid #EEF2F6;
			box-shadow: none;
			box-sizing: border-box;
			width: 30%;
			height: 45px;
			margin-bottom: 10px;
			padding: 10px 14px 10px 14px;
		}

		.form_input_70 {
			background: #f1fbff;
			border: 1px solid #EEF2F6;
			box-shadow: none;
			width: 70%;
			height: 45px;
			margin-bottom: 10px;
			padding: 10px 14px 10px 14px;
		}

		.check_text {
			color: red;
			font-size: 12px;
		}

		.btn11 {
			background: rgb(205, 205, 255);
			border: none;
			box-shadow: none;
			width: 49%;
			height: 4vh;
			border: none;
			font-size: 20px;
		}

		.btn1 {
			background: #b0d8ff;
			margin-left: 15px;
			height: 45px;
			width: 25%;
			box-sizing: border-box;
			vertical-align: middle;
			border: 1px solid #8fc7ff;
		}

		.tab-button {
			width: 49%;
			height: 44px;
			box-sizing: border-box;
			padding: 0;
			border: 0;
			border-bottom: 1px solid rgb(116, 116, 255);
			margin: 0;
			background-color: white;
			cursor: pointer;
		}

		/* 개인 - 사업자 체인지 버튼용 */
		.tab-button-selected {
			height: 43px;
			border-bottom: 2px solid rgb(77, 77, 255);
		}

		/* 버튼 클릭 시 나오는 테두리 없애기 */
		button:focus {
			outline: none;
		}

		/* 약관 동의 */
		.term_main {
			font-size: 16px;
			margin-top: 20px;
		}

		.term label {
			margin: 0;
		}

		.term_sub,
		.term_flag {
			font-size: 13px;
			margin-top: 10px;
		}

		.term input[type="checkbox"] {
			height: 17px;
			width: 17px;
		}

		.term_sub span {
			color: red;
		}

		.term_flag span {
			color: blue;
		}

		.flexbox {
			display: flex;
			justify-content: space-between;
		}

		.term_toggle {
			background-color: white;
			border: none;
			outline: none;
		}

		.term_area {
			width: 100%;
			height: 160px;
			font-size: 12px;
			background-color: #f9f9f9;
			padding: 12px;
			box-sizing: border-box;
			color: #666;
			overflow-y: auto;
		}

		.term_table {
			width: 100%;
			table-layout: fixed;
		}

		.term_table,
		.term_table tr,
		.term_table td,
		.term_table th {
			border: 1px solid black;
			font-size: 12px;
			border-collapse: collapse;
			text-align: center;
		}

		.term_table1 {
			border-top: 1px solid #e0e0e0;
			border-bottom: 1px solid #e0e0e0;
		}

		.term_table1 th {
			width: 70px;
		}

		.term_table1 td {
			padding: 5px;
		}

		/* 사업자용 */
		.company {
			display: none;
			padding-top: 20px;
			margin-top: 20px;
			border-top: 1px solid #e0e0e0;
		}
	</style>

</head>

<body>

	<!-- Header Start -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- Header Close -->

	<section class="page-title bg-1">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block text-center">
						<h1 class="text-capitalize mb-4 text-lg">회원수정</h1>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- form -->
	<section class="section bg-white">
		<div class="container1">
			<form action="/admin/memberUpdate" method="POST" id="regForm" onsubmit="return checkAll();">

				<!-- 히든 인풋 -->
				<input type="hidden" name="dob" id="dob" value="${memberVo.dob }">
				<input type="hidden" name="email_flag" id="email_flag" value="${memberVo.email_flag }">
				<input type="hidden" name="sms_flag" id="sms_flag" value="${memberVo.sms_flag }">
				<input type="hidden" name="picture" id="picture" value="${memberVo.picture }">

				<div class="register">

					<!-- 일반회원  -->
					<!-- 계정 -->
					<div class="acc">
						<h3><label for="id" class="form_label">아이디</label></h3>
						<input type="text" name="id" id="id" class="form_input" onblur="check_id();" value="${memberVo.id }"><br><span id="id_text"
							class="check_text"></span>
						<h3><label for="pw" class="form_label">비밀번호</label></h3>
						<input type="password" name="pw" id="pw" class="form_input" onblur="check_pw();"><br><span id="pw_text"
							class="check_text"></span>
						<h3><label for="re_pw" class="form_label">비밀번호 재확인</label></h3>
						<input type="password" name="re_pw" id="re_pw" class="form_input" onblur="check_re_pw();"><br><span
							id="re_pw_text" class="check_text"></span>
						<h3><label for="nickName" class="form_label">닉네임<span><small>(선택)</small></span></label></h3>
						<input type="text" name="nickname" id="nickName" class="form_input" onblur="check_nickName();" value="${memberVo.nickname }"><br><span
							id="nickName_text" class="check_text"></span>
					</div>

					<!-- 개인정보 -->
					<div class="info">
						<h3><label for="name" class="form_label">이름</label></h3>
						<input type="text" name="name" id="name" class="form_input" onblur="check_name();" value="${memberVo.name }"><br><span id="name_text"
							class="check_text"></span>

						<h3><label for="" class="form_label">생년월일</label></h3>
						<input type="text" id="year" maxlength="4" placeholder="년(4자)" class="form_input_30" onblur="check_dob();" value="${fn:substring(memberVo.dob,0,4) }">
						<select id="month" class="form_input_30" onchange="check_dob();">
							<option value="">월</option>
							<option value="01" ${fn:substring(memberVo.dob,4,6) eq '01' ? 'selected' : '' }>1</option>
							<option value="02" ${fn:substring(memberVo.dob,4,6) eq '02' ? 'selected' : '' }>2</option>
							<option value="03" ${fn:substring(memberVo.dob,4,6) eq '03' ? 'selected' : '' }>3</option>
							<option value="04" ${fn:substring(memberVo.dob,4,6) eq '04' ? 'selected' : '' }>4</option>
							<option value="05" ${fn:substring(memberVo.dob,4,6) eq '05' ? 'selected' : '' }>5</option>
							<option value="06" ${fn:substring(memberVo.dob,4,6) eq '06' ? 'selected' : '' }>6</option>
							<option value="07" ${fn:substring(memberVo.dob,4,6) eq '07' ? 'selected' : '' }>7</option>
							<option value="08" ${fn:substring(memberVo.dob,4,6) eq '08' ? 'selected' : '' }>8</option>
							<option value="09" ${fn:substring(memberVo.dob,4,6) eq '09' ? 'selected' : '' }>9</option>
							<option value="10" ${fn:substring(memberVo.dob,4,6) eq '10' ? 'selected' : '' }>10</option>
							<option value="11" ${fn:substring(memberVo.dob,4,6) eq '11' ? 'selected' : '' }>11</option>
							<option value="12" ${fn:substring(memberVo.dob,4,6) eq '12' ? 'selected' : '' }>12</option>
						</select>
						<input type="text" id="day" maxlength="2" placeholder="일" class="form_input_30"
							onblur="check_dob();" value="${fn:substring(memberVo.dob,6,8) }"><br><span id="dob_text" class="check_text"></span>

						<h3><label for="" class="form_label">성별</label></h3>
						<select name="gender" id="" class="form_input">
							<option value="N" ${memberVo.gender eq 'N' ? 'selected' : '' }>선택안함</option>
							<option value="M" ${memberVo.gender eq 'M' ? 'selected' : '' }>남자</option>
							<option value="F" ${memberVo.gender eq 'F' ? 'selected' : '' }>여자</option>
						</select><br>

						<h3><label for="email" class="form_label">본인 확인 이메일<span><small>(선택)</small></span></label></h3>
						<input type="text" name="email" id="email" placeholder="선택입력" class="form_input"
							onblur="check_email();" value="${memberVo.email }"><br><span id="email_text" class="check_text"></span>
					</div>

					<!-- 휴대전화 -->
					<div>
						<h3><label for="hp" class="form_label">휴대전화</label></h3>
						<input type="tel" name="tel" id="tel" maxlength="11" placeholder="전화번호 입력" onblur="check_tel();" class="form_input_70" value="${memberVo.tel }">
						<button type="button" class="btn1" onclick="smsCerti();">인증번호받기</button><br>
						<input type="text" name="" id="" readonly class="form_input" placeholder="인증번호를 적어주세요"><br><span id="tel_text" class="check_text"></span>
					</div>

					<!-- 주소 -->
					<div class="member">
						<h3><label for="" class="form_label">주소</label></h3>
						<input type="text" name="" id="postcode" class="form_input_30" readonly placeholder="우편번호"><button type="button" class="btn1" onclick="addrAPI();">우편등록</button><br>
						<input type="text" name="addr" id="addr" class="form_input" readonly placeholder="주소" value="${memberVo.addr }">
						<input type="text" name="addr1" id="addr1" class="form_input" placeholder="상세주소" onblur="check_addr();" value="${memberVo.addr1 }"><br><span id="addr_text" class="check_text"></span>
					</div>
					
					<div>
						<h3><label for="point" class="form_label">포인트</label></h3>
						<input type="text" name="point" id="point" class="form_input" value="${memberVo.point }">
					</div>
					
					<div>
						<h3><label for="rank" class="rank">등급</label></h3>
						<input type="text" name="rank" id="rank" class="form_input" value="${memberVo.rank }">
					</div>
						
					<!-- END 일반회원 -->
				</div>

				<!-- 약관동의 -->
				<div class="term">
					<div class="term_main">
						<label><input type="checkbox" name="" id="checkBoxAll" ${(memberVo.email_flag eq 'Y' && memberVo.sms_flag eq 'Y') ? 'checked' : '' }><span>&emsp;약관 모두 동의하기</span></label>
					</div>
					<div class="term_flag">
						<div class="flexbox">
							<label><input type="checkbox" name="" id="email_flag_check" class="checkBoxOne" ${memberVo.email_flag eq 'Y' ? 'checked' : '' }>&emsp;이벤트/쇼핑혜택 이메일 수신<span>&nbsp;(선택)</span></label>
							<button type="button" class="term_toggle">내용보기</button>
						</div>
						<div class="term_text">
							<div class="term_area">
								<p>고객님께서는 동의를 거부할 수 있으며, 동의하지 않아도 가입이 가능합니다.</p>
								<table class="term_table1">
									<tr>
										<th>이용목적</th>
										<td>할인혜택, 소식 및 이벤트 당첨 알림 서비스제공</td>
									</tr>
									<tr>
										<th>수집항목</th>
										<td>이메일 주소</td>
									</tr>
									<tr>
										<th>보유기간</th>
										<td><strong>회원탈퇴 또는 개인정보 유효기간 도래시까지 보관</strong><br>(단, 관계 법령에 따라 고객님의 개인정보를 보존해야 하는 경우, 회사는 해당
											법령에서
											정한 기간동안 보관합니다.)</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="term_flag">
						<div class="flexbox">
							<label><input type="checkbox" name="" id="sms_flag_check" class="checkBoxOne" ${memberVo.sms_flag eq 'Y' ? 'checked' : '' }>&emsp;이벤트/쇼핑혜택 SMS 수신<span>&nbsp;(선택)</span></label>
							<button type="button" class="term_toggle">내용보기</button>
						</div>
						<div class="term_text">
							<div class="term_area">
								<p>고객님께서는 동의를 거부할 수 있으며, 동의하지 않아도 가입이 가능합니다.</p>
								<table class="term_table1">
									<tr>
										<th>이용목적</th>
										<td>할인혜택, 소식 및 이벤트 당첨 알림 서비스제공</td>
									</tr>
									<tr>
										<th>수집항목</th>
										<td>핸드폰 번호</td>
									</tr>
									<tr>
										<th>보유기간</th>
										<td><strong>회원탈퇴 또는 개인정보 유효기간 도래시까지 보관</strong><br>(단, 관계 법령에 따라 고객님의 개인정보를 보존해야 하는 경우, 회사는 해당
											법령에서
											정한 기간동안 보관합니다.)</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- 서브밋 -->
				<div style="text-align: center;">
					<br><br>
					<input type="submit" value="수정하기" class="btn11">
					<input type="button" value="취소하기" class="btn11" onclick="javascript:location.href='/index';">
				</div>

			</form>
		</div>
	</section>

	<!-- footer Start -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<!-- footer Close -->

	<!-- 
    Essential Scripts
    =====================================-->


	<!-- Main jQuery -->
	<script src="/plugins/jquery/jquery.js"></script>
	<script src="/js/contact.js"></script>
	<!-- Bootstrap 4.3.1 -->
	<script src="/plugins/bootstrap/js/popper.js"></script>
	<script src="/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!--  Magnific Popup-->
	<script src="/plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<!-- Slick Slider -->
	<script src="/plugins/slick-carousel/slick/slick.min.js"></script>
	<!-- Counterup -->
	<script src="/plugins/counterup/jquery.waypoints.min.js"></script>
	<script src="/plugins/counterup/jquery.counterup.min.js"></script>

	<script src="/js/script.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<!-- 유효성 검사 -->
	<!-- 미완성 -->
	<script>
		// 아이디 체크 확인
		function check_id() {
			var id = document.getElementById("id");
			var idChecked = document.getElementById("id_text");
			var checkFlag = false;
			if (!id.value) {
				idChecked.innerHTML = "필수 정보입니다.";
				return false;
			} else if (!/^[a-z0-9_-]{5,20}$/.test(id.value)) {
				idChecked.innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
				return false;
			} else {
				$.ajax({
					url:"/admin/memberCheckId",
					type:"POST",
					data:"id="+id.value,
					async:false,
					success:function(result){
						if('${memberVo.id}' == id.value){
							idChecked.innerHTML = "사용가능한 아이디입니다.";
							checkFlag = true;
						} else if(result == 1){
							idChecked.innerHTML = "존재하는 아이디입니다.";
							checkFlag = false;
						} else {
							idChecked.innerHTML = "사용가능한 아이디입니다.";
							checkFlag = true;
						}
					},
					error:function(){
						alert("아이디 체크 에러");
					}
				});
				if(checkFlag){
					return true;
				} else {
					return false;
				}
			}
		}

		// 비밀번호 확인
		function check_pw() {
			var pw = document.getElementById("pw");
			var pwChecked = document.getElementById("pw_text");
			if (!pw.value) {
				pwChecked.innerHTML = "필수 정보입니다.";
				return false;
			} else if (!/(?=.*\d)(?=.*[~`!@#$%\^&*()-+=])(?=.*[a-zA-Z]).{8,16}$/.test(pw.value)) {
				pwChecked.innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
				return false;
			} else {
				pwChecked.innerHTML = "";
				return true;
			}
		}

		// 비밀번호 재확인
		function check_re_pw() {
			var pw = document.getElementById("pw");
			var re_pw = document.getElementById("re_pw");
			var re_pwChecked = document.getElementById("re_pw_text");
			if (!re_pw.value) {
				re_pwChecked.innerHTML = "필수 정보입니다.";
				return false;
			} else if (pw.value != re_pw.value) {
				re_pwChecked.innerHTML = "비밀번호가 일치하지 않습니다.";
				return false
			} else {
				re_pwChecked.innerHTML = "";
				return true;
			}
		}

		// 닉네임 확인(없을 시 이름과 동일)
		function check_nickName() {
			var nickName = document.getElementById("nickName");
			var nickName_checked = document.getElementById("nickName_text")
			if (!nickName.value) {
				nickName_checked.innerHTML = "안넣을 시 닉네임은 이름과 동일하게 됩니다.";
				nickName_checked.style.color = "blue";
				if (check_name()) {
					nickName.value = document.getElementById("name").value;
					return true;
				} else {
					nickName_checked.innerHTML = "닉네임 또는 이름을 적어주세요.";
					nickName_checked.style.color = "red";
					return false;
				}
			} else {
				nickName_checked.innerHTML = "";
				return true;
			}
		}

		// 이름 확인
		function check_name() {
			var name = document.getElementById("name");
			var nameChecked = document.getElementById("name_text");
			if (!name.value) {
				nameChecked.innerHTML = "필수 정보입니다.";
				return false;
			} else if (!(/^[가-힣]{2,}$/.test(name.value) || /^[a-zA-Z]{5,}$/.test(name.value))) {
				nameChecked.innerHTML = "한글(2자 이상)과 영문(5자 이상) 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
				return false;
			} else {
				nameChecked.innerHTML = "";
				return true;
			}
		}

		// 생년월일 확인
		function check_dob() {
			var year = document.getElementById("year");
			var dobChecked = document.getElementById("dob_text");
			var month = document.getElementById("month");
			month = month.options[month.selectedIndex];
			var day = document.getElementById("day");
			var lastDay = new Date(year.value, month.value, 0).getDate();
			var dob = document.getElementById("dob");
			if (!year.value || !/[0-9]{4}/.test(year.value)) {
				dobChecked.innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
				return false;
			} else if (month.value == "") {
				dobChecked.innerHTML = "태어난 월을 선택해주세요.";
				return false;
			} else if (day.value == "" || day.value < 0) {
				dobChecked.innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
				return false;
			} else if (day.value > lastDay) {
				dobChecked.innerHTML = month.value + "월의 마지막 날은 " + lastDay + "일 입니다.";
				return false;
			} else {
				dobChecked.innerHTML = "";
				dob.value = year.value+month.value+day.value;
				return true;
			}
		}

		// 이메일 확인
		function check_email() {
			var email = document.getElementById("email");
			var emailChecked = document.getElementById("email_text");
			var reg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			if (email.value != "" && !reg.test(email.value)) {
				emailChecked.innerHTML = "올바른 이메일 주소를 입력하세요.";
				return false;
			} else {
				emailChecked.innerHTML = "";
				return true;
			}
		}
		
		// 휴대전화 확인
		function check_tel() {
			var tel = document.getElementById("tel");
			var telChecked = document.getElementById("tel_text");
			if(tel.value == "") {
				telChecked.innerHTML = "필수정보입니다.";
				return false;
			} else {
				telChecked.innerHTML = "";
				return true;
			}
		}

		// 수정 좀 해야함!------------------------------------------------
		// 전화번호 인증번호 확인
		function smsCerti() {
			var tel = document.getElementById("tel");
			var telChecked = document.getElementById("tel_text");
			if(tel.value = "") {
				telChecked.innerHTML = "전화번호를 입력해주세요.";
				return false;
			} else {
				telChecked.innerHTML = "";
				return true;
			}
		}
		
		// 주소 확인
		function check_addr(){
			var addr = document.getElementById("addr");
			var addr1 = document.getElementById("addr1");
			var addrChecked = document.getElementById("addr_text");
			if(addr.value == "" || addr1.value == "") {
				addrChecked.innerHTML = "주소를 입력해주세요.";
				return false;
			} else {
				addrChecked.innerHTML = "";
				return true;
			}
		}
		
	</script>

	<!-- checkAll() -->
	<script type="text/javascript">
    // 전체 확인
    function checkAll(){
      if(!check_id()){
        document.getElementById("id").focus();
        return false;
      } else if(!check_pw()){
        document.getElementById("pw").focus();
        return false;
      } else if(!check_re_pw()){
        document.getElementById("re_pw").focus();
        return false;
      } else if(!check_nickName()){
        document.getElementById("nickName").focus();
        return false;
      } else if(!check_name()){
        document.getElementById("name").focus();
        return false;
      } else if(!check_dob()){
        document.getElementById("year").focus();
        return false;
      } else if(!check_email()){
        document.getElementById("email").focus();
        return false;
      } else if(!check_tel()){
        document.getElementById("tel").focus();
        return false;
      } else if(!check_addr()){
        document.getElementById("addr1").focus();
        return false;
      }
    	$.ajax({
    		  url:$("#regForm").attr("action"),
    		  data:$("#regForm").serialize(),
    		  dataType:"html",
    		  type:"POST",
    		  success:function(result){
    			  if(result == 1){
    				  alert("정보 수정이 되었습니다.");
    				  location.href="/index";
    			  } else {
    				  alert("정보 수정에 실패하였습니다.\n다시 수정해주세요.");
    				  location.href="/admin/member_update";
    			  }
    		  },
    		  error:function(){
    			  alert("회원수정 에러");
    		  }
    	  });
        return false;
      }
	</script>

	<!-- 제이쿼리 동적 -->
	<script>
		$(function () {
			// 약관동의 전체 선택
			$('#checkBoxAll').on('click', function(){
		    if($('#checkBoxAll').is(':checked')){
	        $('.checkBoxOne').prop('checked', true);
	        $('#email_flag').val("Y");
	        $('#sms_flag').val("Y");
		    } else {
	        $('.checkBoxOne').prop('checked', false);
	        $('#email_flag').val("N");
	        $('#sms_flag').val("N");
		    }
			});
			// 약관동의 전체 클릭 안하고 개별로 전부 클릭 했을 시
			$('.checkBoxOne').on('click', function(){
		    var is_checked = true;
		    $('.checkBoxOne').each(function(){
	        is_checked = is_checked && $(this).is(':checked');
		    });
		    $('#checkBoxAll').prop('checked', is_checked);
			});
			$('#email_flag_check').on('click', function(){
		    if($(this).is(':checked')){
        	$('#email_flag').val("Y");
		    } else {
	        $('#email_flag').val("N");
		    }
			});
			$('#sms_flag_check').on('click', function(){
		    if($(this).is(':checked')){
	        $('#sms_flag').val("Y");
		    } else {
	        $('#sms_flag').val("N");
		    }
			});
		});
	</script>

	<!-- 전화번호 인증 -->
	<!-- 미완성 -->
	<script type="text/javascript">
	</script>
	
	<!-- 회원 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function addrAPI() {
		new daum.Postcode({
			oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if(data.userSelectedType === 'R'){
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraAddr !== ''){
						extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				// document.getElementById("sample6_extraAddress").value = extraAddr;
				
				} else {
						// document.getElementById("sample6_extraAddress").value = '';
				}
				
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("addr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addr1").focus();
			}
		}).open();
	}
	</script>

</body>

</html>