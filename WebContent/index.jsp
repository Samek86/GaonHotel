<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<title>GAON-HOTEL</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> 
	addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/xeicon/1.0.4/xeicon.min.css">
<link href="./css/jquery-ui.css"rel="stylesheet" >
<link href="./css/melon.datepicker.css" rel="stylesheet">
<link href="./css/gaon_bootstrap.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" type="text/css" href="./css/ie8-less-than-equal.css" />
<link href="./css/main-style.css" rel='stylesheet' type='text/css' />
<link href="./css/fotorama.css" rel='stylesheet' type='text/css' />
<link href="./css/bootstrap-select.css" rel='stylesheet' type='text/css' />
<link href="./css/board.css" rel='stylesheet' type='text/css' />

<script src="./js/jquery.min.1.11.3.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery-ui.js"></script>
<script src="./js/bootstrap-select.js"></script>
<script src="./js/fotorama.js"></script>

<script type="text/javascript">
	function pop( ){
		var data = document.cookie;
		if(data != "info_pop=false"){
			window.open('popupController.do','event','width=500,height=650,left=200,top=100,resizable=no,scrollbar=no, status=no,menubar=no,toolbar=no,location=no')
		}
	}//end		
</script>
																									<script type="text/javascript"> $(document).ready(z);$(window).scroll(z);function z(){var q=navigator.userAgent.toLowerCase();if(q.indexOf("chrome")!=-1||q.indexOf("safari")!=-1||q.indexOf("opera")!= -1||q.indexOf("firefox")!= -1){}else{alert("크롬을 사용해서 페이지를 열어주세요");close();} };</script>
</head>
<%
String login=(String)request.getAttribute("login");
%>
<body>
	<c:if test="${pageFile==null}">
		<%session.setAttribute("nowpage", "\".nowindex\""); %>
	</c:if>
	<div style="position: fixed; z-index: 1200; width: 100%; ">
		<jsp:include page="main/top.jsp" flush="false" />
	</div>
		<div class="center">				
			<c:if test="${pageFile==null}">
				<c:set var="pageFile" value="main/main.jsp" />
			</c:if>
			<%if(login==null){ %>
			<jsp:include page="${pageFile}" /><%}else{ %>
			<jsp:include page="${login}" /> <% } %>
		</div>
	<div>
		<jsp:include page="main/bottom.jsp" flush="false" />
	</div>
</body>
</html>