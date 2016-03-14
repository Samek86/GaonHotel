<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>guestDelete.jsp</title>
</head>
<body>
<%
	String num=request.getParameter("num");
%>
<div id="guestF">
<form action="G_guestDelete.do">
	<div id="guestF2">
		<div id="guest_title2">이용후기 삭제</div>
	</div>	
		<input type="hidden" name=num value=<%=num %> >
		<span class="guestB">비밀번호</span>
		<input type=text name=pwd onSubmit="return checkform()" style="padding:5px;">
		<input type=submit value="삭제" class="bt">
		<a href='G_guest.do'><input type='button' value="취소" class="bt"></a>
</form>
</div>
</body>
</html>