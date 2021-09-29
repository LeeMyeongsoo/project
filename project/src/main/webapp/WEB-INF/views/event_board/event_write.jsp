<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="megakit,business,company,agency,multipurpose,modern,bootstrap4">
  
  <meta name="author" content="themefisher.com">

  <title>event_list</title>

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
  <!-- Icon Font Css -->
  <link rel="stylesheet" href="../plugins/themify/css/themify-icons.css">
  <link rel="stylesheet" href="../plugins/fontawesome/css/all.css">
  <link rel="stylesheet" href="../plugins/magnific-popup/dist/magnific-popup.css">
  <!-- Owl Carousel CSS -->
  <link rel="stylesheet" href="../plugins/slick-carousel/slick/slick.css">
  <link rel="stylesheet" href="../plugins/slick-carousel/slick/slick-theme.css">

  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="../css/style.css">
  <!-- 내가 한거 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
		section.section11 {
		  margin: auto;
		  width: 90%;
		  font-family: 'Poppins', sans-serif;
		}
		
		h1 {
		  font-size: 32px;
		  margin: 50px 0 40px 0;
		  text-align: center;
		}
		
		hr {
		  border: 3px solid black;
		  margin-bottom: 30px;
		}
		
		table {
		  width: 100%;
		}
		
		tr {
		  height: 50px;
		}
		
		th {
		  font-weight: normal;
		  font-size: 20px;
		}
		
		select,
		input,
		textarea {
		  width: 100%;
		  border: 2px solid #ccc;
		}
		
		.category-wrapper {
		  width: 100%;
		  border: 2px solid #ccc;
		
		}
		
		select {
		  padding: 5px 0px 5px 10px;
		  background: url(https://www.midashotel.co.kr/Midas_common/images/homepage/board/search-box-select.png) no-repeat 98% 50%;
		  -webkit-appearance: none;
		  -moz-appearance: none;
		  appearance: none;
		  border: none;
		}
		
		select::-ms-expand {
		  display: none;
		}
		
		input {
		  height: 30px;
		  font-size: 16px;
		}
		
		textarea {
		  resize: none;
		}
		
		#file {
		  border: none;
		}
		
		.button-wrapper {
		  padding-top: 20px;
		  width: 280px;
		  margin: auto;
		}
		
		button {
		  cursor : pointer;	
		  width: 130px;
		  height: 45px;
		
		  font-size: 18px;
		}
		
		.write {
		  color: white;
		  background: #3d3d3d;
		  border: none;
		  margin-right: 15px;
		}
		
		.cancel {
		  color: black;
		  background: white;
		  border: 2px solid #3d3d3d;
		}
	</style>
	
	<script type="text/javascript">
		function eventdate(){
			  var now = new Date();
			if($("#sdate").val()== now){
				
			}
		}
		
		function sdateCheck() {
			var now = new Date();
			var sdate = new Date($("#sdate").val());
			
			if(now >= sdate){
				alert("시작일은 오늘날짜보다 이전일수없습니다");
				$("#sdate").val("");
				return;
			} 
		}
		
		function edateCheck() {
			var now = new Date();
			var sdate = new Date($("#sdate").val());
			var edate = new Date($("#edate").val());
			
			if(sdate == ""){
				alert("시작날짜를 입력해주세요!");
				return;
			}
			
			if(now >= edate){
				alert("종료일은 오늘날짜보다 이전일수없습니다");
				$("#edate").val("");
				return;
			}
			
			if(sdate > edate){
				alert("종료일은 시작날짜보다 이전일수없습니다");
				$("#edate").val("");
				return;
			}
		}
	</script>

</head>

<body>

<!-- Header Start --> 
<jsp:include page="../layout/header.jsp"></jsp:include>
<!-- Header Close --> 
<div class="main-wrapper ">
	<section class="page-title bg-1">
	  <div class="container">
	    <div class="row">
	      <div class="col-md-12">
	        <div class="block text-center">
	          <!-- <span class="text-white">Our blog</span> -->
	          <h1 class="text-capitalize mb-4 text-lg">이벤트 글쓰기</h1>
	          <ul class="list-inline">
	            <li class="list-inline-item"><a href="/index" class="text-white">Home</a></li>
	            <li class="list-inline-item"><span class="text-white">/</span></li>
	            <li class="list-inline-item"><a href="event_list" class="text-white-50">Event</a></li>
	          </ul>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
	
	<section class="section11">
    <h1>이벤트 글쓰기</h1>
    <hr>

    <form action="/event_board/event_write" name="boardWrite" method="post" enctype="multipart/form-data">
      <table>
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" value="관리자"name="" readonly>
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="ntitle">
          </td>
        </tr>
        <tr>
          <th>시작일</th>
          <td>
            <input type="text" name="sdate" id="sdate" onblur="sdateCheck()" placeholder="ex) 20210920">
          </td>
        </tr>
        <tr>
          <th>종료일</th>
          <td>
            <input type="text" name="edate" id="edate" onblur="edateCheck()" placeholder="ex) 20210920">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="ncontent" cols="50" rows="10"></textarea>
          </td>
        </tr>
        <tr>
          <th>이미지 표시</th>
          <td>
            <input type="file" name="file" id="files">
          </td>
        </tr>
      </table>
      <hr>
      <div class="/button-wrapper">
        <button type="submit" class="write">작성완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='event_list?page=${param.page}'">취소</button>
      </div>
    </form>

  </section>
</div>
<hr>
<!-- footer Start -->
<jsp:include page="../layout/footer.jsp"></jsp:include>
   


    <!-- 
    Essential Scripts
    =====================================-->

    
    <!-- Main jQuery -->
    <script src="plugins/jquery/jquery.js"></script>
    <script src="js/contact.js"></script>
    <!-- Bootstrap 4.3.1 -->
    <script src="plugins/bootstrap/js/popper.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
   <!--  Magnific Popup-->
    <script src="plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
    <!-- Slick Slider -->
    <script src="plugins/slick-carousel/slick/slick.min.js"></script>
    <!-- Counterup -->
    <script src="plugins/counterup/jquery.waypoints.min.js"></script>
    <script src="plugins/counterup/jquery.counterup.min.js"></script>

    <!-- Google Map -->
    <script src="plugins/google-map/map.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>    
    
    <script src="js/script.js"></script>

  </body>
  </html>