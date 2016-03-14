<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>

.bottom-col {
padding : 50px 0;
background-color: #131B24;
}

.bottom-col .pic {
margin: 30px auto;
}

.bottom-col .cen {
text-align: center;
line-height: 1.5;
}

.bottom-col .col-md-4 img {
width: 200px;
}
.bottom-col .bottomtitle {
margin-top : 10px;
font-size: 23px;
color : #E74C3C;
}

.bottom-col .bottomname {
font-size: 23px;
color : #fff;
margin-bottom: 5px;
letter-spacing: 1px;
line-height: 1.7;
}

.bottom-col .comment {
font-size: 18px;
color : #acacac;
font-family: serif;
margin-bottom: 23px;
line-height: 1.3;
}

.comment a {
color: #acacac;
}

.igray {
color: #acacac;
}

.comment a:hover {
color : #E74C3C;
text-decoration: none;
}

.bottom-col .link1,
.bottom-col .link2,
.bottom-col .link3
 {
color:#326496;
transition : all 0.6s;
}

.bottom-col .link1:hover, 
.bottom-col .link2:hover,
.bottom-col .link3:hover {
color:#E74C3C; 
cursor: pointer;
}

.copy {
color : #aaa;
font-size : 15px;
text-align: center;
background-color: #0D131A;
padding: 10px;
}
</style>

<script type="text/javascript">

$(document).ready(function(){
	$('.bottom-col .link1').hover(function(){$(".bottom-col .link1").addClass("fa-spin");});
	$('.bottom-col .link2').hover(function(){$(".bottom-col .link2").addClass("fa-spin");});
	$('.bottom-col .link3').hover(function(){$(".bottom-col .link3").addClass("fa-spin");});
	$('.bottom-col .link1').mouseleave(function(){$(".bottom-col .link1").removeClass("fa-spin");});
	$('.bottom-col .link2').mouseleave(function(){$(".bottom-col .link2").removeClass("fa-spin");});
	$('.bottom-col .link3').mouseleave(function(){$(".bottom-col .link3").removeClass("fa-spin");});
});



</script>

<div class="bottom-col">
<div class="container">
<div class="row">
  <div class="col-md-12">
  	<div class="container">
	  	<div class="col-md-4 cen">
	  		<img src="main/img/bottomlogo.png" width="80px">
	  	</div>
	  	<div class="col-md-4 cen">
	  		<div class="bottomtitle">Site Map</div>
			<div class="comment cen">
				<a href="index.jsp">Home</a><br>
				<a href="about.do">Made by</a><br>
				<a href="intro.do">Hotel is</a><br>
				<a href="reservation.do">Reservation</a><br>
				<a href="room.do?roomType=Deluxe">Rooms</a><br>
				<a href="G_guest.do">Board</a><br>
				<a href="qna.do">Q & A</a><br>
				<a href="contact.do">Contact</a><br>
	        </div>
	  	</div>
	  	<div class="col-md-4 cen">
	  		<div class="bottomtitle">Our Address</div>
			<div class="bottomname">
				<i class="fa fa-map-marker igray"></i> <span class="comment">63-14, Sinsu-dong, Mapo-gu, Seoul</span> <br>
				<i class="fa fa-phone igray"></i><span class="comment"> +82 3387 2200</span><br>
				<i class="fa fa-envelope igray"></i> <span class="comment">Gaonhotel16@gmail.com</span><br>
			</div>
				<i class="fa fa-facebook-square fa-3x link1"></i>&nbsp; &nbsp;
				<i class="fa fa-twitter-square fa-3x link2"></i>&nbsp; &nbsp;
				<i class="fa fa-instagram fa-3x link3"></i>
	  	</div>
  	</div>
  </div>
 </div>
</div>
</div>
 <div class="copy">copyright &copy; by Gaon.com</div>



