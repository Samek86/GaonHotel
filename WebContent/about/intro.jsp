<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#introbg {
	 background: url(./about/img/bg01_s.png) no-repeat fixed; 
	background-size: 100% cover;
	background-position: center -20px;
	height: 45%;
	width: 100%;
	display: table;
}

#introbanner {
	height: 100%;
	width: 100%;
	color: #fff;
	background-color: rgba(26, 37, 48, 0.5); /* #1A2530; */
	display: table-cell;
	text-align: center;
	padding: 1.2em 50px;
	font-size: 70px;
	text-shadow: 0px 0px 15px black;
	cursor: default;
	vertical-align: bottom;
	letter-spacing: 15px;
}

#aboutHotel1 {
	color: #fff;
	font-size: 2em;
	font-weight: bold;
	text-align: center;
	padding: 40px;
	font-family: serif;
}

#aboutHotel2 {
	color: #fff;
	font-size: 1.5em;
	font-weight: blod;
	text-align: left;
	/* padding-left: 30px; */
}

.intro-col .cen {
text-align: center;
line-height: 1.5;
}

.img-polaroid {
	height: 750px;
	width: 470px;
	/* margin: 40px 50px 60px 50px; */
	-webkit-filter: brightness(80%);
    filter: brightness(80%); 
    transition : all 0.4s;
    margin-top: 20px;
}

.img-polaroid:hover {
	-webkit-filter: brightness(100%);
    filter: brightness(100%);
    box-shadow : 0 0 40px black; 
}

.comment {
	font-size: 17px;
	color: #ccc;
	font-family: serif;
	line-height: 1.4;
	text-align: left;
}

.col-md-6 {
padding-bottom: 30px;
}


</style>
<div id="introbg">
	<div id="introbanner" class="bannersize">호텔소개</div>
</div>
<div id="aboutHotel1">The Gaon Hotel에 방문하신 여러분 환영합니다.</div>
<div style="letter-spacing: -10px; margin-top: -30px; padding-top: -30px; font-weight: bold; color:#E74C3C; font-size: 30px" align="center">&mdash;&mdash;&mdash;</div>
<br>

<div class="intro-col">
  	<div class="container">
	  	<div class="col-md-6 cen">
	  		<img class="img-polaroid" src="about/img/intromain.jpg"></div>
	  	<div class="col-md-6">
	  		<p id="aboutHotel2">현대적인 라이프스타일 데스티네이션</p>
	  		<span class="comment"> <br>세계적인 디자인과 현대적 감각의 건축물
	        	 	<br>세계 속의 명문호텔 가온!<br> 세계 최고의 럭셔리 어번(Urban) 라이프스타일 호텔로 
	        	 	<br>고객들에게 최고급 Hospitality 서비스를 제공합니다. 
					<br>제주도를 대표하는 럭셔리 호텔로서 <br>'일상이 최고의 순간이 되는 곳' 이라는 컨셉을 
					새롭게 선보이며 <br>휴식은 물론 고급 식문화, 예술, 뷰티, 쇼핑, 웨딩, 엔터테이먼트 등 
					<br>고객의 고품격 라이프스타일을 제안하는 공간으로 거듭나고 있습니다.
					<br><br> 글로벌 럭셔리 호텔 
	    			<br>미래지향적인 디자인과 시스템을 겸비한 건축물
	  				<br>고객 한 분 한 분을 배려하는 기품있는 기품있는 서비스로 <br>세계 각국의 수반들과 외교, 경제
					<br>문화 등의 분야의 명사로부터 찬사를 받고 있으며, <br>Conde Nast Traveler, Traveler,Travel & Leisure,
					<br>Zagat, Euromoney등 권위 있는 해외 매체로 부터 <br>매년 한국 최고의 호텔로 선정되고 있습니다.
					<br>철학이 있는 서비스와 격조 높은 휴식을 제공하는 <br>프리미엄 라이프스타일 호텔입니다.
					<br><br>세계적인 디자이너가 참여하여 설립 한 비즈니스 호텔
	    			<br>현대적인 감각의 안락한 편의 시설 
	    			<br>비교할 수 없는 경험, 개별 맞춤 서비스로 <br>모든 고객들의 불편사항을 
	   	 			최소로 하여 <br>최고의 만족 서비스를 제공하고 <br>편안하고 즐거운 체류를 위해 
	    			레저 및 비즈니스 목적에 맞는 <br>다양한 시설을 제공해 드립니다.
					<br> 아울러 호텔 전역에서 이용할 수 있는 <br>WiFi, 24시간 The Gaon 버틀러 서비스 등
					<br> 가온 호텔은 여러분이 도착하시는 순간부터 <br>모든 필요사항을 만족시켜 드리기 위해 
					<br> 기쁜 마음으로 최선을 다하겠습니다. 감사합니다.!
					</span>
			</div>
		</div>
	</div>




