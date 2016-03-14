<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="guest.common.DBbean_bo"%>
<%@ page import="guest.common.DBSQL_co"%>
<%@ page import="guest.common.DBSQL_re"%>
<%!private int startPage;
	private int pageCount;
	private int pageSize = 5;
	private int pageNUM, num;
	private int limit = 10;
	private String returnpage;%>


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

#star1 {
	/* background-position: 0px 0px; */
	background-image: url(guest/js/staryellow.png);
	background-size: 100%;
	width: 16px;
	height: 16px;
	display: inline-block;
}

#star2 {
	background-image: url(guest/js/stargray.png);
	/* background-position: 0px 30px; */
	background-size: 100%;
	width: 16px;
	height: 16px;/*16*/
	display: inline-block;
}
</style>

	<%
		try {
			int total = (Integer) request.getAttribute("total");
			int sub = (Integer) request.getAttribute("sub");
			returnpage = (String) request.getAttribute("returnpage");

			String pnum = request.getParameter("pageNUM");
			if (pnum == null)
				pnum = "1";
			pageNUM = Integer.parseInt(pnum);

			int temp = (pageNUM - 1) % pageSize;
			;
			startPage = pageNUM - temp;

			if (sub % limit == 0) {
				pageCount = sub / limit;
			} else {
				pageCount = (sub / limit) + 1;
			}

			num = sub - (pageNUM - 1) * limit;
			//System.out.println("startPage="+startPage+", pageCount="+pageCount);

			List data = (List) request.getAttribute("hotel");
			
			List noticedata = (List) session.getAttribute("notice");
			//List noticedata = (List) request.getAttribute("notice");
			DBSQL_co dbsql = new DBSQL_co(); //댓글SQL
	%>


<div id="G_guestbg">
<div id="G_guestbanner">고객게시판</div></div>

<div class="boardbg"><div class="boardform"><div class="blackboard"><div class="boardcontents">

		
			<div align="right">
				게시글 (<%=total%>)
			</div>

			<table>
				<tr>
					<td colspan=6 align="center">
						<form action="G_guest.do">
							<select name="keytype" class="selectpicker">
								<option value="all">전체글</option>
								<option value="review">후기</option>
								<option value="qna">질의응답</option>
								<option value="free">자유글</option>
							</select> 
							<select name="keyfield" class="selectpicker">
								<option value="writer">작성자</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select> 
							<input type=text name="keyword" class="text"> 
							<input class="board-btn-s" type="submit" value=" 검 색 ">
						</form>
					</td>
				</tr>
			</table>

			<table class="table">
				<tr class="dotborder">
					<td width=10%>유형</td>
					<td width=10%>글번호</td>
					<td width=15%>작성자</td>
					<td width=20%>제목</td>
					<td width=20%>날짜</td>
					<td width=10%>조회</td>
					<td width=15%>별점</td>
				</tr>
			<!-- DB있는 경우 -->
				<%
					for (int j = 0; j < noticedata.size(); j++) {
							DBbean_bo aa = (DBbean_bo) noticedata.get(j);
				%>
				<tr>
					<td colspan="1">공지사항</td>
					<td> </td>
					<td width="10px"><%=aa.getWriter()%></td><!-- 작성자 -->
					<td align=left><a href="G_guestNoticeDetail.do?num=<%=aa.getNum()%>&pageNUM=<%=pageNUM%>"><%=aa.getTitle()%> </a></td><!-- 제목 -->
					<td><%=aa.getWdate()%></td>	<!-- 날짜 -->
					<td>&nbsp; </td>
					<td>&nbsp; </td>
				</tr>
				<% } %>
				<%	for (int i = 0; i < data.size(); i++) {
							DBbean_bo bb = (DBbean_bo) data.get(i);
							int hh = dbsql.cototal(bb.getNum());
							String id = (String) session.getAttribute("NowUser");

							String type = bb.getType();
							if (type.equals("qna")){	type = "질의응답";}
							else if (type.equals("free")){type = "자유글";}
							else if (type.equals("review")){	type = "후기";}
				%>
				
				<tr>
					<td><%=type%></td>
					<td><%=bb.getRn()%></td>	<!-- 글번호 -->
				
					<td><%=bb.getWriter()%></td><!-- 작성자 -->
					
					<td align=left><a href="G_guestDetail.do?num=<%=bb.getNum()%>&pageNUM=<%=pageNUM%>">
						<%=bb.getTitle()%><!-- 제목 -->
						 <%	if (hh >= 1) {	 %>  [<%=hh%>] <% 	} %> <!-- 댓글수 --> </a></td>
					<td><%=bb.getWdate()%></td> <!-- 날짜 -->
					<td><%=bb.getCount()%></td><!-- 조회 -->
					<td>
						<%	if (type.equals("후기")) {
								int s = 1;
						for (s = 1; s <= bb.getRate(); s++) {
						%>
						<div id=star1></div><!-- 별점 --> 
						<%  } for(int k=0; k<=5-s; k++){%>
						<div id=star2></div><!-- 별점 -->
						<% } } %>
					</td>
				</tr>
				<%} } catch (Exception e) {	} %>
				</table>
				
				
				<%--
				<%	}		%> 
				<!-- DB없는 경우 -->
				 <%for(int q=0; q<10; q++){ %>
				<tr>
					<td>자유</td>
					<td><%=q%></td>	<!-- 글번호 -->
				
					<td>윤준호</td><!-- 작성자 -->
					
					<td align=left><a href="#">
						안녕하세요 뭐죠이거? <!-- 제목 -->
						 [3] <!-- 댓글수 --> </a></td>
					<td>2016/1/19</td> <!-- 날짜 -->
					<td>10</td><!-- 조회 -->
					<td>
						<%
								int s = 1;
						for (s = 1; s <= 3; s++) {
						%>
						<div id=star></div><!-- 별점 --> 
						<%  } for(int k=0; k<=5-s; k++){%>
						<div id=star2></div><!-- 별점 -->
						<% } %>
					</td>
				</tr> --%>
				
			<nav>
			  <ul class="pagination">
			  <%if (startPage >= 5) {%>
			    <li>
			      <a href="G_guest.do?pageNUM=<%=(startPage - pageSize) + returnpage%>" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			   <% } for (int i = startPage; i < (startPage + pageSize); i++) {
						if (i == pageNUM) { %>
			    <li class="active"><a href="#"><%=i %></a></li>
			    <%} else { %>
			    <li><a href="G_guest.do?pageNUM=<%= i + returnpage%>"><%=i %></a></li>
			    <% } if (i >= pageCount) break;
					} if (startPage + pageSize <= pageCount) {%>
			    <li>
			      <a href="G_guest.do?pageNUM=<%=(startPage + pageSize) + returnpage%>" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    <%} %>
			  </ul>
			</nav>

			<%-- <div>
				<%
					if (startPage >= 5) {
						out.print("<a href='G_guest.do?pageNUM=" + (startPage - pageSize) + returnpage + "'>◀ 이전</a>&nbsp;");
					}
					for (int i = startPage; i < (startPage + pageSize); i++) {
						if (i == pageNUM) {
							out.println("<font color=#6e6464>[" + i + "]</font>&nbsp;");
						} else {
							out.print("<a href='G_guest.do?pageNUM=" + i + returnpage + "'>" + i + "</a>&nbsp;");
						}
						if (i >= pageCount)
							break;
					}
					if (startPage + pageSize <= pageCount) {
						out.print("<a href='G_guest.do?pageNUM=" + (startPage + pageSize) + returnpage + "'>다음 ▶</a>");
					}
				%>
			</div> --%>
			
		<a href='G_guestPreInsert.do' class="board-btn pull-right" style="margin-top: -70px;">글쓰기</a>

	</div></div></div></div>