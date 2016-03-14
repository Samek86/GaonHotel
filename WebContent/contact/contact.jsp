<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script
src="http://maps.googleapis.com/maps/api/js">
</script>

<script>

var myCenter=new google.maps.LatLng(1.286380, 103.853102);
function initialize(){
	
	var styles = [
	              {
	                  "elementType": "geometry",
	                  "stylers": [
	                      {
	                          "hue": "#E74C3C"
	                      },
	                      {
	                          "saturation": -45
	                      },
	                      {
	                          "lightness": -10
	                      },
	                      {
	                          "gamma": 0.72
	                      }
	                  ]
	              },
	              {
	                  "featureType": "road",
	                  "elementType": "labels.icon"
	              },
	              {
	                  "featureType": "landscape.man_made",
	                  "elementType": "geometry",
	                  "stylers": [
	                      {
	                          "hue": "#1A2530"
	                      },
	                      {
	                          "gamma": 3.1
	                      }
	                  ]
	              },
	              {
	                  "featureType": "water",
	                  "stylers": [
	                      {
	                          "hue": "#34495E"
	                      },
	                      {
	                          "gamma": 0.44
	                      },
	                      {
	                          "saturation": -60
	                      },
	                      {
	                          "lightness": -20
	                      }
	                  ]
	              },
	              {
	                  "featureType": "poi.park",
	                  "stylers": [
	                      {
	                          "hue": "#44ff00"
	                      },
	                      {
	                          "saturation": -23
	                      }
	                  ]
	              },
	              {
	                  "featureType": "water",
	                  "elementType": "labels.text.fill",
	                  "stylers": [
	                      {
	                          "hue": "#34495E"
	                      },
	                      {
	                          "gamma": 0.77
	                      },
	                      {
	                          "saturation": 65
	                      },
	                      {
	                          "lightness": 99
	                      }
	                  ]
	              },
	              {
	                  "featureType": "water",
	                  "elementType": "labels.text.stroke",
	                  "stylers": [
	                      {
	                          "gamma": 0.11
	                      },
	                      {
	                          "weight": 5.6
	                      },
	                      {
	                          "saturation": 0
	                      },
	                      {
	                          "hue": "#34495E"
	                      },
	                      {
	                          "lightness": -86
	                      }
	                  ]
	              },
	              {
	                  "featureType": "transit.line",
	                  "elementType": "geometry",
	                  "stylers": [
	                      {
	                          "lightness": -48
	                      },
	                      {
	                          "hue": "#ff5e00"
	                      },
	                      {
	                          "gamma": 1.2
	                      },
	                      {
	                          "saturation": -23
	                      }
	                  ]
	              },
	              {
	                  "featureType": "transit",
	                  "elementType": "labels.text.stroke",
	                  "stylers": [
	                      {
	                          "saturation": -64
	                      },
	                      {
	                          "hue": "#ff9100"
	                      },
	                      {
	                          "lightness": 16
	                      },
	                      {
	                          "gamma": 0.47
	                      },
	                      {
	                          "weight": 2.7
	                      }
	                  ]
	              }
	          ];

	             var styledMap = new google.maps.StyledMapType(styles,
	               {name: "Styled Map"});

	             var mapOptions = {
	            		 center:myCenter,
	            		  zoom:16, //확대&축소 수치
	            		  scrollwheel: false,
	            		  mapTypeId:google.maps.MapTypeId.ROADMAP,
	               mapTypeControlOptions: {
	                 mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
	               }
	             };
	             var map = new google.maps.Map(document.getElementById('googleMap'),
	               mapOptions);

	             map.mapTypes.set('map_style', styledMap);
	             map.setMapTypeId('map_style');
	           
	           

var image = new google.maps.MarkerImage("contact/img/maker.png", null, null, null, new google.maps.Size(40,50));//마커 이미지 경로&사이즈


var marker=new google.maps.Marker({
  position:myCenter,
   icon : image, //마커 이미지
  animation:google.maps.Animation.BOUNCE //애니메이션 효과
  });

marker.setMap(map);

var infowindow = new google.maps.InfoWindow({
  content:"GAON_HOTEL" //클릭시 문구내용
  });

google.maps.event.addListener(marker, 'click', function() {
  infowindow.open(map,marker);
  });
}

google.maps.event.addDomListener(window, 'load', initialize);

function check(){
	var length = document.forms[0].length-1; 
	for(var i = 0; i < length; i++){
	    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){		 
	        alert(document.forms[0][i].name + "을/를 입력하세요.");		 
	        document.forms[0][i].focus();		 
	        return false;		 
	    }		
	}
}

</script>

