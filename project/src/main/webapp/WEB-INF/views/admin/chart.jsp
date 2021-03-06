<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zingchart</title>
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

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- kiwon -->
<style>
#myChart {
	border: solid 1px #664E38;
	width: 95%;
	padding: 10px; position : relative;
	left: 2.5%;
	position: relative;
}

table {
	border: 1px solid #664E38;
	background: #fff
		url("http://kukie.net/blog/wp-content/uploads/2019/01/blogger_bg_table.png")
		repeat-x left top;
	font-size: 100%;
	color: #664E38;
	width: 100%;
	margin-left: 60px;
}

th, td {
	border: 1px solid #664E38;
	border-width: 1px 0 0 0;
	padding: 5px 10px;
	font-size: 93%;
	line-height: 1.5em;
	text-align: center;
}
td{
border: 1px solid #664E38;}
th {
	border: 1px solid #664E38;
	background: #fff;
	padding-left: 5px;
	font-size: 100%;
	color: #664E38;
	text-align: center;
}

h3 {
	color: #664E38;
	margin-left: 80px;
}
</style>
</head>
<body>
	<!-- Header Start -->
	<%@include file="../layout/header.jsp"%>
	<!-- Header Close -->
	<div class="main-wrapper ">
		<section class="page-title bg-1">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="block text-center">
							<!-- <span class="text-white">Our blog</span> -->
							<h1 class="text-capitalize mb-4 text-lg">?????? ??? ????????????</h1>
							<ul class="list-inline">
								<li class="list-inline-item"><a href="/index"
									class="text-white">Home</a></li>
								<li class="list-inline-item"><span class="text-white">/</span></li>
								<li class="list-inline-item"><a href="notice_list"
									class="text-white-50">chart</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div class="mt-4 mr-3"
		style="font-size: 20px; margin-left: 40px; margin-bottom: -5px; color:#664E38;">
		<b>??? ?????? ??? ????????????</b>
	</div>
	<br>
	<div id="myChart"></div>
	<br>
	<br>

	<!-- Summary -->
	<h3>Summary(????????????)</h3>
	<div style="width:94%; height: 160px; border: 1px solid #664E38; margin-right: 55px; margin-left: 60px; background: #fffff0;">
	<table class="mr-3 mt-4"
		style="text-align: center; width: 94%; height: 100px;">
		<tr>
			<th rowspan="2">??????( Y : ?????? | N : ?????? )</th>
			<th rowspan="2">??? ????????????</th>
		</tr>
		<tr>
			<th>??????</th>
		</tr>
		<c:forEach items="${orderView.tableSummary }" var="tableSummary">
			<tr>
				<td>${tableSummary.refund_flag}</td>
				<td>??? ${tableSummary.totalAmount }???</td>
				<td><fmt:formatNumber value="${tableSummary.totalPrice }"
						groupingUsed="true" /></td>
			</tr>

		</c:forEach>


		<!--------------------------------------------------------------------------------------->

	</table>
	</div>
	<br>
	<!-- List -->
	<h3>List(???????????????)</h3>
	<div style="width:94%; height: 250px; overflow: auto; padding: 20px; border: 1px solid #664E38; margin-right: 55px; margin-left: 60px; background: #fffff0;">
	<table id="mytable" class="mt-4"
		style="text-align: center; width: 93%; box-sizing: border-box;">
		<tr>
			<th rowspan="2">??????</th>
			<th rowspan="2">?????????</th>
			<th rowspan="2">????????????</th>
			<th colspan="2">??????</th>
			<!-- <th colspan="2">??????</th> -->
			<th colspan="2">??????</th>
		</tr>
		<tr>
			<th>??????</th>
			<th>??????</th>
			<th>??????</th>
			<th>??????</th>
		</tr>
		<c:forEach items="${orderView.tableList }" var="tableList"
			varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td>${tableList.name }</td>
				<!-- ????????? -->
				<td class="sum1">${tableList.totalAmount }</td>
				<!-- ??? ???????????? -->
					<c:if test="${tableList.refund_flag != 'Y' }">
						<!--??????????????? ??????????????? ??? ?????????????????? ??????-->
						<td class="sum2">${tableList.totalAmount }</td>
						<td class="sum3"><fmt:formatNumber value="${tableList.totalPrice }" groupingUsed="true"/></td>
						<td>-</td>
						<td>-</td>
					</c:if>
					<c:if test="${tableList.refund_flag == 'Y' }">
						<!--??????????????? ????????? ??? ?????????????????? ??????-->
						<td>-</td>
						<td>-</td>
						<td class="sum4">${tableList.refundAmount }</td>
						<td class="sum5"><fmt:formatNumber value="${tableList.refundPrice }"
								groupingUsed="true" /></td>
					</c:if>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="2">??????</td>
			<td class="sumOne"><span></span></td>
			<td class="sumTwo"></td>
			<td class="sumThree"></td>
			<td class="sumFour"></td>
			<td class="sumFive"></td>
		</tr>
	</table>
	</div>
	<br>
	<br>
	<script type="text/javascript">
	
	$(document).ready(function(){
	//List???????????? ??????
	var sum1=0;
	$('#mytable .sum1').each(function(){
		sum1 += parseInt(this.innerText);
		});
		$(".sumOne").text(sum1);
	//List???????????? ??????
	var sum2=0;
	$('#mytable .sum2').each(function(){
		sum2 += parseInt(this.innerText);
		});
		$(".sumTwo").text(sum2);
	//List???????????? ??????
	var sum3=0;
	$('#mytable .sum3').each(function(){
		sum3 += parseInt(this.innerText.replace(",",""));
		});
		$(".sumThree").text(sum3);
	//List???????????? ??????
	var sum4=0;
	$('#mytable .sum4').each(function(){
		sum4 += parseInt(this.innerText);
		});
		$(".sumFour").text(sum4);
	//List???????????? ??????
	var sum5=0;
	$('#mytable .sum5').each(function(){
		sum5 += parseInt(this.innerText.replace(",",""));
		});
		/* sum5.replace(/(|d)(?:|d{3})+(?!|d))/g,'$1,'); */
		$(".sumFive").text(sum5);
	
	
	
	
	
	
	});
	</script>



	<%-- <h3 class="ml-5">List</h3>
<table class="ml-5 mt-4">
	<tr>
		<th>????????????</th>
		<th>????????????</th>
		<th>????????????</th>
	</tr>
	<c:forEach items="${orderView.list }" var="list">
		<tr>
			<td>${list.year }??? ${list.month }???</td>
			<td>${list.totalAmount }???</td>
			<td><fmt:formatNumber value="${list.totalPrice}" groupingUsed="true" />???</td>
		</tr>
	</c:forEach>
</table> --%>
	<!-- footer Start -->
	<%@include file="../layout/footer.jsp"%>
	<!-- footer Close -->
</body>
<!-- Just before the closing body tag is best -->
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
<script>zingchart.render({
	id: 'myChart',
	data: {
		"type": "bar",
		"title": {
			"text": "?????? 6?????? ??????(M = 10???6)"
		},
		"plot": {
			"value-box": {"text": "%v"},
			"tooltip": {"text": "%v"},
			"value-box":{"thousands-separator":","}
		},
		"scale-x": {
			"values":
			[
				<c:forEach items="${orderView.list}" var="list" varStatus="status">
					<c:if test="${!status.last}">
							"${list.month}???",
					</c:if>
					<c:if test="${status.last}">
							"${list.month}???"
					</c:if>
				</c:forEach>
			]
			
			
		},
		"scale-y": {
		      "short": true,
		      "short-unit": "M",
		      "thousands-separator": ","
		    },
		    "plot": {
		      "value-box": {
		        "thousands-separator": ","
		      }
		    },
		"series": [
			{"values": [
				<c:forEach items="${orderView.list}" var="list" varStatus="status">
					<c:if test="${!status.last}">
							${list.totalPrice},
					</c:if>
					<c:if test="${status.last}">
							${list.totalPrice}
					</c:if>
				</c:forEach>
				],
				
				"background-color":"#ff4f4b",
				}
		]
	}
});
</script>


</html>