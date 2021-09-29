<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
     function selectcheck(){
   
        if ($("#searchWord").val().length == 0){
           alert("한글자 이상 입력하세요 ");
           $("#searchWord").focus();
           return false;
        }
        return $("#search").submit(); 
     }
     
  </script>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="megakit,business,company,agency,multipurpose,modern,bootstrap4">

<meta name="author" content="themefisher.com">

<title>event_list</title>

<!-- bootstrap.min css -->
<link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
<!-- Icon Font Css -->
<link rel="stylesheet" href="../plugins/themify/css/themify-icons.css">
<link rel="stylesheet" href="../plugins/fontawesome/css/all.css">
<link rel="stylesheet"
	href="../plugins/magnific-popup/dist/magnific-popup.css">
<!-- Owl Carousel CSS -->
<link rel="stylesheet" href="../plugins/slick-carousel/slick/slick.css">
<link rel="stylesheet"
	href="../plugins/slick-carousel/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="../css/style.css">

<link rel="stylesheet" href="../css/event/layout.css">
<link rel="stylesheet" href="../css/event/content.css">


<style type="text/css">
@import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css');
	#allwarp html, #allwarp body, #allwarp div, #allwarp span, #allwarp applet, #allwarp object, #allwarp iframe,
	#allwarp h1, #allwarp h2, #allwarp h3, #allwarp h4, #allwarp h5, #allwarp h6, #allwarp p, #allwarp blockquote, #allwarp pre,
	#allwarp abbr, #allwarp acronym, #allwarp address, #allwarp big, #allwarp em, #allwarp font, #allwarp img, #allwarp ins, #allwarp s,
	#allwarp small, #allwarp strong,
	#allwarp ol, #allwarp ul, #allwarp li,
	#allwarp form, #allwarp label {
		margin:0;
		padding:0;
		border:0;
		font-size:100%;
		vertical-align:baseline;
		background:transparent;
		-webkit-text-size-adjust:none;
		font-family:'Nanum Gothic', sans-serif, 'Dotum', 'Gulim', 'Arial', sans-serif;
		list-style:none;
		line-height:1;
	}
	ol, ul{list-style:none;}
	a {color:#a7a7a7; text-decoration:none;}
	a:hover {color:#a7a7a7; text-decoration:none;}
	img,input{vertical-align:top;}
	label{vertical-align:middle; font-size:14px; cursor:pointer;}
	select {height:24px; margin:0; border: 1px solid #dcdcdc; padding:0; font-size:13px; vertical-align:middle; color:#666;}
	textarea {border:1px solid #dcdcdc; color:#888; font-size:13px; line-height:18px; padding:5px; overflow-y:auto; resize:none;}
</style>

</head>

<body>

	<!-- Header Start -->
	<%-- <jsp:include page="./layout/header.jsp"></jsp:include> --%>
	<%@include file="../layout/header.jsp"%>
	<!-- Header Close -->
	<div class="main-wrapper ">
		<section class="page-title bg-1">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="block text-center">
							<!-- <span class="text-white">Our blog</span> -->
							<h1 class="text-capitalize mb-4 text-lg">EVENT</h1>
							<ul class="list-inline">
								<li class="list-inline-item"><a href="/index"
									class="text-white">Home</a></li>
								<li class="list-inline-item"><span class="text-white">/</span></li>
								<li class="list-inline-item"><a href="event_list"
									class="text-white-50">Event</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
		
	<div id="allwrap">
		<!-- container -->
		<div id="container">
	
			<div id="location">
				<ol>
					<li><a href="#">HOME</a></li>
					<li><a href="#">EVENT</a></li>
					<li class="last">진행중 이벤트</li>
				</ol>
			</div>
			
			<div id="outbox">		
				<div id="left">
					<div id="title2">EVENT<span>이벤트</span></div>
					<ul>	
						<li><a href="event_list" id="leftNavi1">진행중 이벤트</a></li>
						<li><a href="event_list2" id="leftNavi2">종료된 이벤트</a></li>
					
					</ul>			
				</div><script type="text/javascript">initSubmenu(1,0);</script>
	
	
				<!-- contents -->
				<div id="contents">
					<div id="mypage">
						<h2><strong>진행중 이벤트</strong><span>쟈뎅샵의 특별한 혜택이 가득한 이벤트에 참여해 보세요.</span></h2>
						
						<!-- list -->
						<div class="eventList">
							<ul>
								<!-- 반복 -->
								<li>
									<c:forEach items="${map.list}" var="notice_boardVo">
									<div class="img">
										<a href="/event_board/event_view?id=${notice_boardVo.id}&page=${map.page}&category=${map.category}&searchWord=${map.searchWord}"><img src="/upload/${notice_boardVo.nupload}" alt="진행중 이벤트" /></a>
									</div>
									<div class="txt">
										<div class="subject">${notice_boardVo.ntitle }</div>
										<div class="day">이벤트 기간 : ${notice_boardVo.sdate } ~ ${notice_boardVo.edate }</div>
										<fmt:formatDate value="${notice_boardVo.ndate }" var="date" type="DATE" pattern="yyyy-MM-dd" />
									<td>작성일 : ${date}</td>
									</div>
									</c:forEach>
								</li>
								<!-- //반복 -->
							</ul>
						</div>
						<!-- //list -->
	
						<div class="btnAreaList">
							<!-- 페이징이동1 -->
							<div class="row justify-content-center mt-5">
					<div class="text-center">
						<nav class="navigation pagination d-inline-block">
							<div class="nav-links">
								<!-- 이전페이지 이동 -->
								<c:if test="${map.page <= 1 }">
									<a class="prev page-numbers">Prev</a>
								</c:if>
								<c:if test="${map.page > 1 }">
									<a class="prev page-numbers"
										href="event_list?page=${map.page-1}&category=${map.category}&searchWord=${map.searchWord}">Prev</a>
								</c:if>
								<!-- <span aria-current="page" class="page-numbers current">1</span>  -->

								<!-- 하단넘버링 넣기 -->
								<c:forEach var="nowpage" begin="${map.startpage}"
									end="${map.endpage }">
									<c:if test="${map.page == nowpage }">
										<span class="page-numbers current">${nowpage}</span>
									</c:if>
									<c:if test="${map.page != nowpage }">
										<a href="event_list?page=${nowpage }&category=${map.category}&searchWord=${map.searchWord}">
										<span class="page-numbers current">${nowpage}</span></a>
									</c:if>
								</c:forEach>
								
								
								

								<!-- 다음 -->
								<c:if test="${map.page >= map.endpage }">
									<a class="next page-numbers">Next</a>
								</c:if>
								<c:if test="${map.page < map.endpage }">
									<a class="next page-numbers"
										href="evevt_list?page=${map.page+1}&category=${map.category}&searchWord=${map.searchWord}">Next</a>
								</c:if>
							<!-- //페이징이동1 -->
						</div>
							</div>
								<!-- 관리자만 쓰기 모드 가능하게   -->
								<%-- <c:if test="${session_id == 'asdf4310' }"> --%>
								<a href="event_write?page=${map.page }"><div class="write">쓰기</div></a>
								<%-- </c:if> --%>
							</div>
						
						<!-- 검색 -->
						<div class="searchWrap">
							<div class="search">
								<ul>
								<form action="/event_board/event_list" id="search" name="search"
						method="post">
									<li class="web"><img src="../images/txt/txt_search.gif" alt="search" /></li>
									<li class="se">
										<select name="category" id="category">
											<option value="btitle" >제목</option>
										</select>
									</li>
									<li><input type="text" name="searchWord" id="searchWord" class="searchInput"></li>
									<button type="submit" onclick="selectcheck()">
								<i class="fas fa-search width-2vw"></i>
							</button>
								</form>	
								</ul>
							</div>
						</div>
						<!-- //검색 -->
					</div>
				</div>
				<!-- //contents -->
			</div>
		</div>
	<!-- //container -->
		
	</div>
	<!-- footer Start -->
	<%@include file="../layout/footer.jsp"%>
	<!-- footer Close -->

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

	<script src="js/script.js"></script>
	
	<script type="text/javascript">
	function initSubmenu(dep1, dep2) {

		if (dep1 !=0)
		{leftSearch(dep1, dep2);}

	}
	</script>

</body>
</html>