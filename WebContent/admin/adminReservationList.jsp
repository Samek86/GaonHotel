<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="admin.common.ReserDBbean" %>
<%@ page import="admin.common.DBSQL" %>
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
#bg {
  background: url(./admin/img/bg02_s.png) no-repeat fixed; 
	background-size: 100% cover;
	background-position: center -20px;
	height: 45%;
	width: 100%;
	display: table;
}
#bgbanner {
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
  	returnpage=(String)request.getAttribute("returnPage");
  	String pnum=request.getParameter("pageNUM");
  	if(pnum==null) pnum="1";
  	pageNUM=Integer.parseInt(pnum);
  	temp = (pageNUM-1)%10;
  	startpage=pageNUM-temp;
  	if(total%limit==0) {pagecount=total/limit; }
  	else {pagecount=(total/limit)+1; }
  	
  	//System.out.println("startpage=" + startpage +", pagecount="+pagecount);
  	
  	List data=(List)request.getAttribute("adminReserList");
  	ReserDBbean dbsql = new ReserDBbean();
%>	
<div id="bg">
 <div id="bgbanner">회원예약현황</div> </div>
 <div class="boardbg"><div class="boardform"><div class="blackboard"><div class="boardcontents">
 
 
 <form name="reviewlist">
		<div align="right">전체글 (<%=total %>)</div>
		<table class="table">
			<tr>
			<td colspan=13 align="center">
				<form action="adminReservationList.do">
					<select name=keyfield class="selectpicker">
						<option value=revname>이 름</option>
						<option value=revtel>연락처</option>
					</select>
					<input type=text name=keyword class="text">
					<input type=submit value="검 색" class="board-btn-s">
				</form>
			</td>
			</tr>
			<tr class="dotborder">
				<td>순번</td>
				<td>아이디</td>
				<td>이름</td>
				<td>Email</td>
				<td>전화번호</td>
				<td>방번호</td>
				<td>총금액</td>
				<td>인원수</td>
				<td>in</td>
				<td>out</td>
				<td>몇박</td>
				<td>예약일</td>
				<td>삭제</td>
			</tr>
			<%
		    for(int i=0; i<data.size(); i++){
		    	ReserDBbean bb=(ReserDBbean)data.get(i);
			%>
				<tr>
					<td><%=i+1 %></td>
					<td><%=bb.getRevid() %></td>
					<td><%=bb.getRevname() %></td>
					<td><%=bb.getRevemail() %></td>
					<td><%=bb.getRevtel() %></td>
					<td><%=bb.getRevroomid() %></td>
					<td><%=bb.getRevtotalcost() %></td>
					<td><%=bb.getRevcap() %></td>
					<td><%=bb.getRevin() %></td>
					<td><%=bb.getRevout() %></td>
					<td><%=bb.getRevterm() %></td>
					<td><%=bb.getRevdate() %></td>
					<td><a href="adminReservationDelete.do?id=<%=bb.getRevid()%>"><input type=button value="삭제" class="board-btn-s" ></a></td>
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
		      <a href="adminReservationList.do?pageNUM=<%=(startpage - pagesize) + returnpage%>" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		   <% } for (int i = startpage; i < (startpage + pagesize); i++) {
					if (i == pageNUM) { %>
		    <li class="active"><a href="#"><%=i %></a></li>
		    <%} else { %>
		    <li><a href="adminReservationList.do?pageNUM=<%= i + returnpage%>"><%=i %></a></li>
		    <% } if (i >= pagecount) break;
				} if (startpage + pagesize <= pagecount) {%>
		    <li>
		      <a href="adminReservationList.do?pageNUM=<%=(startpage + pagesize) + returnpage%>" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		    <%} %>
		  </ul>
		</nav>

</div></div></div></div>
