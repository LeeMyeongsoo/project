<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="megakit,business,company,agency,multipurpose,modern,bootstrap4">

	<meta name="author" content="themefisher.com">

	<title>회원가입</title>

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
	<jsp:include page="./layout/header.jsp"></jsp:include>
	<!-- Header Close -->

	<section class="page-title bg-1">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block text-center">
						<h1 class="text-capitalize mb-4 text-lg">회원가입</h1>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- form -->
	<section class="section bg-white">
		<div class="container1">
			<form action="/member/register" method="POST" id="regForm" onsubmit="return checkAll();">

				<!-- 히든 인풋 -->
				<input type="hidden" name="dob" id="dob">
				<input type="hidden" name="email_flag" id="email_flag" value="N">
				<input type="hidden" name="sms_flag" id="sms_flag" value="N">
				<input type="hidden" name="point" id="point" value="0">
				<input type="hidden" name="rank" id="rank">
				<input type="hidden" name="picture" id="picture">
				<input type="hidden" name="open_hour" id="open_hour">
				<input type="hidden" name="close_day" id="close_day">
				<input type="hidden" name="order_way" id="order_way">
				<input type="hidden" name="delivery_fee" id="delivery_fee" value="0">
				<input type="hidden" name="delivery_area" id="delivery_area">
				<input type="hidden" name="store_picture" id="store_picture">

				<!-- 고르기 -->
				<div class="type">
					<button type="button" id="member-tab" class="tab-button tab-button-selected">
						<h3>일반회원</h3>
					</button>
					<button type="button" id="company-tab" class="tab-button">
						<h3>사업자 회원</h3>
					</button>
				</div>

				<div class="register">

					<!-- 일반회원  -->
					<!-- 계정 -->
					<div class="acc">
						<h3><label for="id" class="form_label">아이디</label></h3>
						<input type="text" name="id" id="id" class="form_input" onblur="check_id();"><br><span id="id_text"
							class="check_text"></span>
						<h3><label for="pw" class="form_label">비밀번호</label></h3>
						<input type="password" name="pw" id="pw" class="form_input" onblur="check_pw();"><br><span id="pw_text"
							class="check_text"></span>
						<h3><label for="re_pw" class="form_label">비밀번호 재확인</label></h3>
						<input type="password" name="re_pw" id="re_pw" class="form_input" onblur="check_re_pw();"><br><span
							id="re_pw_text" class="check_text"></span>
						<h3><label for="nickName" class="form_label">닉네임<span><small>(선택)</small></span></label></h3>
						<input type="text" name="nickname" id="nickName" class="form_input" onblur="check_nickName();"><br><span
							id="nickName_text" class="check_text"></span>
					</div>

					<!-- 개인정보 -->
					<div class="info">
						<h3><label for="name" class="form_label">이름</label></h3>
						<input type="text" name="name" id="name" class="form_input" onblur="check_name();"><br><span id="name_text"
							class="check_text"></span>

						<h3><label for="" class="form_label">생년월일</label></h3>
						<input type="text" id="year" maxlength="4" placeholder="년(4자)" class="form_input_30" onblur="check_dob();">
						<select id="month" class="form_input_30" onchange="check_dob();">
							<option value="" selected>월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						<input type="text" id="day" maxlength="2" placeholder="일" class="form_input_30"
							onblur="check_dob();"><br><span id="dob_text" class="check_text"></span>

						<h3><label for="" class="form_label">성별</label></h3>
						<select name="gender" id="" class="form_input">
							<option value="N" selected>선택안함</option>
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select><br>

						<h3><label for="email" class="form_label">본인 확인 이메일<span><small>(선택)</small></span></label></h3>
						<input type="text" name="email" id="email" placeholder="선택입력" class="form_input"
							onblur="check_email();"><br><span id="email_text" class="check_text"></span>
					</div>

					<!-- 휴대전화 -->
					<div>
						<h3><label for="hp" class="form_label">휴대전화</label></h3>
						<input type="tel" name="tel" id="tel" maxlength="11" placeholder="전화번호 입력" onblur="check_tel();" class="form_input_70">
						<button type="button" class="btn1" onclick="smsCerti();">인증번호받기</button><br>
						<input type="text" name="" id="" readonly class="form_input" placeholder="인증번호를 적어주세요"><br><span id="tel_text" class="check_text"></span>
					</div>

					<!-- 주소 -->
					<div class="member">
						<h3><label for="" class="form_label">주소</label></h3>
						<input type="text" name="" id="postcode" class="form_input_30" readonly placeholder="우편번호"><button type="button" class="btn1" onclick="addrAPI();">우편등록</button><br>
						<input type="text" name="addr" id="addr" class="form_input" readonly placeholder="주소">
						<input type="text" name="addr1" id="addr1" class="form_input" placeholder="상세주소" onblur="check_addr();"><br><span id="addr_text" class="check_text"></span>
					</div>
					<!-- END 일반회원 -->

					<!-- 사업자용 -->
					<div class="company">
						<h3><label for="store_name" class="form_label">상호명</label></h3>
						<input type="text" name="store_name" id="store_name" class="form_input" onblur="check_store_name();"><br><span id="store_name_text" class="check_text"></span>
						<h3><label for="store_addr" class="form_label">매장 주소</label></h3>
						<input type="text" name="" id="store_postcode" class="form_input_30" readonly placeholder="우편번호"><button type="button" class="btn1" onclick="store_addrAPI();">우편등록</button>
						<input type="text" name="store_addr" id="store_addr" class="form_input" readonly placeholder="주소">
						<input type="text" name="store_addr1" id="store_addr1" class="form_input" placeholder="상세주소" onblur="check_store_addr();"><br><span id="store_addr_text" class="check_text"></span>
						<h3><label for="store_tel" class="form_label">매장 전화번호</label></h3>
						<input type="tel" name="store_tel" id="store_tel" class="form_input" onblur="check_store_tel();"><br><span id="store_tel_text" class="check_text"></span>
						<h3><label for="" class="form_label">사업자 등록번호</label></h3>
						<input type="text" name="" id="" class="form_input_70">
						<button type="button" class="btn1">인증하기</button>
					</div>

				</div>

				<!-- 약관동의 -->
				<div class="term">
					<div class="term_main">
						<label><input type="checkbox" name="" id="checkBoxAll" class=""><span>&emsp;약관 모두 동의하기</span></label>
					</div>
					<div class="term_sub">
						<label><input type="checkbox" name="" id="" class="checkBoxRequired checkBoxOne">&emsp;만 14세 이상입니다.<span>&nbsp;(필수)</span></label>
					</div>
					<div class="term_sub">
						<div class="flexbox">
							<label><input type="checkbox" name="" id="" class="checkBoxRequired checkBoxOne">&emsp;서비스 이용 약관<span>&nbsp;(필수)</span></label>
							<button type="button" class="term_toggle">내용보기</button>
						</div>
						<div class="term_text">
							<textarea readonly class="term_area" id="" cols rows
								title="개인회원 서비스 이용 약관 안내 내용">제 1장 총칙

