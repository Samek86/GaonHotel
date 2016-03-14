<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>

<%
session.invalidate();
%>
<html>
<head><title>로그아웃</title>

<script>
alert("로그아웃 되었습니다. 이용해 주셔서 감사합니다.");
</script>
</head>

<body>
<% response.sendRedirect("../index.jsp"); %>
</body>

</html>