<style>
#contactbg {
    background: url(./contact/img/bg05_s.png) no-repeat fixed; 
	background-size: 100% cover;
	background-position: center -20px;
	height: 45%;
	width: 100%;
	display: table;
}
#contactbanner {
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
form{
text-align: left;
}

form div {
display: inline-block;
}
.short{
width:18%;
margin: 30px;
vertical-align: top;
}
.long{
text-align: left;
width: 80%;
margin: 10%;
}

.short input{
	width: 100%;
}
.long input, .long textarea{
	width: 100%;
	text-align: left;
}

.long textarea{
height: 100px;
border: hidden;
background-color: #34495E;
text-align: left;
}

.contact-col .cen, .contact-col2 .cen  {
text-align: center;
line-height: 1.5;
}

.contact-col .brbr{
margin-top: 30px;
}

.contact-col2 .container{
margin: 0;
padding: 0;
width: 100%;
height: 70%;
}
.contact-col2 .col-md-6{
padding: 0;
}

.contact-col .contacttitle {
margin-top : 10px;
margin-bottom : -30px;
font-size: 30px;
color : #E74C3C;

}

.contact-col2 .contacttext {
font-size: 20px;
color : #fff;
line-height: 2;
background-image : url("./contact/img/contact_img.jpg");
height: 530px;
text-align: center;
padding: 110px 0;
}

.contact-col2 .contacttext a {
color : #E74C3C;
line-height: 2;
padding: 3px 8px;
transition : all 0.6s;

}

.contact-col2 .contacttext a:hover {
color : #fff;
background-color : #E74C3C;
line-height: 2;
text-decoration: none;
}

.contact-col2 .contactform {
font-size: 20px;
color : #fff;
background-color: #1A2530;
height: 530px;
text-align: center;
}

.contact-col2 .contactform input {
margin : 10px 0;
font-size: 18px;
}

.contact-col2 .contactform textarea {
margin : 10px 0;
font-size: 18px;
}

.contact-col2 .contactform textarea:hover {
background-color: #E74C3C;
}

input::-webkit-input-placeholder {
    color: #fff;
    font-size: 18px;
}
input:-ms-input-placeholder {
	 color: #fff;
}


textarea::-webkit-input-placeholder {
font-size: 18px;
    color: #fff;
}
textarea:-ms-input-placeholder {
	 color: #fff;
}

#sendmail {
	color: #fff;
	font-size : 20px;
	border: 2px;
	border-radius : 10px;
	border-color : #fff;
	border-style : solid;
	background-color : rgba(255,255,255,0);
	width : 125px;
	padding: 8px 40px;
	cursor: pointer;
	z-index: 3;
	transition: 0.5s all ease;
	-webkit-transition: 0.5s all ease;
	-moz-transition: 0.5s all ease;
	-o-transition: 0.5s all ease;
	-ms-transition: 0.5s all ease;
}

#sendmail:hover {
	text-decoration: none;
	background-color: #E74C3C;
	cursor : pointer;
	color : #fff; 
 }
 
</style>

<div id="contactbg">
<div id="contactbanner">Contact Information</div></div>
<div class="contact-col">
<div class="container brbr">
	  	<div class="col-md-12 cen">
	  	<div class="contacttitle">가온 호텔 위치</div>
	  	<font size="7">__</font><br>
	  	<br><br>
</div>
</div>
</div>
<div id="googleMap" style="width:100%;height:400px; color: black;"></div><!-- 클릭시 폰트 컬러 css먹으므로 black 지정 -->

<div class="contact-col2">
<div class="container-fluid">
<div class="row">
	<div class="col-md-6 col-sm-12cen">
	  	<div class="contacttext">
	  			가온 호텔<br>
	  			<div style="letter-spacing: -5px;">&mdash;&mdash;&mdash;</div>
				서울특별시 마포구 백범로 23 거구장예식장 <br>
				지번 서울특별시 마포구 신수동 63-14 구프라자3층 <br>
				<a href="sms:01012345678">sms : 010-3387-2200</a><br>
				<a href="mailto:gaonhotel16@gmail.com"> gaonhotel16@gmail.com</a><br>
		</div>
	</div>
	<div class="col-md-6 col-sm-12cen">
	  	<div class="contactform">
		  	<form onsubmit="return check()" action="mail.do">
			<div class="long">
					<input type="text" placeholder="이름" name = "이름"> <br>
					<input type="text" placeholder="이메일" name = "이메일"> <br>
					<input type="text" placeholder="휴대폰" name = "휴대폰"> <br>
					<input type="text" placeholder="제목" name = "제목"> <br>
					<textarea placeholder="내용" name = "내용" style="overflow: hidden;"></textarea><br>
					<input id="sendmail" type="submit" value="전송">
			</div>
			</form>
	  	</div>
	</div>
	</div>
</div>
</div>