제 1 조 (목 적)
	
이 약관은 ㈜다나와 (전자상거래 사업자)가 운영하는 인터넷 서비스 "다나와" (www.danawa.com) 및 다나와 관련 제반 서비스 사이트(접속 가능한 유,무선 단말기의 종류와는 상관없이 이용 가능한 '회사' 가 제공하는 모든 "서비스" 를 의미하며, 이하 '사이트'라 함)에서 제공하는 상품 및 가격정보 등 상품에 대한 정보 제공 및 광고서비스를 이용함에 있어 '회사' 와 이용자의 권리와 의무 및 책임사항 등을 규정함을 그 목적으로 합니다.
	
제 2 조 (정의)
	
① '회사' 란 ㈜다나와가 재화 또는 용역(이하 '상품'이라 함) 및 서비스를 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 상품을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 '회사' 를 운영하는 사업자의 의미로도 사용합니다.
② '서비스' 란 '회사' 와 계약을 통하여 입점 및 제휴한 쇼핑몰들의 상품 및 가격정보를 비교하여 회원의 구매를 돕는 서비스 및 기타 각종 서비스를 의미합니다
③ '이용자'란 '회사' 에 접속하여 이 약관에 따라 '회사' 가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
④ '회원'이라 함은 '회사' 에 개인정보를 제공하여 회원등록을 한 자로서, '회사' 의 정보를 지속적으로 제공받으며, '회사' 가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
⑤ '비회원'이라 함은 회원에 가입하지 않고 '회사' 가 제공하는 서비스를 이용하는 자를 말합니다.
⑥ '상품정보' 란 '회사' 가 보유한 웹 페이지 형태의 텍스트, 음성, 화상, 이미지 등의 각종 데이터를 지칭하며 보유 유형은 다음 각호와 같습니다.
가. '회사' 가 자체 제작한 경우
나. '회사' 가 계약 등을 통해 "업체회원" 이외의 업체로부터 확보한 경우
다. '회사' 가 "업체회원" 으로부터 제공받은 경우
⑦ '가격정보' 란 '회사' 가 이용자에게 고지하는 상품의 가격을 말합니다.
	
