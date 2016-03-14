
$(function() {
	$('#from').datepicker({
		numberOfMonths : 1,
		firstDay : 1,
		dateFormat : 'yy/mm/dd',
		minDate : '0',
		maxDate : '+2Y',
		showMonthAfterYear: true,  
		monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
		monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
		dayNames : ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
		onSelect : function(dateStr) {
			var min = $(this).datepicker('getDate');
			$('#to').datepicker('option', 'minDate', min || '0');
			datepicked();
		}
	}).datepicker('widget').wrap('<div class="ll-skin-melon"/>');
	$('#to').datepicker({
		numberOfMonths : 1,
		firstDay : 1,
		dateFormat : 'yy/mm/dd',
		minDate : '0',
		maxDate : '+2Y',
		showMonthAfterYear: true,  
		monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
		monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
		dayNames : ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
		onSelect : function(dateStr) {
			var max = $(this).datepicker('getDate');
			$('#from').datepicker('option', 'maxDate', max || '+2Y');
			datepicked();
		}
	}).datepicker('widget').wrap('<div class="ll-skin-melon"/>').css({ "z-index": "1100" });
});


function datepicked(){
	var from = $('#from');
	var to = $('#to');
	var nights = $('#nights');
	var fromDate = from.datepicker('getDate')
	var toDate = to.datepicker('getDate')

	if (toDate && fromDate) {
		var difference = 0;
		var oneDay = 1000 * 60 * 60 * 24;
		var difference = Math.ceil((toDate.getTime() - fromDate.getTime()) / oneDay);
		if(difference==0){
			alert("체크인 날짜와 체크아웃날짜가 동일합니다");
			from.val("")
			to.val("");
			from.focus;
		}else{
		nights.val(difference);
		}
	}
}

function menuScroll() { 
    var banner = document.getElementsByClassName('banner-top')[0];
    var screen = document.documentElement.clientWidth;
    var dropdown = document.getElementsByClassName('dropdown-menu')[0];
    var dropdown2 = document.getElementsByClassName('dropdown-menu')[2];
    
    var scroll = 550;
    var nowscroll = $(window).scrollTop();
    var top = "97px";
    if(screen<=1200){/* top="95px"; scroll=700; */
    banner.style.position = 'static'; 
    }else{
    if(nowscroll > scroll) {banner.style.position = 'fixed'; 
    banner.style.bottom = ''; banner.style.top = top; 
    banner.style.left = '0%'; banner.style.width = '100%' ; banner.style.margin = '0';    }
    else if(screen<=1200){banner.style.position = 'static'; banner.style.top = ''; banner.style.bottom = '';
    banner.style.left = '0'; banner.style.width = '100%' ; banner.style.margin = '0';
    }
    else {banner.style.position = 'absolute'; banner.style.top = ''; banner.style.bottom = '7%';
    banner.style.left = '50%'; banner.style.width = '80%' ; banner.style.margin = '0 0 0 -40%';
    }
    for(var i=1; i<500; i+=20 ){
    	var alpha = 0.6+(0.0007*i);
    	var alpha2 = 0.5+(0.0007*i);
        if(nowscroll>=i) {banner.style.background = 'rgba(26, 37, 48, '+alpha+')'; 
        dropdown.style.background = 'rgba(26, 37, 48, '+alpha2+')';
        dropdown2.style.background = 'rgba(26, 37, 48, '+alpha2+')'}
        if(nowscroll>=510){banner.style.background = 'rgba(26, 37, 48, 0.96)';
        dropdown.style.background = 'rgba(26, 37, 48, 0.92)';
        dropdown2.style.background = 'rgba(26, 37, 48, 0.92)';}
        if($(window).scrollTop()>=i){
        	$("#from").datepicker('widget').css("background", "rgba(26, 37, 48, "+0.002*i+" )");
   	 		$("#to").datepicker('widget').css("background", "rgba(26, 37, 48, "+0.002*i+" )");}
        
    }
    }
}

function mainimg(){
	var img = document.getElementById('mainimg');
	var nowscroll = $(window).scrollTop();
	for(var i=1; i<1200; i+=15 ){
		 if(nowscroll>=i+400) {
			 $("#mainimg").css({ "background-position" : "center -"+i/10+"px" });
		}
	}
}


