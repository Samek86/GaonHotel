<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div align="center">
<%
if(session.getAttribute("NowUser")==null){
%>
	<a href="login.do" class="top-login nowlogin">로그인</a>
	&nbsp;
	<a href="reg.do" class="top-login nowjoin">회원가입</a></div>
<%
} else {
 	String id=(String)session.getAttribute("NowUser");
 	String name=(String)session.getAttribute("NowName");
 	if(id.equals("admin")){
%>
<a href="index.jsp" class="top-login nowlogin">관리자&nbsp;<i class="fa fa-caret-down"></i></a>
	 <ul style="top:55px; width:120px;"  class="drop"><li><a href="adminReservationList.do" style="width:120px;">예약관리</a></li>
		<li><a href="member.do" style="width:120px;">회원관리</a></li>
		<li><a href="adminRoomList.do" style="width:120px;">객실관리</a></li>
		</ul>
			&nbsp; 
	<li><a href="main.do"  class="top-login nowjoin">Logout</a>
		</li>
<%
	 }else if(!id.equals("admin")){ 
%>
	<a href="index.jsp" class="top-login nowlogin"><%=name%>님&nbsp;<i class="fa fa-caret-down"></i></a>
		 <ul style="top:55px; width:120px;"  class="drop"><li><a href="checkrev.do" style="width:120px;">예약확인</a></li>
			<li><a href="memberDetail.do" style="width:120px;">회원정보</a></li></ul>
			&nbsp; 
	<li><a href="main.do"  class="top-login nowjoin">Logout</a>
		</li>
<% } } %>
		
</body>
</html>