제 3 조 (약관의 명시와 개정)
	
① '회사' 는 이 약관의 내용과 상호 및 대표자의 성명, 영업소 소재지, 사업자등록번호, 통신판매업신고번호, 개인정보보호책임자, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 쉽게 알 수 있도록 '회사' 의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
② '회사' 는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 구매취소ㆍ배송책임ㆍ환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
③ '회사' 는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의규제등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용 촉진 및 정보보호등에 관한 법률, 방문판매등에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
④ '회사' 는 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 '회사' 의 초기화면에 그 적용일자 15일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관 내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 '회사' 는 개정 전과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
⑤ '회사' 는 전자거래기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호등에 관한 법률 등 관계법령을 위배하지 않는 범위에서 합리적 사유가 있는 경우 회원의 사전 동의 없이 본 약관을 개정할 수 있습니다.
⑥ '회사' 는 개정된 약관의 공지 후 효력발생일 이전까지 거부 의사 표시 또는 탈퇴를 하지 않을 경우 개정 약관에 동의하는 것으로 간주합니다. 회원이 개정약관의 적용에 동의하지 않는 경우 '회사' 는 개정 약관의 내용을 적용할 수 없으며, 이 경우 '회사' 또는 회원은 이용계약을 해지할 수 있습니다.
⑦ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계 법령 또는 상관례에 따릅니다.

제 2장 서비스의 제공

제 4 조 (서비스의 제공 및 변경)
	
① '회사' 는 다음과 같은 업무를 수행합니다.
가. 재화 또는 용역(이하 상품이라 함)에 대한 정보 제공 및 구매계약의 체결
나. 구매계약이 체결된 상품의 배송
다. 게시판형 서비스
라. 기타 '회사' 가 정하는 업무
② '회사' 는 상품의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화/용역의 내용을 변경할 수 있으며 해당 사항을 공지합니다.
③ '회사' 가 제공하기로 한 이용자와 계약을 체결한 서비스의 내용을 상품의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 통지합니다. 단, '회사' 에 입점한 판매점에서 제공하는 상품이 품절 또는 사양의 변경 등이 있을 경우 통지의 의무는 해당 판매점에게 있습니다.
④ 전항의 경우 '회사' 는 이로 인하여 이용자가 입은 손해를 배상합니다. 단, '회사' 의 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

제 5 조 (서비스의 중단)

① '회사' 는 긴급한 시스템 점검, 증설 및 교체 등 부득이한 사유로 인하여 예고 없이 일시적으로 서비스를 중단할 수 있으며, 새로운 서비스의 교체 등 '회사' 가 적절하다고 판단하는 사유에 의하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다.
② 사업 종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 '회사' 는 제8조에 정한 방법으로 이용자에게 통지합니다.
③ '회사' 는 서비스를 특정 범위로 분할하여 각 범위 별로 이용가능 시간을 별도로 지정할 수 있습니다. 다만 이 경우 그 내용을 공지합니다.

제 3장 회원의 가입 및 탈퇴

제 6조 (회원가입)

