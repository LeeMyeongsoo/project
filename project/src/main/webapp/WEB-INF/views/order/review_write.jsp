<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="megakit,business,company,agency,multipurpose,modern,bootstrap4">

	<meta name="author" content="themefisher.com">

	<title>product_view</title>

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
	
	<style type="text/css">
	.input-file-button{
		  padding: 6px 25px;
		  background-color:rgb(247 87 87);
		  border-radius: 4px;
		  color: white;
		  cursor: pointer;
		  font-family: 'Poppins', sans-serif;
	}
	#comment-form fieldset{
  	    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
 	    border: 0; /* 필드셋 테두리 제거 */
 	    font-family: 'Poppins', sans-serif;
	}
	#comment-form input[type=radio]{
	    display: none; /* 라디오박스 감춤 */
	}
	#comment-form label.star{
	    font-size:2em; /* 이모지 크기 */
	    color: transparent; /* 기존 이모지 컬러 제거 */
	    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
	}
	#comment-form label.star:hover{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 */
	}
	#comment-form label.star:hover ~ label{
	    text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
	}
	#comment-form fieldset{
	    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
	    direction: rtl; /* 이모지 순서 반전 */
	    border: 0; /* 필드셋 테두리 제거 */
	}
	#comment-form fieldset legend{
	    text-align: left;
	}
	#comment-form input[type=radio]:checked ~ label.star{
    	text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
	}	
	</style>
	<script type="text/javascript">
		function init(){
			if(${result==1}){
				alert("리뷰 작성이 완료되었습니다.");
				window.close();
			}
		}
	</script>
</head>
<body onload="init();">
	<form class="contact-form bg-white rounded p-5" id="comment-form" method="post" action="/order/reviewWrite" enctype="multipart/form-data">
		<input type="hidden" name="product_id" value="${product_id}">
		<h4 class="mb-4">리뷰 등록</h4>
		<hr>
		<div class="row">
			<!-- <div class="col-md-6">
				<div class="form-group">
					<input class="form-control" type="text" name="name" id="name" placeholder="Name:">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<input class="form-control" type="text" name="mail" id="mail" placeholder="Email:">
				</div>
			</div> -->
		</div>
		<label class="input-file-button" for="input-file">
		  사진 업로드
		</label>
		<input id="input-file" multiple="multiple" type="file" name="file" style="display:none;" onchange="setThumbnail(event);"/>
		<div>
			<span style="font-family: 'Poppins', sans-serif;">사진 미리보기</span>
		</div>
		<hr>
		<div id="image_container"></div> 
		<script> 
			function setThumbnail(event) { 
				for (var image of event.target.files) { 
					var reader = new FileReader(); 
					reader.onload = function(event) { 
							var img = document.createElement("img"); 
							img.setAttribute("src", event.target.result); 
							document.querySelector("div#image_container").appendChild(img); 
						}; 
					console.log(image); reader.readAsDataURL(image); 
				} 
			} 
		</script>
		<br><br>
		<fieldset>
        <legend style="font-size: 20px;">별점</legend>
	        <input type="radio" name="rate" value="5" id="rate5"><label class="star" for="rate5">⭐</label>
	        <input type="radio" name="rate" value="4" id="rate4"><label class="star" for="rate4">⭐</label>
	        <input type="radio" name="rate" value="3" id="rate3"><label class="star" for="rate3">⭐</label>
	        <input type="radio" name="rate" value="2" id="rate2"><label class="star" for="rate2">⭐</label>
	        <input type="radio" name="rate" value="1" id="rate1"><label class="star" for="rate1">⭐</label>
  		</fieldset>
  		<br><br>
		<textarea style="font-family: 'Poppins', sans-serif;" class="form-control mb-3" name="about"
			id="comment" cols="30" rows="5" placeholder="리뷰를 입력하세요"></textarea>

		<input class="btn btn-main btn-round-full" type="submit" name="submit-contact" id="submit_contact" value="리뷰 등록">
	</form>
	
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
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</body>
</html>