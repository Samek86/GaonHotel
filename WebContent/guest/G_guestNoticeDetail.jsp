<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="guest.common.DBbean_bo" %>
<%@ page import="guest.common.DBbean_rep" %>


<style type="text/css">
#G_guestbg {
  background: url(./guest/img/bg02_s.png) no-repeat fixed; 
	background-size: 100% cover;
	background-position: center -20px;
	height: 45%;
	width: 100%;
	display: table;
}
#G_guestbanner {
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


.boardcontents table{
	width: 70%;
	margin-left: 15%;
}

</style>

<%
try{
	String id=(String)session.getAttribute("NowUser"); //접속 id session 
	DBbean_bo notice=(DBbean_bo)request.getAttribute("notice"); 
	String pnum=(String)request.getAttribute("pnum"); 
	String type=notice.getType();
	if(type.equals("notice")) type="공지";
%>

<div id="G_guestbg">
 <div id="G_guestbanner">고객게시판</div></div>

<div class="boardbg"><div class="boardform"><div class="blackboard"><div class="boardcontents">
	<table class="table">
			<tr><td colspan="4"><h2>공지사항</h2></td></tr>
			<tr class="dotborder">
				<td width=20%>유형</td>
				<td width=25%>작성자</td>
				<td width=30%>제목</td>
				<td width=15%>날짜</td>
			</tr>
			<tr>
				<td><%= type %></td>
				<td><%= notice.getWriter() %></td>
				<td><%= notice.getTitle() %></td>
				<td><%= notice.getWdate() %></td>
			</tr>
		</table>
		<!-- \r\n으로 처리할 경우 -->
		<div><textarea class="comment" readonly><%=notice.getContent( ).replace("\\r\\n", "\r\n")%></textarea></div>
		<!-- <br>로 처리할 경우 -->
		<!-- <div><textarea class="comment" readonly>notice.getContent( ).replaceAll("<br>", "\r\n")</textarea></div>  -->
		<!-- 버튼 -->
		<div style="margin-top: 20px;">
			<a href='G_guest.do?pageNUM=<%= pnum%>'><input type='button' value="목록"  class="board-btn-s"></a>
			<a href='G_guestPreInsert.do'><input type='button' value="글쓰기" class="board-btn-s"></a>
			<% if(id.equals(notice.getWriter()) || id.equals("admin")){ %>
			<a href="G_guestNoticePreEdit.do?num2=<%=notice.getNum()%>"><input type='button' value="수정" class="board-btn-s"></a>		
			<a href="G_guestNoticeDelete.do?num=<%=notice.getNum()%>"><input type='button' value="삭제" class="board-btn-s"></a>
			<% System.out.println("공지디테일넘버"+notice.getNum());%>
			<%} %>
			<%
				}catch(Exception ex){   }
				%>
		</div>
	</div></div></div></div>