① 이용자는 '회사' 가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
②'회사' 는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
가. 만 14세 미만인 자
나. 회원가입 신청자가 과거 회원 자격을 상실한 적이 있는 경우('회사' 로부터 회원자격의 제재조치를 받고 임의탈퇴 또는 강제탈퇴 한 경우를 포함)
다. 회원 가입 시 기재한 내용에 허위, 누락, 오기가 있는 경우
라. 기타 회원으로 가입하는 것이 '회사' 가 제공하는 서비스에 현저한 지장이 있다고 판단되는 경우
③회원가입의 성립시기는 '회사' 의 이용 승낙의 의사가 해당 서비스화면에 게시하거나, email 또는 기타 '회사' 가 정하는 방법으로 이용자에게 도달한 시점으로 합니다.
④회원은 제16조 제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 또는 기타 방법으로 '회사' 에 그 변경사항을 알려야 합니다.
⑤회원이 이용계약 종료(해지 포함) 후 재가입하는 경우에는 최종 탈퇴 시의 아이디를 재사용할 수 없으며, 30일 이후 새로운 아이디로 재가입이 가능합니다.

제 7 조 (회원탈퇴 및 자격상실)

① 회원은 '회사' 에 언제든지 탈퇴를 요청할 수 있으며 '회사' 는 즉시 회원탈퇴를 처리합니다.
② 회원이 다음 각 호의 사유에 해당하는 경우, '회사' 는 회원 자격을 제한 및 정지시킬 수 있습니다.
가. 가입 신청 및 회원정보 변경 시 허위 내용을 등록한 경우
나.'회원' 의 행위로 인하여 '회사' 의 신용도 및 대외적 이미지가 저해된 경우
다. 타인의 '회사' 이용을 방해하거나 타인의 정보를 도용하는 등 전자거래질서를 위협하는 경우
라. '회사' 의 운영진, 임직원 또는 관계자를 사칭하는 경우
마. '회사' 의 서비스 운영에 고의 또는 과실로 불이익을 주거나 방해를 하는 경우
바. 타인의 명예를 훼손하거나 모욕하는 경우
사. 법령 또는 이 약관에서 금지하거나 공서양속에 반하는 행위를 하는 경우
③ 회원은 전 항의 귀책사유로 인하여 '회사' 나 다른 회원 및 이용자에게 입힌 손해를 배상할 민사상의 책임이 있으며, 범죄 행위에 대해서는 형사 상의 책임을 부담합니다.
④ '회사' 는 회원 자격을 제한/정지 시킨 후, 동일한 행위가 반복되거나 상당기간 그 사유가 시정되지 아니하는 경우 '회사' 는 회원자격을 상실 시킬 수 있습니다.
⑤ '회사' 는 회원의 자격을 상실 시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

제 8 조 (회원에 대한 통지)

① '회사' 는 회원에 대한 통지를 하는 경우, 회원이 '회사' 와 미리 약정하여 지정한 전자우편 주소를 원칙으로 하며 전화, 팩스 등 유, 무선 연락처로도 통지할 수 있습니다.
② '회사' 는 불특정다수 회원에 대한 통지의 경우 1주일 이상 '회사' 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별 통지합니다.
③ '회원' 이 '회사' 에 통지하는 경우에는 고객센터 페이지 상에 게재된 절차와 내용에 따라야 합니다. '회사' 는 '회원' 이 이러한 통지 절차 또는 내용을 준수하지 않는 경우 통지를 수령하지 아니하며, 이로 인하여 발생하는 모든 문제에 대한 책임은 '회원' 이 부담하여야 합니다.

제 9 조 (대리행위 및 보증인의 부인)

