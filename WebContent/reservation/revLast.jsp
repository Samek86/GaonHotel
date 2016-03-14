<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page session="true"%>
<%@ page import="java.util.*" %>
<%@ page import="reservation.common.revDBbean" %>
<script type="text/javascript">

$(document).ready(function() {$("#id").focus();});
	$(function() {
	    $( "#pen" ).draggable({cursor: "pointer",cursorAt: { top: 210, left: 45 } });
	  });
	$(function() {
	    $( "#revLastform" ).draggable({cursor: "pointer",cursorAt: { top: 235, left: 305 } });
	  });
</script>	
<style>
#revLastbg {
    background: url(./reservation/img/woodbg.png) no-repeat center;
    position: static;  
    background-size: cover;
    height: 100%;
}

#revLastform {
	height: 570px;
	color : #444 !important;
	position : absolute;
	left : 50%;
	width: 510px;
	margin-left:-255px;
	top : 150px;
	text-align : center;
	padding: 0em 50px;
	font-size: 3.5vmin;
	cursor: default;
    vertical-align: top;
   	z-index: 2;
}

#revLastpaper {
	background : url(./reservation/img/memo2.png) no-repeat center;
	background-size: cover;
	height: 100%;
	width: 100%;
	position : absolute;
	left : 0;
	top : 0;
	padding: 10px 0px;
	margin: 0;
	z-index: 0;
}

#revLastform .revLasttext {
	margin: 0 0 0 0;
	z-index: 10;
}

#revLastform .revLasttext2 {
	margin: 0 0 35px 0;
	padding : 0 60px;
	z-index: 10;
	font-family : serif;
	font-size: 24px;
	font-weight : bold;
	text-align: left;
	
}

#revLastform input {
	color : #444;
	font-size: 4vmin;
	vertical-align: middle;
	border-color : #444;
	height: 50px;
	width: 150px;
	z-index: 3;
	margin-bottom: 20px;
	outline: 0;
}

#revLastform input {
transition: 0.5s all ease;
	-webkit-transition: 0.5s all ease;
	-moz-transition: 0.5s all ease;
	-o-transition: 0.5s all ease;
	-ms-transition: 0.5s all ease;
}

#revLastform a {
	color: #444;
	border: 3px;
	border-radius : 10px;
	border-color : #444;
	border-style : solid;
	width : 18vmin;
	padding: 13px 25px;
	cursor: pointer;
	z-index: 3;
}

#revLastform a:hover {
	text-decoration: none;
	background-color: #E74C3C;
	cursor : pointer;
	color : #fff; 
	transition: 0.5s all ease;
	-webkit-transition: 0.5s all ease;
	-moz-transition: 0.5s all ease;
	-o-transition: 0.5s all ease;
	-ms-transition: 0.5s all ease;

 }
 
 #revLastform .title {
	font-size:30px;
	margin: 40px 0px 30px 0;
	padding-right: 30px;
}

</style>

<%
revDBbean revbean = new revDBbean();
revbean = (revDBbean)session.getAttribute("revbean");
%>

	<div id="revLastbg"><div id="revLastform">
	<div id="revLastpaper">
		<div class="revLasttext title" align="center"><img src="./login/img/paperlogo.png" width="150px">&nbsp; 예약확인</div>
		<div class="revLasttext2">
		예약자성함 : <%=revbean.getRevName() %>님<br>
		체크인 : <%=revbean.getRevIn() %><br>
		체크아웃 : <%=revbean.getRevOut() %><br>
		숙박일 : <%=revbean.getRevTerm() %>박<br>
		총인원 : <%=revbean.getRevCap() %>명 <br>
		객실타입 : <%=revbean.getRevRoomName() %><br>
		객실번호 : <%=revbean.getRevRoomID() %>호실<br>
		총금액 : <%=revbean.getRevTotalCost() %>원<br>
		예약확인메일을 발송하였습니다.<br>
		</div>
		<div class="revLasttext" style="margin-top: 27px;" align="center">
		<a href="index.do" >메인으로</a></div>
		</div></div>
	</div>
