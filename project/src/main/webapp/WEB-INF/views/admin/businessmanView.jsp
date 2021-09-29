<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript">$.noConflict();</script>
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
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
    <style>
        .visual{ position: relative;}
        .visual button { position: absolute; z-index: 10; top: 50%;
                        transform: translateY(-50%); width: 71px; height: 71px;
                        border-radius: 100%; background: rgba(0,0,0,.3);
                        border: none;
                        }
        .visual button.slick-prev{left: 0; font-size: 0; color: transparent; top:100px;}
        .visual button.slick-next{right: 0; font-size: 0; color: transparent; top:100px;}

        .visual button.slick-prev:before{content: "\e93d"; font-family: 'xeicon';
                                        color: #fff; font-size: 45px;}
        .visual button.slick-next:after{content: "\e940"; font-family: 'xeicon';
                                        color: #fff; font-size: 45px;}
        img{
            width: 16.66%; height: 200px; float: left; 
        }
    </style>
<!-- bootstrap.min css -->
<link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
<!-- Icon Font Css -->
<link rel="stylesheet" href="../plugins/themify/css/themify-icons.css">
<link rel="stylesheet" href="../plugins/fontawesome/css/all.css">
<!-- <link rel="stylesheet"
   href="../plugins/magnific-popup/dist/magnific-popup.css"> -->
<!-- Owl Carousel CSS -->
<!-- <link rel="stylesheet" href="../plugins/slick-carousel/slick/slick.css"> -->
<!-- <link rel="stylesheet"
   href="../plugins/slick-carousel/slick/slick-theme.css"> -->

<!-- Main Stylesheet -->
<link rel="stylesheet" href="../css/style.css">

<!-- 내가 한거 -->
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
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
border-bottom: 1px solid black;
padding: 10px;
padding-bottom: 10px;
}
td{
border:1px solid black;
text-align:center;
padding: 10px;
}
</style>
<style>
      table{
      border: 1px solid gray;
      }
      .mainDiv{
      padding: 15px;
      }
      .subDiv{
      padding: 7px;
      border: 1px solid gray;
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
      
      
      
      
      
<!-- 시도는 여기부터 -->
      <link rel="stylesheet" type="text/css" href="css/reset.css">
      <link rel="stylesheet" type="text/css"
         href="css/jquery-responsiveGallery.css">
      <style type="text/css">
      html {
         background-color: #ffffff;
      }
      
      .w-gallery {
         margin-top: 80px;
      }
      </style>
      <script type="text/javascript" src="lib/modernizr.custom.js"></script>
      <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
      <script type="text/javascript" src="src/jquery.responsiveGallery.js"></script>
      <script type="text/javascript">
         $(function() {
            $('.responsiveGallery-wrapper').responsiveGallery({
               animatDuration : 400,
               $btn_prev : $('.responsiveGallery-btn_prev'),
               $btn_next : $('.responsiveGallery-btn_next')
            });
         });
      </script>
<!-- 시도는 여기까지 -->

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
                  <h1 class="text-capitalize mb-4 text-lg">사업자상품</h1>
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
<div class="ml-4 mt-4 mr-3" style="font-size: 20px;"><b>사업자 상품 리스트</b></div>            
<div class="mainDiv">
<div class="subDiv">
<!-- 시도는 여기부터 -->
<div class="w-gallery">
  <section id="responsiveGallery-container" class="responsiveGallery-container">
   <a class="responsiveGallery-btn responsiveGallery-btn_prev" href="javascript:void(0);"></a> 
   <a class="responsiveGallery-btn responsiveGallery-btn_next" href="javascript:void(0);"></a>
    <ul class="responsiveGallery-wrapper">
      <c:forEach items="${map.list}" var="businessView">
         <li class="responsiveGallery-item"> <a href="/product/product_list" class="responsivGallery-link"><img src="/productPicture/${businessView.picture}" height="320" width="320" alt="" class="responsivGallery-pic"></a>
           <div class="w-responsivGallery-info">
             <h2 class="responsivGallery-name">${businessView.name}</h2>
             <h3 class="responsivGallery-position"><fmt:formatNumber value="${businessView.price}" groupingUsed="true"/>원</h3>
           </div>
         </li>
      </c:forEach>
    </ul>
  </section>
</div>
<!-- 시도는 여기까지 -->
<hr>
<script type="text/javascript">
       $('.visual').slick();
</script>
    <div>
    <table style="display: block; overflow: auto; height: 500px; border-spacing: 0; margin-right: 5px; padding: 5px;">
      <colgroup>
         <col width="8%">
         <col width="14%">
         <col width="40%">
         <col width="40%">
      </colgroup>
      <thead>
         <tr>
            <th scope="col" style="border-bottom: 1px solid gray; padding: 5px;">상품번호</th>
            <th scope="col" style="border-bottom: 1px solid gray; padding:5px; text-align: left; padding-left: 7px;">상품이미지</th>
            <th scope="col" style="border-bottom: 1px solid gray; padding: 5px; vertical-align: top;">상품명</th>
            <th scope="col" style="border-bottom: 1px solid gray; padding: 5px;">가격</th>
         </tr>
      </thead>
      <tbody>
      <c:forEach items="${map.list}" var="businessView">
         <tr style="border: 1px solid gray;">
            <td style="border-collapse : collapse; vertical-align : middle;">${businessView.id}</td>
            <td><img src="/productPicture/${businessView.picture}" style="width: 40%; height: 40%;"></td>
            <td style="border-collapse : collapse; vertical-align : middle;">${businessView.name}</td>
            <td style="border-collapse : collapse; vertical-align : middle;"><fmt:formatNumber value="${businessView.price}" groupingUsed="true"/>원</td>
         </tr>
      </c:forEach>
      </tbody>
   </table>
   </div>
      <br>
   
               
               
               
               
         </div><!-- subDiv -->
      </div><!-- mainDiv -->
      <a href="/businessManager">◀┘<b>뒤로가기</b></a>
      <br>
      
   <!-- footer Start -->
   <%@include file="../layout/footer.jsp"%>
   <!-- footer Close -->
   <!-- 
    Essential Scripts
    =====================================-->
   <!-- Main jQuery -->
   <!-- <script src="plugins/jquery/jquery.js"></script>
   <script src="js/contact.js"></script> -->
   <!-- Bootstrap 4.3.1 
   <script src="plugins/bootstrap/js/popper.js"></script>
   <script src="plugins/bootstrap/js/bootstrap.min.js"></script>-->
   <!--  Magnific Popup
   <script src="plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>-->
   <!-- Slick Slider 
   <script src="plugins/slick-carousel/slick/slick.min.js"></script>-->
   <!-- Counterup -->
   <!-- <script src="plugins/counterup/jquery.waypoints.min.js"></script>
   <script src="plugins/counterup/jquery.counterup.min.js"></script> -->

   <!-- Google Map -->
   <!-- <script src="plugins/google-map/map.js"></script> -->
   <!-- <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>

   <script src="js/script.js"></script> -->
   
   <!-- id 숨기게하기...페이지소스에는 보여서 일단 이거로라도! -->
   <script>history.replaceState({}, null, location.pathname);</script>

</body>
</html>