① '회사' 는 구매자와 판매자 간의 자유로운 상품의 거래를 위한 시스템을 운영 및 관리, 제공할 뿐이므로 구매자 또는 판매자를 대리하지 않으며, 이용자 사이에 성립된 거래에 관련된 책임과 회원이 제공한 정보에 대한 책임은 해당 이용자가 직접 부담하여야 합니다.
② '회사' 를 이루어지는 구매자와 판매자 간의 거래와 관련하여 판매 의사 또는 구매 의사의 존부 및 진정성, 등록 상품의 품질, 완전성, 안정성, 적법성 및 타인의 권리에 대한 비침해성, 구매자 또는 판매자가 입력하는 정보 및 그 정보를 통하여 링크된 URL에 게재된 자료의 진실성 또는 적법성 등 일체에 대하여 보증하지 아니하며, 이와 관련한 일체의 위험과 책임은 해당 이용자가 전적으로 부담합니다.

제 4장 서비스 이용

제 10 조 (구매 신청)

① 이용자는 '회사' 의 서비스상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, '회사' 는 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.
가. 상품의 검색 및 선택
나. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
다. 약관 내용, 청약철회권이 제한되는 서비스, 배송료ㆍ설치비 등의 비용부담과 관련한 내용에 대한 확인
라. 이 약관에 동의하고 위3호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
마. 상품의 구매신청 및 이에 관한 확인 또는 '회사' 의 확인에 대한 동의
바. 결제 방법의 선택
② 이용자는 상품을 구매하기 전에 반드시 판매자가 사이트 내에 작성한 상품정보와 거래의 조건을 정확하게 확인한 후 구매를 하여야 합니다. 구매하려는 상품의 내용과 거래의 조건을 확인하지 않고 구매하여 발생한 모든 손실, 손해는 이용자 본인에게 있습니다.
③ '회사' 는 판매자가 상품 등록한 상품의 내용과 거래조건에 대해서 어떠한 보증이나 대리를 하지 않습니다. 따라서 구매자는 상품 구매 시 스스로의 책임하에 상품을 구매하여야 합니다.
④ '회사' 가 이용자의 서비스 이용 편의를 위하여 직접 제작하거나 제휴업체 또는 제3자가 제공하는 방식으로 정보나 콘텐츠를 제공하는 경우라도, 이용자는 상품 구매 시 자신의 판단과 책임으로 결정하여 구매하여야 하며, '회사' 는 어떠한 경우에도 회원의 구매결정에 대하여 책임을 부담하지 않습니다.
⑤ 미성년자의 상품구매 시 법정 대리인이 해당 계약에 대하여 동의를 하지 아니하면, 미성년자 본인 또는 법정대리인이 그 계약을 취소 할 수 있습니다. 미성년자의 거래에 관한 상세한 사항은 관련 법령이 정한 바에 의합니다.

제 11 조 (계약의 성립)
	
① '회사' 는 제9조와 같은 구매 신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다.
가. 신청 내용에 허위, 기재 누락, 오기가 있는 경우
나. 기타 구매 신청에 승낙하는 것이 '회사' 의 기술상 현저히 지장이 있다고 판단하는 경우
② '회사' 의 승낙이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
③ '회사' 의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능여부, 구매신청의 정정, 취소 등에 관한 정보 등을 포함하여야 합니다.

제 12 조 (지급방법)

① '회사' 에서 구매한 상품에 대한 대금지급방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. 단, '회사' 는 이용자의 지급방법에 대하여 상품의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
가. 가상계좌 (현금 입금)
나. 신용카드 등의 각종 카드 결제
다. 기타 전자적 지급방법에 의한 대금 지급 등
② 이용자는 상품의 구매 시 결제방법을 사용함에 있어 반드시 본인 명의의 결제수단을 사용하여야 하며, 타인의 결제수단의 임의 사용 등을 하여서는 안 됩니다. 타인의 결제수단을 임의 사용함으로써 발생하는 '회사' 결제수단 소유자, 판매자의 손실과 손해에 대한 모든 책임은 구매자인 이용자에게 있습니다.
③ '회사'는 이용자가 매매대금 결제 시 사용한 결제 수단에 대해 정당한 사용권한을 가지고 있는지의 여부를 확인할 수 있으며, 이에 대한 확인이 완료될 때까지 거래 진행을 중지하거나 해당 거래를 취소할 수 있습니다

제 13 조 (수신확인통지, 구매신청 변경 및 취소)

