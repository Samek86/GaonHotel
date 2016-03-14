<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../ssi.jsp"%>
<%
try{
String nowpage=(String)session.getAttribute("nowpage");

roomDBsql rd=new roomDBsql();
List<roomDBbean> roomlist = rd.roomList();
roomDBbean firstroom = (roomDBbean) roomlist.get(0);
 String d_num = "3";
if(session.getAttribute("NowUser")==null){ d_num="3";}else{ d_num= "4"; };
%>
<script>

$(window).scroll(scrollopacity);

function scrollopacity() { 
    var header = document.getElementsByClassName('header2')[0];
    var scroll = document.getElementById('scroll');
    for(var d=1; d<=<%=d_num%>; d++){
    	var d2 = d-1;
    eval("var drop"+d+" = document.getElementsByClassName('drop')["+d2+"];")
    }
    for(var i=0; i<500; i+=20 ){
	    var alpha = 0.6+(0.0007*i);
	    if($(window).scrollTop()>=i) {header.style.background = 'rgba(26, 37, 48, '+0.002*i +')';
	    for(var d=1; d<=<%=d_num%>; d++){
	    eval("drop"+d+".style.background = 'rgba(26, 37, 48, '+alpha+')';")}
	    scroll.style.opacity = 0.002*i;}
	    if($(window).scrollTop()>=510){
	       for(var d=1; d<=<%=d_num%>; d++){
	    	  eval("drop"+d+".style.background = 'rgba(26, 37, 48, 0.96)';")}
	    }
    }
}

$(document).ready(function(){
    $(<%=nowpage%>).css("background", "#E74C3C");
});

$(function(){
	$('#scroll').on('click', function(e){
		$('html, body').animate({
			scrollTop:0
		}, 800);
	});
});
var toggle = false;
function smalldrop() {
	if(toggle){
		$(".smenu ul li a").css({"opacity" : "0",
		"height" : "0", "padding" : "0"	});
		$(".smenu").css({"left" : "100%"});
		toggle = false;
		$("#smallmenu").html("<i class='fa fa-bars fa-2x'></i>");
		return;
	};
	if(!toggle){
		$(".smenu ul li a").css({"opacity" : "1",
		"height" : "40px", "padding" : "10px 20px"	});
		$(".smenu").css({"left" : "50%"});
		toggle = true;
		$("#smallmenu").html("<i class='fa fa-times fa-2x'></i>");
		return;
	};
}



</script>
<link href="./main/css/top.css" rel="stylesheet">

<div id="scroll"><i class="fa fa-chevron-up fa-lg"></i></div>

<div class="header2">
	<div class="container">
		<span class="logo">
			<a href="index.jsp"><img src="main/img/logo2.png" width="250px" style="opacity:1;"></a>
		</span>
	<div class="navigation">
		<ul class="navig">
			<li><a href="index.jsp" id="home" class="nowindex">홈</a></li>
			<li><a href="about.do" id="about" class="nowabout">소개&nbsp;<i class="fa fa-caret-down"></i></a>
				<ul class="drop"><li><a href="about.do" >사원소개</a></li>
					<li><a href="intro.do">호텔소개</a></li></ul>
			</li>
		
			<li><a href="reservation.do"class="nowreservation">예약</a></li>
			<li><a href="room.do?roomType=<%=firstroom.getRoomType()%>" class="nowrooms">객실&nbsp;<i class="fa fa-caret-down"></i></a>
				<ul class="drop">
			<% 
			for (int i = 0; i < roomlist.size(); i++) {  
				roomDBbean roombean = (roomDBbean) roomlist.get(i);
			%>
				<li><a href="room.do?roomType=<%=roombean.getRoomType()%>"><%=roombean.getRoomType()%></a></li>
					
			<%}  %>		
				</ul>
			</li> 
			<li><a href="G_guest.do"class="nowguest">게시판&nbsp;<i class="fa fa-caret-down"></i></a>
				<ul class="drop"><li><a href="G_guest.do">게시판</a></li>
					<li><a href="qna.do">자주하는 질문</a></li>
					</ul>
			</li>
			<li><a href="contact.do"class="nowcontact">안내</a></li>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			<li id="login">
			<jsp:include page="/login/top-login.jsp" />
			</li>
		</ul>
		</div>
		<!-- 작은화면일때 메뉴 -->
		<div id="smallmenu" onclick="smalldrop()"><i class='fa fa-bars fa-2x'></i></div>
		
	</div>
	</div>
<div class="smenu">
	<ul class="drop">
		<li><a href="index.jsp">홈</a></li>
		<li><a href="about.do">사원소개</a></li>
		<li><a href="intro.do">호텔소개</a></li>
		<li><a href="reservation.do"class="nowreservation">예약</a></li>
					<% 	for (int i = 0; i < roomlist.size(); i++) { 
						roomDBbean roombean = (roomDBbean) roomlist.get(i);	%>
			 <li><a href="room.do?roomType=<%=roombean.getRoomType()%>"><%=roombean.getRoomType()%></a></li>
				<%}}catch(Exception e){} %>		
		<li><a href="G_guest.do">게시판</a></li>
		<li><a href="qna.do">자주하는 질문</a></li>
		<li><a href="contact.do">안내</a></li>
		
		<%if(session.getAttribute("NowUser")==null){%>
			<li><a href="login.do">로그인</a></li>
			<li><a href="reg.do">회원가입</a></li>
		<%} else {
		 	String id=(String)session.getAttribute("NowUser");
		 	String name=(String)session.getAttribute("NowName");
		 	if(id.equals("admin")){
		%>
			<li><a href="about.do">예약관리</a></li>
			<li><a href="member.do">회원관리</a></li>
			<li><a href="intro.do">객실관리</a></li> 
			<li><a href="main.do">Logout</a></li>
		<%	 }else if(!id.equals("admin")){ %>
			<li><a href="#">예약확인</a></li>
			<li><a href="memberDetail.do">회원정보</a></li>
			<li><a href="main.do">Logout</a></li>
		<% } } %>
	</ul>
</div>



