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

	<title>회원관리</title>

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
		table {
			width: 100%;
		}
		table, tr, th, td {
			border: 1px solid black;
			border-collapse: collapse;
			text-align: center;
		}
	</style>

</head>

<body onload="list();">

	<!-- Header Start -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- Header Close -->

	<section class="page-title bg-1">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block text-center">
						<h1 class="text-capitalize mb-4 text-lg">회원관리</h1>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- form -->
	<section class="section bg-white">
		<div class="container">
			<form action="/admin/memberList" method="post" id="regForm" onsubmit="return list();">
				<div class="row justify-content-end">
					<div class="mr-2">
						<select class="p-2" name="category" id="category">
							<option value="">전체</option>
							<option value="id">아이디</option>
							<option value="nickname">닉네임</option>
							<option value="name">이름</option>
							<option value="dob">생년월일</option>
							<option value="email">이메일</option>
							<option value="tel">전화번호</option>
							<option value="point">포인트</option>
							<option value="rank">등급</option>
						</select>
					</div>
					<div class="mr-2">
						<select class="p-2" name="order" id="order">
							<option value="asc">오름차순</option>
							<option value="desc">내림차순</option>
						</select>
					</div>
					<div class="mr-2">
						<input type="text" name="searchWord" id="searchWord">
					</div>
					<div>
						<button type="submit" style="background-color: white; border: none;">
							<i class="fas fa-search fa-lg"></i>
						</button>
					</div>
				</div>
			</form>
			
			<table class="mt-5">
				<thead>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>닉네임</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>포인트</th>
						<th>등급</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="list">
				</tbody>
			</table>
			
			<div class="row justify-content-center mt-5">
				<div class="col-lg-6 text-center">
					<nav class="navigation pagination d-inline-block">
						<div class="nav-links" id="numList">
						</div>
					</nav>
				</div>
			</div>
			<!-- 하단 넘버링 Close -->
		
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

	<script type="text/javascript">
	function list(page){
		$("#list").empty();
		$("#numList").empty();
      	$.ajax({
  		  url:$("#regForm").attr("action"),
  		  data:{
  			  /* $("#regForm").serialize(), */
  			  "page": page,
  			  "category": $("#category").val(),
  			  "searchWord": $("#searchWord").val(),
  			  "order": $("#order").val()
  		  },
  		  type:"POST",
  		  success:function(data){
  			  if(data.flag == 1){
  				  var tag = "<tr><td colspan='11'>찾고자 하는 회원이 없습니다.</td></tr>"
  				  $("#list").append(tag);
  			  } else {
  				  var tag = "";
  				  for(i=0; i<data.list.length; i++){
  					  tag += "<tr><td>"+data.list[i].id+"</td>"+
  					  		"<td>"+data.list[i].pw+"</td>"+
  					  		"<td>"+data.list[i].nickname+"</td>"+
  					  		"<td>"+data.list[i].name+"</td>"+
  					  		"<td>"+data.list[i].dob+"</td>"+
  					  		"<td>"+data.list[i].email+"</td>"+
  					  		"<td>"+data.list[i].tel+"</td>"+
  					  		"<td>"+data.list[i].point+"</td>"+
  					  		"<td>"+data.list[i].rank+"</td>"+
  					  		"<td><a href='/admin/memberUpdate?id="+data.list[i].id+"'>수정</a></td>"+
  					  		"<td><a href='/admin/memberDelete?id="+data.list[i].id+"' onclick='return memberDelete();'>삭제</a></td></tr>";
  				  }
 					  $("#list").html(tag);
						var numList = "";
						if(data.page <= 1) numList += '<a class="prev page-numbers">Prev</a>';
						else numList += '<a class="prev page-numbers" onclick="list('+(data.page-1)+')">Prev</a>';
						for(var i = data.startPage; i<=data.endPage; i++){
							if(data.page == i){
								numList += '<span class="page-numbers current">'+i+'</span>';
							}
							else{
								numList += '<a onclick="list('+i+')"><span class="page-numbers current">'+i+'</span></a>';
							}
						}
						if(data.page >= data.maxPage) numList += '<a class="next page-numbers">Next</a>';
						else numList += '<a class="next page-numbers" onclick="list('+(data.page+1)+')">Next</a>';
						$("#numList").html(numList);
  			  }
   		  },
  		  error:function(){
  			  alert("회원조회 에러");
  		  }
  	  });
      return false;
	}
	
	function memberDelete(){
		return confirm("삭제하시겠습니까?");
	}
	</script>

</body>

</html>