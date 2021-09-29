<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
session.setAttribute("session_payflag", "success");
%>
<script type="text/javascript">
alert("결제가 완료되었습니다.");
location.href="../member/mypage";
</script>
</body>
</html>