① '회사' 는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인 통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고, '회사' 는 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만, 이미 대금을 지불한 경우에는 제16조의 청약철회 등에 관한 규정에 따릅니다.
③ 이용자가 구매(주문)신청일로부터 7일 이내 상품 대금에 대해 입금이 확인되지 않을 경우 '회사' 는 별도 의사 표시 없이 구매계약을 해제하는 것으로 처리할 수 있습니다.

제 14 조 (상품의 공급)

① '회사' 는 직접 제공하는 상품에 대하여 이용자와 공급시기에 관한 별도의 약정이 없는 이상 이용자가 청약을 한 날로부터 7일 이내에 상품을 배송 할 수 있도록 필요한 조치를 취합니다. 다만, '회사' 는 이미 상품의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 '회사' 는 이용자가 상품의 공급 절차 및 진행사항을 확인할 수 있도록 적절한 조치를 합니다.
② '회사' 는 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다.
③ '회사' 와 이용자간에 상품의 인도시기 또는 용역의 제공 시기에 관하여 별도의 약정이 있는 경우에는 당해 약정이 이 약관에 우선합니다.

제 15 조 (상품의 배송)

① '회사' 는 이용자가 상품을 구매한 경우 이용자의 결제에 대한 통지를 판매자로부터 받은 후 3영업일 이내에 배송을 개시할 수 있도록 합니다.
② 상품을 운송할 경우 이용자가 물품을 수령하기까지의 위험은 '회사' 가 부담합니다. 이에 따라 '회사' 는 이용자가 하자(파손, 멸실, 부패 등)없는 물품을 수령할 수 있도록 물품의 포장, 운송업체의 선정, 기타 필요한 조치를 하여야 합니다.
③ 정확한 배송을 위해 이용자의 배송관련 정보는 개인정보처리방침에 의하여 판매자에게 제공될 수 있으며, '회사' 는 상품의 배송 이외의 목적으로 해당 정보를 사용하지 않습니다.
④ 공휴일 및 기타 휴무일 또는 천재지변 등 불가피한 사유가 있는 경우 배송 소요기간은 지연될 수 있습니다.

제 16 조 (상품의 교환, 반품, 환불)

① 상품의 교환은 배송완료일을 기준으로 7영업일 이내에 교환 요청을 하여야 합니다. 교환 요청일이 지난 경우에는 판매자와 직접 처리하여야 합니다.
② 구매자는 ' 전자상거래 등에서의 소비자보호에 관한 법률' 제17조에 의해, 구매한 상품을 배송 받은 후 7일 이내에 반품 또는 교환을 요청할 수 있으며, 반품에 관한 일반적인 사항은 ' 전자상거래 등에서의 소비자보호에 관한 법률' 등 관련 법령이 판매자가 제시한 조건보다 우선합니다. 단, 다음 각 호의 경우에는 구매자가 반품 또는 교환을 요청할 수 없습니다.
가. 구매자의 귀책사유로 말미암아 상품이 훼손된 경우
나. 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우
다. 시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우
라. 복제가 가능한 상품의 포장을 훼손한 경우
마. 기타 구매자가 환불 또는 교환을 요청할 수 없는 합리적인 사유가 있는 경우
③ 반품이 필요한 상품은 반품을 요청한 시점으로부터 3영업일 이내에 구매한 판매점으로 반품하여야 합니다.
④ '회사' 의 귀책사유로 인해 발생한 반품의 경우 배송에 필요한 모든 비용을 '회사' 가 부담합니다.
⑤ 구매자의 단순 변심 또는 구매자 귀책사유로 인해 발생하는 반품의 경우 배송에 필요한 모든 비용을 구매자가 부담합니다.
⑥ 환불 승인은 개별 판매자가 직접 처리하며 판매자의 환불승인일을 기준으로 현금결제의 경우 1영업일 후, 카드결제의 경우 카드사에 따라 5~7영업일 후 환불 및 승인 취소가 이루어 집니다.
⑦ '회사' 는 판매자가 교환, 반품에 대하여 사실확인 진행 절차에 적극적으로 임하지 않거나 지연하는 경우 구매자에게 교환 또는 반품의 원인을 파악한 후 해당 거래를 취소하여 구매자에게 보관중인 결제대금을 환불할 수 있습니다.
⑧ '회사' 는 구매자의 교환 또는 반품의 요청이 정당하지 않다고 판단하는 경우는 구매자의 의사표시를 취소하여 보관중인 결제대금을 판매자에게 지급할 수 있습니다. 또한 구매자의 교환, 반품 등이 접수된 날로부터 14일이 경과할 때까지 기 수령한 상품을 판매자에게 반환하지 않거나 연락(전화, 이메일 등)이 되지 않는 경우에는 교환, 반품의 의사를 철회한 것으로 간주하여 보관중인 결제대금을 판매자에게 지급할 수 있습니다.
⑨ 판매된 상품의 취소, 반품, 교환, 환불과 관련한 업무 주체는 판매자이며 그에 따른 책임도 판매자에게 있으며, '회사' 는 취소, 반품, 교환, 환불 업무를 처리할 수 있는 시스템만을 제공 합니다.
⑩ 정상적으로 구매 결정된 이후 발생하는 문제에 대해서는 구매자가 판매자와 직접 처리 합니다.

