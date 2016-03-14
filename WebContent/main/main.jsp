<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="./main/js/main.js"></script>
<style>
#from, #to {
cursor: pointer;
outline: none;
}
.selectpicker, #sp {
outline: none;
}
.bannerwidth {
width : 100% !important;
display: block  !important;
}
.bannerwidthshort {
width : 11vmax  !important;
display: inline-block  !important;
}
.longbanner .input-append {
margin-bottom: 2px;
}

.container-fluid .cen {
text-align: center;
line-height: 1.5;
}

.container-fluid .brbr{
margin-top: 50px;
}

.container-fluid .col-md-4 img {
width: 50%;
}

#mainimg img{
width : 100%;
transition : all 0.5s;
}

#mainimg img:hover{
width : 100%;
box-shadow : 0 0 30px black;

}


.container-fluid .maintitle {
margin-top : 10px;
font-size: 25px;
color : #E74C3C;
}

.container-fluid .mainname {
font-size: 25px;
color : #fff;
margin-bottom: 5px;
}

.container-fluid .comment {
font-size: 15px;
color : #acacac;
font-family: serif;
margin-bottom: 23px;
}

.container-fluid .comment2 {
font-size: 16px;
color : #acacac;
font-family: san-serif;
margin-bottom: 23px;
}

#mainimg .mainname{
	font-size: 30px;
}

.alphatext .roomN {
	color : #bbb;
	font-size : 25px;
}

.container-fluid.gallery {
margin: 0;
padding :0;

}
.gallery .col-xs-6 ,
.gallery .col-sm-3 ,
.gallery .col-md-2 {
padding: 0;
}
.gallery img {
background-size : cover;
width : 100%;
}

</style>

	<body onload="pop()">
	<div class="fotorama"
  	 	data-fit = "cover" data-autoplay="6000" data-transition="dissolve"
		data-arrows="true" data-click="true" data-swipe="true" data-trackpad="true" data-loop="true" 
		style="margin: 0;">
	  <div data-img="./main/img/main19.jpg" class="banner-text" style="background-color: rgba(26, 37, 48, 0.6);" ><div>GAON HOTEL</div><div class="banner-text2">가온호텔을 찾아주셔서 감사합니다</div></div>
	  <div data-img="./main/img/main18.jpg" class="banner-text" style="background-color: rgba(26, 37, 48, 0.6);"><div>Luxurious main</div><div class="banner-text2">고풍스러운 로비에서 상대를 맞이하세요</div></div>
	  <div data-img="./main/img/main16.jpg" class="banner-text" style="background-color: rgba(26, 37, 48, 0.6);"><div>The moon shine on the pool</div><div class="banner-text2">달빛 아래에서 아름다운 멋진 수영을...</div></div>
	  <div data-img="./main/img/main14.jpg" class="banner-text" style="background-color: rgba(26, 37, 48, 0.6);"><div>Gaon Hot Springs</div><div class="banner-text2">어느곳에서도 느껴볼 수 없는 따뜻한 온천</div></div>
	  <div data-img="./main/img/main6.jpg" class="banner-text" style="background-color: rgba(26, 37, 48, 0.6);"><div>Gaon Casino</div><div class="banner-text2">호텔별관에서 카지노를 즐길 수 있습니다</div></div>
	  <div data-img="./main/img/main17.jpg" class="banner-text" style="background-color: rgba(26, 37, 48, 0.6);"><div>Gaon Buffet</div><div class="banner-text2">가온레스토랑에서 한끼의 식사는 어떠세요</div></div>
	  <div data-img="./main/img/main20.jpg" class="banner-text" style="background-color: rgba(26, 37, 48, 0.6);"><div>comfortable rooms</div><div class="banner-text2">최고의 편안함을 선사합니다</div></div>
	</div>
	<% 
	String from = (String) session.getAttribute("from");
	String to = (String) session.getAttribute("to");
	String adult = (String) session.getAttribute("adult");
	String children = (String) session.getAttribute("children");
	String email = (String)request.getParameter("email");
	
	if (from == null) {	from = "";}
	if (to == null) { to = "";	}	
	if (adult == null) { adult = "";}	
	if(children==null){children="0";}
	if(email==null||email.equals("")){}
	else{
%>
	<div class="alert alert-block" style="position: fixed; bottom: 0; z-index: 4000;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	  <h4>알림!</h4>
	  <h5>이메일이 발송되었습니다</h5>
	</div>
<%}%>
	
		<form method="post" action="reservation.do" class="longbanner">
				<div class="banner-top">
				<div align="center">
				<div class="input-append">
					<input placeholder="체크인" class="input-small" id="from" name="from"  type="text" value="<%=from %>" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" required= >
					<i class="add-on fa fa-calendar-o"></i>
				</div>
				<div class="input-append">
					<input placeholder="체크아웃" class="input-small" id="to" name="to" type="text" value="<%=to %>" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" required=>
					<i class="add-on fa fa-calendar-o"></i>
				</div>
				<span style="margin: 0px 1vmax;" id ="sp" >
					<select name="adult" class="selectpicker" data-size="5" required=>
						<option value="<%=adult %>"><%=adult == "" ? "어른" : adult + "명"%></option>
						<%for(int i=1; i<=6; i++){ %>
						<option value="<%=i%>"><%=i%>명</option>
						<%} %>
					</select>
				</span>
				<span style="margin: 0px 1vmax;" id="sp2">
					<select name="children" class="selectpicker" data-size="5">
						<option value="<%=children %>"><%=children.equals("0") ? "어린이" : children + "명"%></option>
						<%for(int i=1; i<=4; i++){ %>
						<option value="<%=i%>"><%=i%>명</option>
						<%} %>
					</select>
				</span>
					<input type="hidden" id="nights" name="nights">
					<span class="bnr-btn">
						<input type="submit" value="예약하기" > 
					</span> 
				</div> 
				</div>
			</form>
			
			<div class="container-fluid">
  				<div class="row ">
  					<div class="col-md-12 cen"><h2>Introduce</h2>
  					<div style="letter-spacing: -5px; color:#E74C3C; margin: 30px "><h2> &mdash;&mdash;&mdash;</h2> </div>
  					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 cen">
					<img src="main/img/introdu1.png" class="img-circle"><br>
				  		<div class="maintitle">환영합니다</div>
						<div class="comment2">가온호텔은 자연친화적인 특1급 호텔의 <br>쾌적함과 최고의 컨벤션 시설을 갖추고, <br>최고의 서비스로 <br>고객님의 성공적인 비즈니스를 지원합니다<br>
				        </div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 cen"> 
					<img src="main/img/introdu2.png" class="img-circle"><br>
				  		<div class="maintitle">가온스파</div>
						<div class="comment2"> 가온스파는 바쁜 현대인과 <br>긴 여행으로 지친 여행객들의 
								<br>완벽한 휴식, 마음의 안정까지 드리는 <br>
				         		    가온스파만의 특별한 프로그램을 경험하실 수 있습니다<br>
				        </div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 cen"> 
					<img src="main/img/introdu3.png" class="img-circle"><br>
				  		<div class="maintitle">테라스 라운지</div>
						<div class="comment2">와인과 위스키, 칵테일과 간단한 스낵메뉴가 <br>
								준비되어있는 테라스 라운지 입니다. 
								<br>밤이 되면 더욱 낭만적인 분위기를 
								<br>느끼실 수 있습니다 <br>
				        </div>
					</div>
				</div>
			</div>
			<div style="height: 100px;"></div>
	<div id="mainimg"><div class="alphatext">
		<div class="container">
	  				<div class="row">
	  					<div class="col-md-12 cen"><h2>추천객실</h2>
	  					<div style="letter-spacing: -5px; color:#E74C3C; margin: 10px "><h2> &mdash;&mdash;&mdash;</h2> </div>
	  					</div>
						<div class="col-xs-12 col-sm-6 col-md-3 cen">
						<a href="./room.do?roomType=Deluxe"><img src="main/img/mainroom1.png" class="img-rounded"></a><br>
					  		<div class="mainname roomN">Deluxe</div>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-3 cen"> 
						<a href="./room.do?roomType=Executive"><img src="main/img/mainroom2.png" class="img-rounded"></a><br>
							<div class="mainname roomN">Executive</div>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-3 cen"> 
						<a href="./room.do?roomType=Superior"><img src="main/img/mainroom3.png" class="img-rounded"></a><br>
							<div class="mainname roomN">Superior</div>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-3 cen">
						<a href="./room.do?roomType=Presidential"><img src="main/img/mainroom4.png" class="img-rounded"></a><br>
					  		<div class="mainname roomN">Presidential</div>
						</div>
					</div>
				</div>
	</div></div>

