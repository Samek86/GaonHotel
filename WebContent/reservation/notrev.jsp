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
	    $( "#checkrevform" ).draggable({cursor: "pointer",cursorAt: { top: 235, left: 305 } });
	  });
</script>	
<style>
#checkrevbg {
    background: url(./reservation/img/woodbg.png) no-repeat center;
    position: static;  
    background-size: cover;
    height: 100%;
}

#checkrevform {
	height: 500px;
	color : #444 !important;
	position : absolute;
	left : 50%;
	width: 510px;
	margin-left:-255px;
	top : 170px;
	text-align : center;
	padding: 0em 50px;
	font-size: 3.5vmin;
	cursor: default;
    vertical-align: top;
   	z-index: 2;
}

#checkrevpaper {
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

#checkrevform .checkrevtext {
	margin: 0 0 0 0;
	z-index: 10;
}

#checkrevform .checkrevtext2 {
	margin: 0 0 35px 0;
	padding : 0 60px;
	z-index: 10;
	font-family : serif;
	font-size: 24px;
	font-weight : bold;
	text-align: left;
	
}

#checkrevform input {
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

#checkrevform input {
transition: 0.5s all ease;
	-webkit-transition: 0.5s all ease;
	-moz-transition: 0.5s all ease;
	-o-transition: 0.5s all ease;
	-ms-transition: 0.5s all ease;
}

#checkrevform a {
	color: #444;
	border: 3px;
	border-radius : 10px;
	border-color : #444;
	border-style : solid;
	width : 18vmin;
	padding: 10px 22px;
	cursor: pointer;
	z-index: 3;
}

#checkrevform a:hover {
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
 
 #checkrevform .title {
	font-size:30px;
	margin: 40px 0px 30px 0;
	padding-right: 30px;
}

</style>
	<div id="checkrevbg"><div id="checkrevform">

		<div id="checkrevpaper">
		<div class="checkrevtext title" align="center"><img src="./login/img/paperlogo.png" width="150px">&nbsp; 예약확인없음</div>
		<div class="checkrevtext2">
		예약된 상태가 아닙니다.
		</div>
		<a href="./index.jsp" >메인으로</a>
				</div>
		</div></div>
	
