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
	DBbean_bo bb=(DBbean_bo)request.getAttribute("detail"); 
	List data=(List)request.getAttribute("colist");
	String pnum=(String)request.getAttribute("pnum"); 
	if(id==null){ id="guest";}
	
	String type=bb.getType();
	if(type.equals("review")) type="후기";
	else if(type.equals("qna")) type="질의응답";
	else if(type.equals("free")) type="자유글";
	else if(type.equals("notice")) type="공지";
%>

<div id="G_guestbg">
 <div id="G_guestbanner">고객게시판</div></div>
 
<div class="boardbg"><div class="boardform"><div class="blackboard"><div class="boardcontents">

		<table class="table">
			<tr class="dotborder">
				<td width=10%>유형</td>
				<td width=10%>글번호</td>
				<td width=30%>작성자</td>
				<td width=20%>제목</td>
				<td width=20%>날짜</td>
				<td width=10%>조회</td>
			</tr>
			<tr>
				<td><%= type %></td>
				<td><%= bb.getNum() %></td>
				<td><%= bb.getWriter() %></td>
				<td><%= bb.getTitle() %></td>
				<td><%= bb.getWdate() %></td>
				<td><%=bb.getCount() %></td>
			</tr>
		</table>	
		<div><textarea class="comment" readonly><%=bb.getContent( ).replaceAll("\r\n", "<br>")%></textarea></div>
		<!-- 버튼 -->	
		<div style="margin: 10px;">
			<a href='G_guest.do?pageNUM=<%= pnum%>'><input type='button' value="목록" class="board-btn-s"></a>
			<a href='G_guestPreInsert.do?num=<%=bb.getNum()%>&pageNUM=<%=pnum%>'><input type='button' value="글쓰기" class="board-btn-s"></a>
			<% if(id.equals(bb.getWriter()) || id.equals("admin")){ %>
			<a href="G_guestPreEdit.do?num=<%=bb.getNum()%>"><input type='button' value="수정" class="board-btn-s"></a>		
			<a href="G_guestDelete.do?num=<%=bb.getNum()%>"><input type='button' value="삭제" class="board-btn-s"></a>
			<%} %>
		</div>
		
		<div>
				<%--  <%=data.size() %>개 --%>
				 <jsp:include page="G_guestCoInsert.jsp" flush="false" />	
			<%	
			for(int i=0; i<data.size(); i++){
				DBbean_rep cc=(DBbean_rep)data.get(i);		
			%>		
			<table>		
			<tr class="dotborder">
				<td><%=cc.getRewriter() %></td>
				<td><%=cc.getRewdate() %></td>
				<td colspan="2"><%=cc.getRecontent() %></td>
				<td rowspan="2">
				<%	if(id!=null&&id.equals(cc.getRewriter()) || id.equals("admin")){	%>
				<form name=jin method=get action="G_guestCoDelete.do">
					<input type=hidden name=conum value=<%=cc.getRenum()%>>
					<input type=hidden name=num value=<%=bb.getNum()%>>				
					<input type=submit value="삭제" style="float:right; padding: 4px 2px;"  class="board-btn-s">
				</form>	
				<%	} %>
				</td>
			</tr>	
			</table>
			<%	} }catch(Exception ex){   } %>
	
</div></div></div></div></div>