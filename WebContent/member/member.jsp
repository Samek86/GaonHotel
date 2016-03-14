<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.common.DBbean" %>
<%@ page import="member.common.DBSQL" %>
<%!
  private int startpage;
  private int pagecount;
  private int pagesize=5;
  private int pageNUM;
  private int temp=0;
  private int limit=10;
  private String returnpage;
%>


<style type="text/css">
#memberbg {
	background: url(./guest/img/bg02_s.png) no-repeat fixed;
	background-size: 100% cover;
	background-position: center -20px;
	height: 45%;
	width: 100%;
	display: table;
}

#memberbanner {
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

.boardcontents .board-btn-s:hover,
.boardcontents .board-btn-s:hover
 {
	background: #E74C3C;
	color: #bbb;
	transition: 0.5s all ease;
	-webkit-transition: 0.5s all ease;
	-moz-transition: 0.5s all ease;
	-o-transition: 0.5s all ease;
	-ms-transition: 0.5s all ease;
	text-decoration: none;
}
</style>

<% 
  try{
  	int total=(Integer)request.getAttribute("total");
  	returnpage=(String)request.getAttribute("returnpage");
  	String pnum=request.getParameter("pageNUM");
  	if(pnum==null) pnum="1";
  	pageNUM=Integer.parseInt(pnum);
  	temp = (pageNUM-1)%10;
  	startpage=pageNUM-temp;
  	if(total%limit==0) {pagecount=total/limit; }
  	else {pagecount=(total/limit)+1; }
  	
  	
  	List data=(List)request.getAttribute("member");
  	DBSQL dbsql = new DBSQL();
%>	
<div id="memberbg">
<div id="memberbanner">회원목록</div></div>

<div class="boardbg"><div class="boardform"><div class="blackboard"><div class="boardcontents">

	<form name="reviewlist">
		<div align="right">전체글 (<%=total %>)</div>
		<table>
			<tr>
				<td colspan=6 align="center">
					<form action="member.do">
					<select name=keyfield class="selectpicker">
						<option value=name>이 름</option>
						<option value=tel>연락처</option>
					</select>
					<input type=text name=keyword class="text">
					<input type=submit value="검 색" class="board-btn-s" >
					</form>
				</td>
			</tr>
		</table>
			
		<table class="table">
			<tr class="dotborder">
				<td>순번</td>
				<td>ID</td>
				<td>이름</td>
				<td>Email</td>
				<td>전화번호</td>
				<td>삭제</td>
			</tr>
			<%
		    for(int i=0; i<data.size(); i++){
			DBbean bb=(DBbean)data.get(i);
			%>
			<tr>
				<td><%=i+1 %></td>
				<td><%=bb.getId() %></td>
				<td><%=bb.getName() %></td>
				<td><%=bb.getEmail() %></td>
				<td><%=bb.getTel() %></td>
				<td><a href="memberDelete.do?id=<%=bb.getId()%>"><input type=button value="삭제" class="board-btn-s" ></a></td>
			</tr>
		<%		
		}}catch(Exception e){ }
		%>
			</table>
		</form>
		
	<nav>
		  <ul class="pagination">
		  <%if(startpage>=5){%>
		    <li>
		      <a href="member.do?pageNUM=<%=(startpage - pagesize) + returnpage%>" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		   <% } for (int i = startpage; i < (startpage + pagesize); i++) {
					if (i == pageNUM) { %>
		    <li class="active"><a href="#"><%=i %></a></li>
		    <%} else { %>
		    <li><a href="member.do?pageNUM=<%= i + returnpage%>"><%=i %></a></li>
		    <% } if (i >= pagecount) break;
				} if (startpage + pagesize <= pagecount) {%>
		    <li>
		      <a href="member.do?pageNUM=<%=(startpage + pagesize) + returnpage%>" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		    <%} %>
		  </ul>
		</nav>
	
	<!-- 검색 -->
	
</div></div></div></div>