제 17 조 (청약철회 등)

① '회사' 와 상품 등의 구매에 관한 계약을 체결한 이용자는 상품 배송이 완료된 날로부터 7일 이내에 청약을 철회할 수 있습니다.
② 구매자는 상품을 배송 받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
가. 구매자에게 책임 있는 사유로 상품이 멸실 또는 훼손된 경우
(다만, 상품의 내용 확인을 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다.)
나. 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우
다. 시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우
라. 같은 성능을 지닌 상품으로 복제가 가능한 경우 그 원본인 상품의 포장을 훼손한 경우
마. 그 밖에 거래의 안전을 위하여 전자상거래 등에서의 소비자보호에 관한 법률 시행령 21조(청약철회 등의 제한)에서 정하는 경우
③ 제2항 제2호 내지 제4호의 경우에 '회사' 가 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용 상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.
④ 이용자는 제1항 및 제2항의 규정에 불구하고 상품의 내용이 표시ㆍ광고 내용과 다르거나, 계약내용과 다르게 이행된 경우에는 당해 상품을 공급받은 날로부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내에 청약철회…</textarea>
						</div>
					</div>
					<div class="term_sub">
						<div class="flexbox">
							<label><input type="checkbox" name="" id="" class="checkBoxRequired checkBoxOne">&emsp;개인정보 수집 및 이용<span>&nbsp;(필수)</span></label>
							<button type="button" class="term_toggle">내용보기</button>
						</div>
						<div class="term_text">
							<div class="term_area">
								<table class="term_table">
									<tr>
										<th>목적</th>
										<th>항목</th>
										<th>보유기간</th>
									</tr>
									<tr>
										<td>개인 식별, 고지사항 전달, 서비스 관련 상담, 민원사항 처리</td>
										<td>ID, 비밀번호, 이메일주소, 이름, 닉네임, 만 14세 이상 여부</td>
										<td>회원 탈퇴 시까지</td>
									</tr>
								</table>
								<p>
									<br>
									※ 위의 개인정보 제공에 대한 동의를 거부할 권리가 있으나, 거부할 경우 가입에 제한을 받을 수 있습니다.
								</p>
							</div>
						</div>
					</div>
					<div class="term_flag">
						<div class="flexbox">
							<label><input type="checkbox" name="" id="email_flag_check" class="checkBoxOne">&emsp;이벤트/쇼핑혜택 이메일 수신<span>&nbsp;(선택)</span></label>
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
							<label><input type="checkbox" name="" id="sms_flag_check" class="checkBoxOne">&emsp;이벤트/쇼핑혜택 SMS 수신<span>&nbsp;(선택)</span></label>
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
					<input type="submit" value="가입하기" class="btn11">
					<input type="button" value="취소하기" class="btn11" onclick="javascript:location.href='/index';">
				</div>

			</form>
		</div>
	</section>

	<!-- footer Start -->
	<jsp:include page="./layout/footer.jsp"></jsp:include>
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
					url:$("#regForm").attr("action")+"CheckId",
					type:"POST",
					data:"id="+id.value,
					async:false,
					success:function(result){
						if(result == 1){
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
		
		// 상호명 확인
		function check_store_name() {
			var store_name = document.getElementById("store_name");
			var store_nameChecked = document.getElementById("store_name_text");
			if(store_name.value == "") {
				store_nameChecked.innerHTML = "상호명을 입력해주세요.";
				return false;
			} else {
				store_nameChecked.innerHTML = "";
				return true;
			}
		}

		// 매장 주소 확인
		function check_store_addr() {
			var store_addr = document.getElementById("store_addr");
			var store_addr1 = document.getElementById("store_addr1");
			var store_addrChecked = document.getElementById("store_addr_text");
			if(store_addr.value == "" || store_addr1.value == "") {
				store_addrChecked.innerHTML = "주소를 입력해주세요.";
				return false;
			} else {
				store_addrChecked.innerHTML = "";
				return true;
			}
		}

		// 매장 전화번호 확인
		function check_store_tel() {
			var store_tel = document.getElementById("store_tel");
			var store_telChecked = document.getElementById("store_tel_text");
			var reg = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
			if(store_tel.value == "") {
				store_telChecked.innerHTML = "전화번호를 입력해주세요.";
				return false;
			} else if(reg.test(store_tel.value)) {
				store_telChecked.innerHTML = "숫자만 입력해주세요.";
				return false;
			} else {
				store_telChecked.innerHTML = "";
				return true;
			}
		}

    // 약관동의 필수 확인
    function check_term(){
      var is_checked = true;
      $('.checkBoxRequired').each(function(){
        is_checked = is_checked && $(this).is(':checked');
      });
      return is_checked;
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
      } else if(!check_term()){
        document.getElementById("checkBoxAll").focus();
        return false;
      } else if(document.getElementById("regForm").getAttribute("action") == "/store/register"){
        if(!check_store_name()){
          document.getElementById("store_name").focus();
          return false;
        } else if(!check_store_addr()){
          document.getElementById("store_addr1").focus();
          return false;
        } else if(!check_store_tel()){
          document.getElementById("store_tel").focus();
          return false;
        }
      }
      	$.ajax({
  		  url:$("#regForm").attr("action"),
  		  data:$("#regForm").serialize(),
  		  dataType:"html",
  		  type:"POST",
  		  success:function(result){
  			  if(result == 1){
  				  alert("회원가입되었습니다.\n로그인해주세요.");
  				  location.href="/login";
  			  } else {
  				  alert("회원가입 실패하였습니다.\n다시 가입해주세요.");
  				  location.href="/register";
  			  }
  		  },
  		  error:function(){
  			  alert("회원가입 에러");
  		  }
  	  });
      return false;
    }
	</script>

	<!-- 제이쿼리 동적 -->
	<script>
		$(function () {
			// 회원가입유형 Start
			$('#member-tab').on('click', function () {
				$('#company-tab').removeClass('tab-button-selected');
				$('#member-tab').addClass('tab-button-selected');
				$('.company').hide();	//	사업자 관련 인풋 숨기기
				$('.member').show(); // 일반유저 관련 인풋 나타내기
				$('#regForm').attr('action', '/member/register');	//	폼 액션 바꾸기
			});
			$('#company-tab').on('click', function () {
				$('#member-tab').removeClass('tab-button-selected');
				$('#company-tab').addClass('tab-button-selected');
				$('.member').show(); // 일반유저 관련 인풋 숨기기
				$('.company').show();	//	사업자 관련 인풋 나타내기
				$('#regForm').attr('action', '/store/register');	//	폼 액션 바꾸기
			});
			// 회원가입유형 Close

			// 약관동의 내용보기
			// 미완성

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

	<!-- 사업자 주소 api -->
	<script>
		function store_addrAPI() {
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
					document.getElementById('store_postcode').value = data.zonecode;
					document.getElementById("store_addr").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("store_addr1").focus();
				}
			}).open();
		}
		</script>

</body>

</html>