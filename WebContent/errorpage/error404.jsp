<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
@charset "utf-8";
/* Reset */
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form,
	fieldset, input, textarea, p, blockquote, th, td {
	margin: 0;
	padding: 0;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

fieldset, img {
	border: 0;
}

address, caption, cite, code, dfn, em, strong, th, var {
	font-style: normal;
	font-weight: normal;
}

ol, ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

caption, th {
	text-align: left;
}

h1, h2, h3, h4, h5, h6 {
	font-size: 100%;
	font-weight: normal;
	margin: 0;
	padding: 0;
}

abbr, acronym {
	border: 0;
}

html, body {
	position: relative;
	height: 100%;
	background-color: #2C3E50
}

.wrap_page {
	position: relative;
	height: 100%;
	min-height: 455px;
	font-family: '돋움', dotum, sans-serif;
	color: #EAEAEA;
}

.wrap_page img {
	vertical-align: top;
}

.page_notice {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 860px;
	margin: -224px 0 0 -430px;
}

.page_notice .logo {
	padding-bottom: 20px;
	border-bottom: 2px solid;
	background: #2C3E50;
}

.logo img{
	width: 400px;
}
.page_notice .cont_notice {
	height: 330px;
	background: #2C3E50 no-repeat;
	zoom: 1;
	font: "white";
}

.page_notice .cont_notice:after {
	display: block;
	clear: both;
	content: '';
}

.page_notice .wrap_cont {
	float: left;
	overflow: hidden;
	margin: px;
	width: 100%;
	height: 100%;
	/* text-indent: -9999px; */
	color : #fff;
	font-size: 20px;
	line-height: 2;
	text-align: center;
}
.page_notice .footer {
	padding-top: 10px;
	border-top: 2px solid #EAEAEA;
	color: #EAEAEA;
	font-size: 11px;
	line-height: 12px;
	text-align: center;
}

.wrap_cont .btn {
    margin: 50px 20px;
    width: 18vmin;
    color: #ffffff;
    padding: 13px 25px;
    font-size: 22px;
    cursor: pointer;
    font-weight: 600;
    border: 2px;
    border-radius: 10px;
    border-color: #fff;
    border-style: solid;
    background: rgba(26, 37, 48, 0 );
    outline: none;
    text-decoration: none;
    transition : all 0.5s;
}
.wrap_cont .btn:hover {
	background-color: #E74C3C; 
}

.wrap_cont div{
margin: 10px;
}

</style>
<title>페이지 오류 입니다</title>
</head>
<% String errormsg = (String)session.getAttribute("error"); %>
<body>
	<div class="wrap_page">
		<div class="page_notice">
		<div align="center">
			<h1 class="logo">
				<a href="../index.jsp"> <img src="../errorpage/img/logo2.png" />
				</a>
			</h1>
			</div>
			<div class="cont_notice">
				<div class="wrap_cont">
					<br>
					고객님께서 찾으시는 페이지를 찾을 수 없습니다.<br>
					잘못된 링크를 사용하셨거나 찾고 계시는 페이지가 존재하지 않습니다.<br>
					이용에 불편을 드려 죄송합니다.<br>
					문의전화:1644-0000<br>
					오류정보 : <%=errormsg %><br>
					<div><a class="btn" href="../index.jsp">메인으로</a></div><br>
				</div>
			</div>
			<div class="footer">COPYRIGHT ⓒGaon Hotel INC. ALL RIGHTS
				RESERVED.</div>
		</div>
	</div>

	<div id="content" style="display: none;">
		404 Page Not Found
		<p>The page you requested was not found.</p>
	</div>
</body>
</html>