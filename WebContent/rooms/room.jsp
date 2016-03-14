<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../ssi.jsp"%>

<link href="./rooms/css/room.css" rel="stylesheet">
<style>
#room1bg {
    background: url(./rooms/img/bg04_s.png) no-repeat fixed; 
	background-size: 100% cover;
	background-position: center -20px;
	height: 45%;
	width: 100%;
	display: table;
}
#room1banner {
	height : 100%;
	width : 100%;
	color : #fff;
	background-color : rgba(26, 37, 48, 0.5 );
	display:table-cell;
	text-align : center;
	padding: 1.2em 50px;
	font-size: 5vmax;
	text-shadow: 0px 0px 15px black;
	cursor: default;
    vertical-align: bottom;
    letter-spacing: 15px;
}

#Gaonhotelrooms .rooms{
  font-size:25px;
}

#Gaonhotelrooms .comment{
  font-size:20px;
}

</style>
<script>

$(document).ready(function(){
	$('.fotorama').fotorama({ height: "30%", width : "100%" });
});
window.onresize = function() {
	$('.fotorama').fotorama({ height: "30%", width : "100%" });};
	
	
	
</script>

<%
try {
String roomType = (String)session.getAttribute("roomType");
List roomlist = (List) session.getAttribute("roomlist");
for (int i = 0; i < roomlist.size(); i++) { 
	roomDBbean roombean = (roomDBbean) roomlist.get(i);
	if(roombean.getRoomType().equals(roomType)){
%>

<div id="room1bg">
   <div id="room1banner"><%=roombean.getRoomType()%></div></div>

<div class="contact-col">
<div class="container brbr">
	  	<div class="col-md-12 cen">
	  	<div class="contacttitle"><%=roombean.getRoomName()%></div>
	  	<font size="7">__</font><br>
	  	<br><br>
</div>
</div>
</div>




   <div align="center">
   <div class="fotorama" data-allowfullscreen="native" 
	    data-fit = "cover" data-autoplay="6000" data-arrows="true" data-click="true" data-swipe="true" data-trackpad="true" data-loop="true" 
		style="margin: 0;">
	  <a href="rooms/img/<%=roombean.getRoomImg1()%>"></a>
	  <a href="rooms/img/<%=roombean.getRoomImg2()%>"></a>
	  <a href="rooms/img/<%=roombean.getRoomImg3()%>"></a>
	</div></div>
	
	<div class="contact-col2">
   <div class="container-fluid">
		<div class="row">
		<div class="col-md-6 col-sm-12 cen">
		  	<div class="contacttext notimg1">
		  			객실소개<br>
		  			<div style="letter-spacing: -5px; color:#E74C3C;">&mdash;&mdash;&mdash;</div>
					<%=roombean.getRoomName()%> <br>
					<%=roombean.getRoomText()%> <br>
			</div>
		</div>
		<div class="col-md-6 col-sm-12 cen">
		  	<div class="contacttext">
			  	기본정보
			  	<div style="letter-spacing: -5px;color:#E74C3C;">&mdash;&mdash;&mdash;</div>
			  	24시간 프라이빗 다이닝 서비스 <br>
			  	투숙기간 중 차량주차(객실당 1개) <br>
   				체크인 오후 2시, 체크아웃 정오 12시 <br>
		  	</div>
		</div>
		
		<div class="col-md-6 col-sm-12 cen">
		  	<div class="contacttext img222">
		  			예약문의<br>
		  			<div style="letter-spacing: -5px;color:#E74C3C;">&mdash;&mdash;&mdash;</div>
					Tel: 02) 1004-8282
			</div>
		</div>
		<div class="col-md-6 col-sm-12 cen">
		  	<div class="contacttext notimg1" style="padding: 12% 0;">
			  	편의시설
			  	<div style="letter-spacing: -5px;color:#E74C3C;">&mdash;&mdash;&mdash;</div>
			  	무료 초고속 인터넷 랜선 및 WiFi <br>
			  	위성 채널 및 영화 제공 <br>
	   			100% 순면 오리털 이불 <br>
	   			5종류의 다양한 베개 선택 <br>
	   			전자동 비데 <br>
	   			무료 생수 1일 2병 제공 <br>
		  	</div>
		</div>
	</div>
	</div>
</div>
   
  <%
	return;}//if end 
	
}//for end

} catch (Exception e) {
		}
	%>
