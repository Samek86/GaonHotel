<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

	function check(){
		var length = document.forms[0].length-1; 
		for(var i = 0; i < length; i++){      
		    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){		 
		        alert(document.forms[0][i].name + "을/를 입력하세요."); 	 
		        document.forms[0][i].focus();           
		        return false;		 
		    }//if end		
		}//for end
	}//end
	
	function telcheck(){
		var tel=signin.tel.value;
		var num_check=/^[0-9]*$/;
		if(num_check.test(tel)){
			if( signin.tel.value.length < 9 || signin.tel.value.length > 11 ){
			alert("9~11글자만 입력할수 있습니다.");
			signin.tel.value="";
			signin.tel.focus();
			return false;
			}
			}
			else{
			alert ( "숫자만 입력할 수 있습니다." );
			signin.tel.value="";
			signin.tel.focus();
			return false;
			}
	}//end
	
	function yearcheck(){
		var year=signin.year;
		var num_check=/^[0-9]*$/;
		if(num_check.test(year.value)){
			if( year.value.length !=4){
			alert("4자리로 입력해주세요 예)1990");
			year.value="";
			year.focus();
			return false;
			}
		}
		else{
		alert ( "숫자만 입력할 수 있습니다." );
		year.value="";
		year.focus();
		return false;
		}
	}//end
	
	function monthcheck(){
		var m=signin.month;
		var num_check=/^[0-9]*$/;
		if(num_check.test(m.value)){
			if( m.value > 12 || m.value < 1){
			alert("1~12사이의 숫자를 입력해주세요");
			m.value="";
			m.focus();
			return false;
			}
		}
		else{
		alert ( "숫자만 입력할 수 있습니다." );
		m.value="";
		m.focus();
		return false;
		}
	}//end
	
	function daycheck(){
		var d=signin.day;
		var num_check=/^[0-9]*$/;
		if(num_check.test(d.value)){
			if( d.value > 31 || d.value < 1){
			alert("1~31사이의 숫자를 입력해주세요");
			d.value="";
			d.focus();
			return false;
			}
		}
		else{
		alert ( "숫자만 입력할 수 있습니다." );
		d.value="";
		d.focus();
		return false;
		}
	}//end
	
	function checkid(){
		var a=signin.id.value;
		location.href = "search.do?id="+a;
	}//end
	
	function pass(){
		//비밀번호 길이 체크(4~8자 까지 허용)
		if (signin.password1.value.length<4 || signin.password1.value.length>8){
			 document.getElementById("ch_pw1").innerHTML = "4~8자리를 입력해주세요.";
			 signin.password1.value="";
	         signin.password1.focus();
		}
		else{
			document.getElementById("ch_pw1").innerHTML = "";
		}
	}//end
	
	function pass1(){
		if(signin.password1.value!=signin.password2.value) {
			document.getElementById("ch_pw2").innerHTML = "비밀번호가 일치하지 않습니다";
            signin.password2.value="";
            signin.password1.value="";
            signin.password1.focus();
    	}else if (signin.password1.value==signin.password2.value) {
    		document.getElementById("ch_pw2").innerHTML = "일치 합니다.";
    	}
	}//end
	
	
	function emailcheck(){
		var email = signin.email.value;  
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   		  
		if(regex.test(email) === false) {  
		    alert("잘못된 이메일 형식입니다.");
		    signin.email.value="";
		    signin.email.focus();
		    return false;
		}//if end	
	}//end
	
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var fullAddr = '';
	            var extraAddr = '';
	            
	            if (data.userSelectedType === 'R') fullAddr = data.roadAddress;
	    
	            else fullAddr = data.jibunAddress;

	            if(data.userSelectedType === 'R') {
	                if(data.bname !== '') extraAddr += data.bname;
	                if(data.buildingName !== '') extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }

	            document.getElementById("postcode").value = data.postcode;
	            document.getElementById("address").value = fullAddr;
	            document.getElementById("address2").focus();
	        }
	    }).open();
	}
	
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
</style>

<div class="alert" style="position: fixed; bottom: 0;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	  <h4><font color="#1A2530">종이와 펜은 이동 가능합니다</font></h4>
</div>

<img src="./login/img/pen2.png" id="pen">
<div id="joinbg">
	<form name="signin" method="post" onsubmit="return check()" action="join.do">
	<div id="joinform"><div id="joinpaper">
	<table id="jointable">
		<tr><td><div class="jointext title" align="center"><img src="./login/img/paperlogo.png" width="150px">&nbsp; 회원가입</div></td></tr>
		<tr>
			<% String notice=(String)request.getAttribute("notice");
				String id=(String)request.getAttribute("id");
				if(id==null){ id="";}
				if(notice==null){	notice=""; }
			%>
			<td>
				<input class="input" type="text" name="id" placeholder="아이디" value="<%=id %>">
				<input class="button" type=button value="ID중복확인" onClick="checkid()">
				<span class="jointext"><%=notice %></span>
			</td>
		</tr>
		<tr>
			<td>
				<input class="input" type=password name=password1 placeholder=비밀번호 onblur="pass()">
				<span class="jointext" id="ch_pw1">필수정보</span>
			</td>
		</tr>
		<tr>
			<td>
				<input class="input" type=password name=password2 placeholder="비밀번호 재확인" onblur="pass1()">
				<span class="jointext" id="ch_pw2">필수 정보입니다.</span>
			</td>
		</tr>
		<tr>
			<td>
				<input class="input" type=text name=name placeholder="이름">
			</td>
		</tr>
		
		<tr>
			<td>
			<input class="input_s" type="text" id="year" name="year" placeholder="년도" onblur="yearcheck()">
			<input class="input_s" type="text" id="month" name="month" placeholder="월" onblur="monthcheck()">
			<input class="input_s" type="text" id="day" name="day" placeholder="일" onblur="daycheck()">
			</td>
		</tr>
		<tr>
		    <td>
				<input class="input" type="text" id="postcode" name="zipcode" placeholder="우편번호">
				<input class="button" type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="width: 115px;"><p>
				<input class="input_xl" type="text" id="address" name="addr1" placeholder="주소"><p>
				<input class="input_l" type="text" id="address2" name="addr2" placeholder="상세주소">
		</td>
 		</tr>
		<tr>
			<td><input class="input_l" type=text name=email placeholder="이메일" onblur="emailcheck()" class="ta">
			</td>
		</tr>
		<tr>
			<td><input class="input" type=text name=tel placeholder="연락처" onblur="telcheck()" class="ta">
			</td>
		</tr>
		<tr>
		<td style="text-align: center"><div id=joinform2><input type=submit value="가입하기"></div></td>
		</tr>
	</table>
	</div>
	</div>
	</form>
	
</div>
