<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="guest.common.DBbean_bo" %>
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
text-align: left;
margin-left: 27%;
}
#st {
display: inline;
}

.boardcontents .bootstrap-select.btn-group:not(.input-group-btn) {
display: inline;
float: left;
margin-right: 30px;
}

.boardcontents table {
    margin-top: 40px;
}

.boardcontents input.text {
    margin-top: 15;
   }
   
input.board-btn {
   margin-top: 20;
   }
</style>

<%
	try{
	DBbean_bo bean=(DBbean_bo)request.getAttribute("hey");
%>

<div id="G_guestbg">
 <div id="G_guestbanner">고객게시판</div></div>


<div class="boardbg"><div class="boardform"><div class="blackboard"><div class="boardcontents">

	<form name=guestInsert action="G_guestNoticeEdit.do" class="guestin">
	<table>
		<tr>
			<td>
				<select name="keytype" class="selectpicker">
				<option value="notice">공지</option>
	   	 </select>
			</td>
		</tr>
			
		<tr>
			<td><input type=hidden name=num value="<%=bean.getNum()%>">
			<input type=text name=title value="<%=bean.getTitle() %>" class="text lg4" placeholder="제목" style="text-align: left;"  required= ></td>
		</tr>
		<tr>
			<td><textarea name=contents rows=20 cols=60 style="vertical-align: bottom;" placeholder="내용(1000자 미만)" required= ><%=bean.getContent() %></textarea></td>
		</tr>
	</table>
	<!-- 버튼 -->
		<input type=submit value=확인 class="board-btn">
		<a href='G_guest.do'><input type='button' value="취소"  class="board-btn"></a>
	</form>	
		
<%
	}catch(Exception e){  System.out.println("edit 오류 : "+e.toString());}
%>	
</div></div></div></div>
