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

<title>businessManager</title>

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


<!-- 내가 한거 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.container1 {
   margin: 0 auto;
   width: 80vw;
}

.flex-between {
   display: flex;
   justify-content: center;
}

.width-2vw {
   width: 2vw;
}

.width-4vw {
   width: 4vw;
}

th{
text-align:center;
background:#eee;
border-bottom: 1px solid gray;
padding: 10px;
padding-bottom: 10px;
}
td{
text-align:center;
padding: 10px;
}
tr{
border-bottom: 1px solid gray;
}
</style>
<style>
table{
border: 1px solid gray;
width: 100%;}
.mainDiv{
padding: 15px;
}
.subDiv{
padding: 7px;
}
.ti-search-btn{
width: 31px;
height: 31px;
margin-top: 6px;
margin-left: 3px;
}
.center{
margin-bottom: -15px;
}
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
                     <h1 class="text-capitalize mb-4 text-lg">사업자관리</h1>
                     <ul class="list-inline">
                        <li class="list-inline-item"><a href="/index"
                           class="text-white">Home</a></li>
                        <li class="list-inline-item"><span class="text-white">/</span></li>
                        <li class="list-inline-item"><a href="notice_list"
                           class="text-white-50">BusinessManager</a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </section>
      </div>
      <div class="ml-4 mt-4 mr-3" style="font-size: 20px; float: left;"><b>※ 요리어때 등록업체 목록 (총 : ${map.listCount}곳)</b></div>
       <div class="wrapper" style="display: flex;justify-content: flex-end;">
         <form action="/businessManager" name="search" method="post">
           <select name="category" id="category" style="float: left; height: 69%; margin-top: 20px; margin-right: 5px;">
             <option value="all">전체</option>
             <option value="name">사업자명</option>
             <option value="store_name">상호명</option>
           </select>
           <div class="title" style="float: left; margin-top: 20px; margin-right: 5px;">
             <input type="text" size="16" name="searchWord">
           </div>
           <button type="submit" class="mt-4 mr-4"><i class="fas fa-search"></i></button>
         </form>
       </div>
      <div class="mainDiv">
         <div class="subDiv">
            <table>
               <colgroup>
                  <col width="4%">
                  <col width="8%">
                  <col width="8%">
                  <col width="auto">
                  <col width="12%">
                  <col width="13%">
               </colgroup>
               <thead>
                  <tr>
                     <th scope="col">번호</th>
                     <th scope="col">상호명</th>
                     <th scope="col">사업자명</th>
                     <th scope="col">매장주소</th>
                     <th scope="col">매장번호</th>
                     <th scope="col">이메일</th>
                     <th scope="col">상품정보</th>
                  </tr>
               </thead>
               <tbody>
               <!-- forEach 시작부분 -->
               <c:forEach items="${map.list}" var="businessList">
                  <%-- <input type="text" name="businessId" value="${businessList.id}"> --%>
                  <tr>
                     <td class="pl-1">${businessList.sid}</td>
                     <td>${businessList.store_name}</td>
                     <td>${businessList.name}</td>
                     <td>${businessList.store_addr}</td>
                     <td>${businessList.store_tel}</td>
                     <td>${businessList.email}</td>
                     <td><a href="#" onclick="location.href=('businessmanView?id=${businessList.id}')">상품목록</a></td>
               <!-- <td><button type="button" class="idgo_btn">└▶상품목록</button></td> -->
                     
                  </tr>
               </c:forEach>
               <!-- forEach 끝부분 -->
               </tbody>
            </table>
         </div><!-- subDiv -->
      </div><!-- mainDiv -->
      <!-- 하단 넘버링 Start -->
            <div class="row justify-content-center mt-5">
               <div class="col-lg-6 text-center">
                  <nav class="navigation pagination d-inline-block">
                     <div class="nav-links">
                     <c:if test="${map.page == 1 }">
                        <a class="prev page-numbers">◀◀</a>
                     </c:if>
                     <c:if test="${map.page != 1 }">
                        <a class="prev page-numbers" href="businessManager?page=1&category=${map.category}&searchWord=${map.searchWord}">◀◀</a>
                     </c:if>
                     
                     <c:if test="${map.page <= 1 }">
                        <a class="prev page-numbers">◀</a>
                     </c:if>
                     <c:if test="${map.page > 1 }">
                        <a class="prev page-numbers" href="businessManager?page=${map.page-1}&category=${map.category}&searchWord=${map.searchWord}">◀</a>
                     </c:if>
                     
                     <!-- 하단넘버링 1,2,3,4...maxpage -->
                     <c:forEach var="nowpage" begin="${map.startpage}" end="${map.endpage}">
                        <c:if test="${map.page == nowpage}">
                           <span aria-current="page" class="page-numbers current">${nowpage}</span>
                        </c:if>
                        <c:if test="${map.page != nowpage}">
                           <a class="prev page-numbers" href="businessManager?page=${nowpage }&category=${map.category}&searchWord=${map.searchWord}">${nowpage}</a>
                        </c:if>
                     </c:forEach>
                     
                     <c:if test="${map.page >= map.endpage}">
                        <a class="prev page-numbers">▶</a>
                     </c:if>
                     <c:if test="${map.page < map.endpage}">
                        <a class="prev page-numbers" href="businessManager?page=${map.page+1}&category=${map.category}&searchWord=${map.searchWord}">▶</a>
                     </c:if>
                     
                     <c:if test="${map.page == map.maxpage}">
                        <a class="prev page-numbers">▶▶</a>
                     </c:if>
                     <c:if test="${map.page != map.maxpage}">
                        <a class="prev page-numbers" href="businessManager?page=${map.maxpage }&category=${map.category}&searchWord=${map.searchWord}">▶▶</a>
                     </c:if>
                     </div>
                  </nav>
               </div>
            </div>
            <!-- 하단 넘버링 Close -->
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
   <!-- Google Map -->
   <script src="plugins/google-map/map.js"></script>
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>
   <script src="js/script.js"></script>
   <!-- <script>
      
         $(document).ready(function(){
            $('.idgo_btn').on('click',function(){
            var id=$('input[name=businessId]').val();
            alert(id);
               location.href='/businessmanView?id='+id;
            });
         });
      
   </script> -->
   
   
   <!-- id 숨기게하기...페이지소스에는 보여서 일단 이거로라도! -->
   <script>history.replaceState({}, null, location.pathname);</script>


</body>
</html>