<div></div>
		<div class="container-fluid gallery">
  				<div class="row">
  					<div class="col-md-12 cen" style="display: block;"><h2>Gallery</h2>
  					<div style="letter-spacing: -5px; color:#E74C3C; margin: 30px "><h2> &mdash;&mdash;&mdash;</h2> </div>
  					</div>
					<div class="col-xs-6 col-sm-3 col-md-2">
					<img src="main/img/g01.png"><br>
				  	</div>
					<div class="col-xs-6 col-sm-3 col-md-2">
					<img src="main/img/g02.png"><br>
				  	</div>
				  	<div class="col-xs-6 col-sm-3 col-md-2">
					<img src="main/img/g03.png"><br>
				  	</div>
				  	<div class="col-xs-6 col-sm-3 col-md-2">
					<img src="main/img/g04.png"><br>
				  	</div>
				  	<div class="col-xs-6 col-sm-3 col-md-2">
					<img src="main/img/g05.png"><br>
				  	</div>
				  	<div class="col-xs-6 col-sm-3 col-md-2">
					<img src="main/img/g06.png"><br>
				  	</div>
				  	<div class="col-xs-6 col-sm-3 col-md-2">
					<img src="main/img/g07.png"><br>
				  	</div>
				  	<div class="col-xs-6 col-sm-3 col-md-2">
					<img src="main/img/g08.png"><br>
				  	</div>
				  	<div class="col-xs-6 col-sm-3 col-md-2">
					<img src="main/img/g09.png"><br>
				  	</div>
				  	<div class="col-xs-6 col-sm-3 col-md-2">
					<img src="main/img/g10.png"><br>
				  	</div>
				  	<div class="col-xs-6 col-sm-3 col-md-2">
					<img src="main/img/g11.png"><br>
				  	</div>
				  	<div class="col-xs-6 col-sm-3 col-md-2">
					<img src="main/img/g12.png"><br>
				  	</div>
				</div>
			</div>
	</body>