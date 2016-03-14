<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page session="true"%>
<%@ page import="java.util.*" %>
<script type="text/javascript">

$(window).load(function() {$("#id").focus();});

	function login() {
		var ID = document.getElementById("id").value;
		var PW = document.getElementById("pw").value;
		if (ID == "" || PW == "") {
			alert("공백입니다.");
		} else {
			location.href = "idck.do?ID="+ID+"&PW="+PW;
			//location.assign(url);
		}
	}
	
	$(function() {
	    $( "#pen" ).draggable({cursor: "pointer",cursorAt: { top: 210, left: 45 } });
	  });

	$(function() {
	    $( "#loginform" ).draggable({cursor: "pointer",cursorAt: { top: 235, left: 305 } });
	  });
	
		
</script>	
<style>
#loginbg {
    background: url(./login/img/woodbg.png) no-repeat center;
    position: static;  
    background-size: cover;
    height: 100%;
}

#loginform {
	height: 470px;
	color : #444 !important;
	position : absolute;
	/*background-color : rgba(26, 37, 48, 0 ); #1A2530; */
	left : 50%;
	width: 610px;
	margin-left:-305px;
	top : 210px;
	text-align : center;
	padding: 2em 50px;
	
	font-size: 3.5vmin;
	cursor: default;
    vertical-align: middle;
    /* display: table-cell;  */
   	z-index: 2;
}

#loginpaper {
	background : url(./login/img/loginpaper.png) no-repeat center;
	background-size: cover;
	height: 100%;
	width: 100%;
	position : absolute;
	left : 0;
	top : 0;
	padding: 100px 0px;
	margin: 0;
	z-index: 0;
}

#loginform .logintext {
	margin: 0 0 0 0;
	z-index: 10;
	}

#loginform input {
	/* display : table; */
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

#loginform input {
transition: 0.5s all ease;
	-webkit-transition: 0.5s all ease;
	-moz-transition: 0.5s all ease;
	-o-transition: 0.5s all ease;
	-ms-transition: 0.5s all ease;
}

#loginform a {
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

#loginform a:hover {
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

#pen{
top :31.5%;
left : 66%;
width : 85px;
z-index : 2000;
cursor : pointer;
position : absolute;
transform:rotate(19deg);
-ms-transform::rotate(19deg);
-webkit-transform::rotate(19deg);
}
</style>

<div class="alert" style="position: fixed; bottom: 0;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	  <h4><font color="#1A2530">종이와 펜은 이동 가능합니다</font></h4>
</div>

<%
String id = (String)request.getAttribute("id");
if(id==null||id.equals("")){id="";}
String msg = (String)request.getAttribute("msg");
if(msg==null||msg.equals("")){}
else{
%>
	<div class="alert alert-block" style="position: fixed; bottom: 0;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	  <h4>알림!</h4>
	  <h5><%=msg%></h5>
	</div>
<%}%>

	<img src="./login/img/pen2.png" id="pen">
	<div id="loginbg"><div id="loginform">
	<div id="loginpaper">
		<div class="logintext">아이디 &nbsp;&nbsp;<input id="id" type="text" name="id" value="<%=id%>"></div>
		<div class="logintext">비밀번호 &nbsp;<input id="pw" type="password" name="pw"></div>
		<div class="logintext" style="margin-top: 27px;">
		<!-- <a href="#" onclick=login() >로그인</a> -->
		<a href="#" onclick="login()" >로그인</a></div>
		</div></div>
	</div>
