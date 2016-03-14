<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="guest.common.DBbean_bo" %>
<%
try{
	String id=(String)session.getAttribute("NowUser"); 
	DBbean_bo bb=(DBbean_bo)request.getAttribute("detail"); //현재 게시글
	String pnum = (String)request.getParameter("pageNUM");
	System.out.println("sdfsdfsdf"+pnum);
	if(id==null){ id="guest";}
%>
	<form name=cmt action="G_guestCoInsert.do">
	<input type=hidden name=rewriter value=<%=id%>>
	<input type=hidden name=pnum value=<%=pnum%>>
	<input type=hidden name=num value=<%=bb.getNum() %>>
	<input type=text name=recontent class="text lg4">
	<input type=submit value="덧글입력" class="board-btn-s mm">
	</form>
<%	}catch(Exception e){ System.out.println("comment.jsp 예외오류 : "+e.toString()); } %>
