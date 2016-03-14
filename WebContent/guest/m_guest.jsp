<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>m_event.jsp</title>
<link rel="stylesheet" type="text/css" href="guest/css/guest.css">
</head>
<body id="guest_center">
<div id="guest_title"> 
	<div class="guest_titleB">
		<span style="font-size:1.5em; padding-right:10px;">Board</span>
		<span>아무말이나 해보세요</span>
	</div>
</div>
<div id="wrap">
<div id="guest_left">
	<ul>
		<li><a href="G_guest.do">Board</a></li>
	</ul>
</div>
<div id="guest_section">
	<% 
	String pageFile=request.getParameter("page") ;
	String listFile=request.getParameter("list") ;
	if(listFile.equals("G_guest")){
		pageFile="G_guest";
	}else if(listFile.equals("G_guestInsert")){
		pageFile="G_guestInsert";
	}else if(listFile.equals("G_guestDelete")){
		pageFile="G_guestDelete";
	}else if(listFile.equals("G_guestDetail")){
		pageFile="G_guestDetail";
	}else if(listFile.equals("G_guestEdit")){
		pageFile="G_guestEdit";
	}else if(listFile.equals("G_guestCoInsert")){
		pageFile="G_guestCoInsert";
	}

	if(listFile.equals("G_guest") ){ %>
	<jsp:include page='<%= listFile+".jsp" %>' />
	<% }else if(listFile.equals("G_guestInsert")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("G_guestDelete")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("G_guestDetail")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("G_guestEdit")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("G_guestCoInsert")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% } %>
</div>
</div>
</body>
</html>