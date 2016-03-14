<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.common.DBbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script type="text/javascript">
	
	$(function() {
    $( "#pen" ).draggable({cursor: "pointer",cursorAt: { top: 210, left: 45 } });
  });
	
	$(function() {
	    $( "#joinform" ).draggable({cursor: "pointer",cursorAt: { top: 235, left: 270 } });
 	});
	
	function memberDelete() {
		if(confirm("회원탈퇴 하시겠습니까?")) {
			location.href = "memberDelete.do";
		} else {}
	}
	
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
	height: 75%;
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
.joinform2 {
	height: 100px;
	color : #444 !important;
	position : relative;
	background-color : rgba(0, 0, 255, 0); /*rgba(26, 37, 48, 1 ); #1A2530; */
	width: 30%%;
	top: 20px;
	left : -20px;
	text-align : center;
	padding: 25px auto;
	font-size: 2vmin;
	cursor: default;
    vertical-align: middle;
    display: inline-block;
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

.joinform2 input {	
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

.joinform2 input:hover {
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
</style>
<%
DBbean bean = (DBbean)request.getAttribute("memberDetail");
String year = new SimpleDateFormat("yyyy").format(bean.getBirth());
String month = new SimpleDateFormat("MM").format(bean.getBirth());
String date = new SimpleDateFormat("dd").format(bean.getBirth());
%>
<div class="alert" style="position: fixed; bottom: 0;">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<h4><font color="#1A2530">종이와 펜은 이동 가능합니다</font></h4>
</div>
<img src="./login/img/pen2.png" id="pen">
<div id="joinbg">
	<div id="joinform">
		<div id="joinpaper">
			<table id="jointable">
				<tr>
					<td>
						<div class="jointext title" align="center">
							<img src="./member/img/paperlogo.png" width="150px">&nbsp; 회원정보
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<input class="input" type="text" name="id" readonly="readonly" value="<%= bean.getId() %>">
						<span class="jointext"></span>
					</td>
				</tr>
				<tr>
					<td>
						<input class="input" type="text" name="name" readonly="readonly" value="<%= bean.getName() %>">
					</td>
				</tr>
				<tr>
					<td>
						<input class="input_s" type="text" id="year" name="year" readonly="readonly" value="<%= year %>">
						<input class="input_s" type="text" id="month" name="month" readonly="readonly" value="<%= month %>">
						<input class="input_s" type="text" id="day" name="day" readonly="readonly" value="<%= date %>">
					</td>
				</tr>
				<tr>
			    <td>
						<input class="input" type="text" id="postcode" name="postcode" readonly="readonly" value="<%= bean.getZipcode() %>">
						<input class="input_xl" type="text" id="address" name="address" readonly="readonly" value="<%= bean.getAddr1() %>"><p>
						<input class="input_l" type="text" id="address2" name="address2" readonly="readonly" value="<%= bean.getAddr2() %>">
					</td>
		 		</tr>
				<tr>
					<td>
						<input class="input_l" type="text" name="email" class="ta" readonly="readonly" value="<%= bean.getEmail() %>">
					</td>
				</tr>
				<tr>
					<td>
						<input class="input" type="text" name="tel" class="ta" readonly="readonly" value="<%= bean.getTel() %>">
					</td>
				</tr>
				<tr>
					<td style="text-align: center">
						<div class=joinform2>
							<input type="button" value="수정하기" onclick="location.href='memberPreEdit.do'">
							<input type="button" value="회원탈퇴" onclick="memberDelete()">
						</div>
					</td>

				</tr>
			</table>
		</div>
	</div>
</div>