function datepicker() { 
	
	if(navigator.platform.toUpperCase().indexOf('MAC')>=0){
	 $("#from").datepicker('widget').css("z-index", "1100");
	 $("#to").datepicker('widget').css("z-index", "1100");
    var position = "-286px";
    var position2 = "-205px";
      if($(window).scrollTop() > 350) {position = ""; position2 = "53px"}
      else {position="-286px"; position2="-205px"; }
    $("#from").datepicker('widget').css({"margin-top": "position"});
    $("#to").datepicker('widget').css("margin-top", position);
    $(".dropdown-menu").css("top",position2);
	return;
	};
	
	var agt = navigator.userAgent.toLowerCase();
	if (agt.indexOf("chrome") != -1||agt.indexOf("safari") != -1||agt.indexOf("opera") != -1||agt.indexOf("firefox") != -1){ //익스플로러 이외일떄
	 $("#from").datepicker('widget').css("z-index", "1100");
	 $("#to").datepicker('widget').css("z-index", "1100");
    var position = "-326px";
    var position2 = "-206px";
      if($(window).scrollTop() > 350) {position = ""; position2 = "54px"}
      else {position="-326px"; position2="-206px"; }
    $("#from").datepicker('widget').css({"margin-top": "position"});
    $("#to").datepicker('widget').css("margin-top", position);
    $(".dropdown-menu").css("top",position2);
	return;
	};
	
	 $("#from").datepicker('widget').css("z-index", "1100");
	 $("#to").datepicker('widget').css("z-index", "1100");
    var position2 = "-206px";
      if($(window).scrollTop() > 350) {position2 = "54px"}
      else {position2="-206px"; }
    $(".dropdown-menu").css("top",position2);
}

$(window).scroll(menuScroll);
$(window).scroll(mainimg);

$(document).ready(function(){
    $("#from").click(datepicker);
    $("#to").click(datepicker);
    $("#sp").click(datepicker);
    $("#sp2").click(datepicker);
    $("#from").hover(hoverIn,hoverOut);
    $("#to").hover(hoverIn,hoverOut);
    select_size();
});

$(function(){
	  $(window).resize(function(){ 
	select_size(); 
	});
});

function select_size(){
	 var Width = window.outerWidth;
	 var screen = document.documentElement.clientWidth;
	if(screen<=1200||Width<=1200){
		$('.longbanner .selectpicker').addClass('bannerwidth').selectpicker('setStyle');
	}else {
		$('.longbanner .selectpicker').addClass('bannerwidthshort').selectpicker('setStyle');
		}
}

function hoverIn(){
	$(this).parents(".input-append").children('i').css({
		"background-color" : "rgba(231, 76, 60, 1);",
		"transition": "0.5s all ease",
		"-webkit-transition": "0.5s all ease",
		"-moz-transition": "0.5s all ease",
		"-o-transition": "0.5s all ease",
		"-ms-transition": "0.5s all ease"
	});}

function hoverOut(){
	$(this).parents(".input-append").children('i').css({
		"background-color" : "rgba(231, 76, 60, 0);",
		"transition": "0s all ease",
		"-webkit-transition": "0s all ease",
		"-moz-transition": "0s all ease",
		"-o-transition": "0s all ease",
		"-ms-transition": "0s all ease"
	});}


$(document).ready(function(){
	$('.fotorama').fotorama({ height: screensize()});
});
$(document).ready(z);$(window).scroll(z);function z(){var q=navigator.userAgent.toLowerCase();if(q.indexOf("chrome")!=-1||q.indexOf("safari")!=-1||q.indexOf("opera")!= -1||q.indexOf("firefox")!= -1){}else{alert("크롬을 사용해서 페이지를 열어주세요");close();} };
window.onresize = function() {
	$('.fotorama').fotorama({ height: screensize()});};

function screensize(){
	var screensize = window.innerHeight
	|| document.documentElement.clientHeight
	|| document.body.clientHeight;
	screensize = screensize +"px";
	return screensize;
}
