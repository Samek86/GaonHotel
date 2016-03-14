<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>


<html>
<head><title></title>
<style>
html{margin: 0px; padding: 0px; }
body{margin: 0px; padding: 0px; }

</style>
	<script type="text/javascript">
	
	 /**
	  * 쿠키 설정
	  * a cookieName 쿠키명
	  * b cookieValue 쿠키값
	  * c expireDay 쿠키 유효날짜
	  */
		function setCookie(a,b,c){
			var todayDate = new  Date( );
			todayDate.setMinutes(todayDate.getMinutes()+c);
			var msg = a+"="+escape(b)+";path=/;expires=" + todayDate.toGMTString( )+";" ;
			document.cookie=msg;
			
		}//end
		
		 /**
		  * 쿠키 삭제
		  * @param cookieName 삭제할 쿠키명
		  */
		 function deleteCookie( a )
		 {
		  var expireDate = new Date();
		  
		  //어제 날짜를 쿠키 소멸 날짜로 설정한다.
		  expireDate.setDate( expireDate.getDate() - 1 );
		  document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
		 }
		
		function chkClick( ){
			setCookie("info_pop","false", 5);
			self.close( );
		}//end
	</script>
</head>
<body style="background-color: RGB(1,1,1);">
<div align="center">
	<img src="img/event11.jpg"  width=100% height=90%>
	<p>
	<font style="color:white;">
	<input type="checkbox" name="chk"  onClick="chkClick( )"><b>오늘 하루동안 안보기</b>
	</font>
	<p>
	
</div>	
</body>
</html>