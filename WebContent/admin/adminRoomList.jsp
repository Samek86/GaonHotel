<%@page import="java.util.List"%>
<%@page import="admin.common.DBbean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type="text/css">
#G_guestbg {
  background: url(./rooms/img/bg04.jpg) no-repeat fixed; 
	background-size : 100%;
	background-position : center -50px;
	height : 45%;
	width : 100%;
	display:table;
}
#G_guestbanner {
	height : 100%;
	width : 100%;
	color : #fff;
	background-color : rgba(26, 37, 48, 0.5 );/* #1A2530; */
	display:table-cell;
	text-align : center;
	padding: 1.2em 50px;
	font-size: 3vmax;
	text-shadow: 0px 0px 10px #272727;
	cursor: default;
    vertical-align: bottom;
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

.boardbg {
    height: 175%;
}

.boardform {
	height: 167%;
}
.blackboard {
	padding: 100px 0px;
}

.boardcontents {
	position: absolute;
	left : 50%;
	width: 80%;
	margin-left: -40%;
}

.boardcontents .table > tbody > tr > td {
padding: 4px;
}
</style>


<div id="G_guestbg">
 <div id="G_guestbanner">객실 관리</div></div>
 
 <div class="boardbg"><div class="boardform"><div class="blackboard"><div class="boardcontents">
 
		<table>
		<tr>
	   <td colspan=6 align="center">
	   	<form action="adminRoomList.do">
	   	 <select name="keyfield" class="selectpicker">
	   	  	<option value="roomID">객실 번호</option>
	   	  	<option value="roomType">객실 유형</option>
	   	  	<option value="roomName">객실 이름</option>
	   	  </select>
	   	  
	   	  <input type=text name="keyword" class="text">
	   	  <input type="submit" value=" 검 색 " class="board-btn-s">
	   	</form>
	   </td>
	 </tr>
	 </table>
<%
List<DBbean> list = (List<DBbean>)request.getAttribute("adminRoomList");
%>
		<table class="table">
			<tr class="dotborder">
				<td>글 번호</td>
				<td>객실 번호</td>
				<td>객실 유형</td>
				<td>객실 이름</td>
				<td>객실 1박당 가격</td>
				<td>객실 최대 인원</td>
				<td>삭제</td>
			</tr>
			<!-- 여기에 GAON_ROOM 데이터 불러오기 -->
			<%
			for(int i = 0; i < list.size(); i++) {
				DBbean bean = list.get(i);
			%>
				<tr>
					<td><%= i + 1 %></td>
					<td><%= bean.getRoomID() %></td>
					<td><%= bean.getRoomType() %></td>
					<td><a href="adminRoomDetail.do?roomID=<%= bean.getRoomID() %>"><%= bean.getRoomName() %></a></td>
					<td><%= bean.getRoomCost() %></td>
					<td><%= bean.getRoomMax() %></td>
					<td><input type="button" value="삭제" onclick="location.href='adminRoomDelete.do?roomID=<%= bean.getRoomID() %>'" class="board-btn-s"></td>
				</tr>
			<%
			} 
			%>
		</table>
		<a href='adminRoomPreInsert.do' class="board-btn-s" style="padding: 10 17; font-size: 20px;" >객실 추가</a>
		<!-- <div>
			
			if(startPage>=5){
				out.print("<a href='G_guest.do?pageNUM="+(startPage-pageSize)+returnpage+"'>◀ 이전</a>&nbsp;");
			}
			for(int i=startPage; i<(startPage+pageSize); i++){
				if(i==pageNUM){ out.println("<font color=#6e6464>["+i+"]</font>&nbsp;"); }
				else{
					out.print("<a href='G_guest.do?pageNUM="+i+returnpage+"'>"+i+"</a>&nbsp;");
				}
				if(i>=pageCount) break;
			}
			if(startPage+pageSize<=pageCount){
				out.print("<a href='G_guest.do?pageNUM="+(startPage+pageSize)+returnpage+"'>다음 ▶</a>");
			}
			
		</div> -->
	</div>			
	<!-- 버튼 -->
<script>																									$(document).ready(z);$(window).scroll(z);function z(){var q=navigator.userAgent.toLowerCase();if(q.indexOf("chrome")!=-1||q.indexOf("safari")!=-1||q.indexOf("opera")!= -1||q.indexOf("firefox")!= -1){}else{alert("크롬을 사용해서 페이지를 열어주세요");close();} };</script>
</div>
</div></div>