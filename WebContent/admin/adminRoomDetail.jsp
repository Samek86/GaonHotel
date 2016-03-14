<%@ page import="admin.common.DBbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script type="text/javascript">
	$(function() {
		$( "#pen" ).draggable({cursor: "pointer",cursorAt: { top: 210, left: 45 } });
	});
	
	$(function() {
		$( "#joinform" ).draggable({cursor: "pointer",cursorAt: { top: 235, left: 270 } });
	});
</script> 
<style>
#joinbg {
    background: url(./login/img/woodbg.png) no-repeat center;
    position: static;  
    background-size: cover;
    height: 100%;
    margin: 0;
}

#jointable{
margin : 30px auto auto 30px;

}

#joinform {
	height: 85%;
	color : #444 !important;
	position : absolute;
	background-color : rgba(255, 0, 0, 0 );; /*rgba(26, 37, 48, 1 ); #1A2530; */
	left : 50%;
	width: 500px;
	margin-left:-250px;
	top : 110px;
	text-align : center;
	padding: 1em 0px;
	font-size: 2vmin;
	cursor: default;
    vertical-align: middle;
    z-index: 10;
    /* display: table-cell;  */
}
#joinform2 {
	height: 100px;
	color : #444 !important;
	position : relative;
	background-color : rgba(0, 0, 255, 0); /*rgba(26, 37, 48, 1 ); #1A2530; */
	width: 100%;
	top: 20px;
	text-align : center;
	padding: 25px auto;
	font-size: 2vmin;
	cursor: default;
    vertical-align: middle;
    /* display: table-cell;  */
}

#joinform .jointext {
	margin: 2px 0 2px 0;
}

#joinform .title {
	font-size:3vmin;
	margin: 15px 0px;
}

#joinform div, #joinform span{
color : #444;
font-size: 2vmin;
}
#joinform input::-webkit-input-placeholder{
color : #444;
font-size: 2vmin;
}
#joinform input:-ms-input-placeholder {
color : #444;
font-size: 2vmin;
}

#joinform .input {
	/* display : table; */
	color : #444;
	font-size: 2vmin;
	border-color : #444;
	height: 30px;
	width: 150px;
	outline: 0;
}
#joinform .input_s {
	/* display : table; */
	color : #444;
	font-size: 2vmin;
	border-color : #444;
	height: 30px;
	width: 100px;
	outline: 0;
}
#joinform .input_xl {
	/* display : table; */
	color : #444;
	font-size: 2vmin;
	border-color : #444;
	height: 30px;
	width: 370px;
	outline: 0;
}
#joinform .input_l {
	/* display : table; */
	color : #444;
	font-size: 2vmin;
	border-color : #444;
	height: 30px;
	width: 250px;
	outline: 0;
}
#joinform .button {
	/* display : table; */
	color : #444;
	font-size: 1.9vmin;
	border-color : #444;
	height: 30px;
	width: 105px;
	background-color: rgba(255,255,255,0);
	border-radius : 5px;
	border-style : solid;
	text-align: center;
	outline: 0;
}

#joinform .button:hover {
	color : #fff;
	text-decoration: none;
	background-color: #E74C3C; 
	transition: 0.3s all ease;
	-webkit-transition: 0.3s all ease;
	-moz-transition: 0.3s all ease;
	-o-transition: 0.3s all ease;
	-ms-transition: 0.3s all ease;
 }

#joinform2 input {	
 	margin : 15px;
	color: #444;
	background : rgba(255,255,255,0);
	border: 3px;
	border-radius : 10px;
	border-color : #444;
	border-style : solid;
	width : 15vmin;
	padding: 8px 15px;
	cursor: pointer;
	font-size: 2.8vmin;
	transition: 0.5s all ease;
	text-decoration: none;
	-webkit-transition: 0.5s all ease;
	-moz-transition: 0.5s all ease;
	-o-transition: 0.5s all ease;
	-ms-transition: 0.5s all ease;
	outline: 0;
}

#joinform2 input:hover {
	color : #fff;
	text-decoration: none;
	background-color: #E74C3C; 
 }
 
 #joinpaper {
	background : url(./login/img/memo2.png) no-repeat center;
	background-size: cover;
	height: 100%;
	width: 100%;
	position : absolute;
	left : 0;
	top : 0;
	padding: 10px 20px;
	text-align : center;
	margin: 0;
	z-index: 0;
}

#pen{
top :31.5%;
left : 60%;
width : 85px;
z-index : 2000;
cursor : pointer;
position : absolute;
transform:rotate(19deg);
-ms-transform::rotate(19deg);
-webkit-transform::rotate(19deg);
}

#joinform .input.lg33 {
width: 380px;
}
</style>
<%
DBbean bean = (DBbean)request.getAttribute("adminRoomDetail");
%>
<div class="alert" style="position: fixed; bottom: 0;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	  <h4><font color="#1A2530">종이와 펜은 이동 가능합니다</font></h4>
</div>
<img src="./login/img/pen2.png" id="pen">
<div id="joinbg">
	<div id="joinform"><div id="joinpaper">
	<table id="jointable">
		<tr><td><div class="jointext title" align="center"><img src="./admin/img/paperlogo.png" width="150px">&nbsp; 객실 정보</div></td></tr>
		<tr><td><input class="input" type="text" name="roomID" readonly="readonly" value="<%= bean.getRoomID() %>"></td></tr>
		<tr><td><input class="input" type="text" name="roomType" readonly="readonly" value="<%= bean.getRoomType() %>"></td></tr>
		<tr><td><input class="input" type="text" name="roomName" readonly="readonly" value="<%= bean.getRoomName() %>"></td></tr>
		<tr><td><input class="input" type="text" name="roomCost" readonly="readonly" value="<%= bean.getRoomCost() %>"></td></tr>
		<tr><td><input class="input" type="text" name="roomMax" readonly="readonly" value="<%= bean.getRoomMax() %>"></td></tr>
		<tr><td><input class="input lg33" type="text" name="roomText" readonly="readonly" value="<%= bean.getRoomText() %>"></td></tr>
		<tr><td><img alt="<%= bean.getRoomImg1() %>" src=""></td></tr>
		<tr><td><img alt="<%= bean.getRoomImg2() %>" src=""></td></tr>
		<tr><td><img alt="<%= bean.getRoomImg3() %>" src=""></td></tr>
		<tr><td style="text-align: center"><div id=joinform2>
			<input type="button" value="수정하기" onclick="location.href='adminRoomPreEdit.do?roomID=<%= bean.getRoomID() %>'">
			<input type="button" value="뒤로가기" onclick="location.href='adminRoomList.do'">
		</div></td></tr>
	</table>
	</div></div>
</div>