<!-- 

<table id="aboutgaon_table">
	<br>
	<br>
	<tr>
		<td class="aboutgaon_table_td"><img class="img-polaroid" src="about/img/intromain.jpg"></td>
		<td><p id="aboutHotel2">현대적인 라이프스타일 데스티네이션</p> <br>

			<table id="aboutgaon_table1">
				<tr>
					<td class="aboutgaon_table1_td"></td>
					<br>
					<td><p class="comment">
							<font color=#ff5d00></font>
						</p> <br>
					<td>
					<td><span class="comment"> <br>세계적인 디자인과 현대적 감각의 건축물
	        	 	<br>세계 속의 명문호텔 가온! 세계 최고의 럭셔리 어번(Urban) 라이프스타일 호텔로 
	        	 	<br>고객들에게 최고급 Hospitality 서비스를 제공합니다. 
					<br>제주도를 대표하는 럭셔리 호텔로서 '일상이 최고의 순간이 되는 곳' 이라는 컨셉을 
					<br>새롭게 선보이며 휴식은 물론 고급 식문화, 예술, 뷰티, 쇼핑, 웨딩, 엔터테이먼트 등 
					<br>고객의 고품격 라이프스타일을 제안하는 공간으로 거듭나고 있습니다.
					<br><br> 글로벌 럭셔리 호텔 
	    			<br>미래지향적인 디자인과 시스템을 겸비한 건축물
	  				<br>고객 한 분 한 분을 배려하는 기품있는 기품있는 서비스로 세계 각국의 수반들과 외교, 경제
					<br>문화 등의 분야의 명사로부터 찬사를 받고 있으며, Conde Nast Traveler, Traveler,Travel & Leisure,
					<br>Zagat, Euromoney등 권위 있는 해외 매체로 부터 매년 한국 최고의 호텔로 선정되고 있습니다.
					<br>철학이 있는 서비스와 격조 높은 휴식을 제공하는 프리미엄 라이프스타일 호텔입니다.
					<br><br>세계적인 디자이너가 참여하여 설립 한 비즈니스 호텔
	    			<br>현대적인 감각의 안락한 편의 시설 
	    			<br>비교할 수 없는 경험, 개별 맞춤 서비스로 모든 고객들의 불편사항을 
	   	 			<br> 최소로 하여 최고의 만족 서비스를 제공하고 편안하고 즐거운 체류를 위해 
	    			<br> 레저 및 비즈니스 목적에 맞는 다양한 시설을 제공해 드립니다.
					<br> 아울러 호텔 전역에서 이용할 수 있는 WiFi, 24시간 The Gaon 버틀러 서비스 등
					<br> 세인트 레지스는 여러분이 도착하시는 순간부터 모든 필요사항을 만족시켜 드리기 위해 
					<br> 기쁜 마음으로 최선을 다하겠습니다. 감사합니다.! The GaonHotel로 오십시오.
					</span></td>
					</tr>
			</table> <br>
		<br></td>
	</tr>
</table>
 -->




