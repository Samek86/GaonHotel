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
	
<%!
	String from="", to="", email="", name="", tel="", revDate="";
	int cap=0, nights=0, roomNum=0, TotalCost=0;
	int revnum=0, revsize=0, revlistnum=0;
 %>
<%
revDBbean userbean = new revDBbean();
List revList =  (List)session.getAttribute("revList");
revsize=revList.size();
//revnum = (Integer)(request.getAttribute("revnum"));
revnum = (Integer)(session.getAttribute("revnum"));
System.out.print(revnum);
revlistnum=(revsize-1)-revnum;
		userbean = (revDBbean) revList.get(revlistnum);
		name = userbean.getRevName();
		email = userbean.getRevEmail();
		tel = userbean.getRevTel();
		roomNum = userbean.getRevRoomID();
		TotalCost = userbean.getRevTotalCost();
		cap = userbean.getRevCap();
		from = userbean.getRevIn().substring(0, 10);
		to = userbean.getRevOut().substring(0, 10);
		nights = userbean.getRevTerm();
		revDate = userbean.getRevDate();
	
%>
		<div id="checkrevpaper">
		<div class="checkrevtext title" align="center"><img src="./login/img/paperlogo.png" width="150px">&nbsp; 예약확인</div>
		<div class="checkrevtext2">
		예약자성함 : <%=name %>님<br>
		체크인 : <%=from %><br>
		체크아웃 : <%=to %><br>
		숙박일 : <%=nights %>박<br>
		총인원 : <%=cap %>명 <br>
		객실번호 : <%=roomNum %>호실<br>
		총금액 : <%=TotalCost %>원<br>
		</div>
		<div class="checkrevtext" style="margin-top: 27px;" align="center">
		<%if(revsize>1&&((Math.abs(revnum)-revsize)+1)!=revnum){ %>
		<a href="checkrev.do?revnum="<%=String.valueOf(revnum-1)%>><i class="fa fa-caret-left fa-lg"></i></a>
		<% }%>
		<a href="index.do" >메인으로</a>
		<%if(revsize!=1||revnum!=0){ %>
		<a href="checkrev.do?revnum="<%=revnum+1 %> ><i class="fa fa-caret-right fa-lg"></i></a>
		<%} %>
		</div>
		</div></div>
	</div>
