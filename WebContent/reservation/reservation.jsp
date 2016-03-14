<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../ssi.jsp"%>

<script src="./reservation/js/reservation.js"></script>
<link href="./reservation/css/reservation.css" rel="stylesheet">

<%!String from = "", to = "", adult = "", children = "0";%>

<%
try {
	from = (String) session.getAttribute("from");
	to = (String) session.getAttribute("to");
	adult = (String) session.getAttribute("adult");
	children = (String) session.getAttribute("children");
		
	if (from == null) {	from = "";}
	if (to == null) { to = "";}
	if (adult == null) { adult = "";}
	if (children == null||children.equals("")) {children = "0";}
		
%>
<body>
	<div id="revbg">
		<div id="revbanner">예약하기</div>
	</div>
	<form method="post" action="reservation.do" style="height: 40px;" class="longbanner">
		<div class="banner-top2">
			<div align="center">
				<div class="input-append">
					<input placeholder="체크인" class="input-small" id="from2"
						name="from" type="text" value="<%=from%>"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = '';}" required=>
					<i class="add-on fa fa-calendar-o"></i>
				</div>
				<div class="input-append">
					<input placeholder="체크아웃" class="input-small" id="to2" name="to"
						type="text" value="<%=to%>" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = '';}" required=>
					<i class="add-on fa fa-calendar-o"></i>
				</div>
				<span style="margin: 0px 1vmax;" id="sp_2"> <select	name="adult" class="selectpicker" data-size="5" required=>
						<option value="<%=adult%>"><%=adult.equals("") ? "어른" : adult + "명"%></option>
						<%
							for (int i = 1; i <= 6; i++) {
						%>
						<option value="<%=i%>"><%=i%>명
						</option>
						<%
							}
						%>
				</select>
				</span> <span style="margin: 0px 1vmax;" id="sp2_2"> <select name="children" class="selectpicker" data-size="5">
						<option value="<%=children%>"><%=children.equals("") || children.equals("0") ? "어린이" : children + "명"%></option>
						<%
							for (int i = 1; i <= 4; i++) {
						%>
						<option value="<%=i%>"><%=i%>명
						</option>
						<%
							}
						%>
				</select>
				</span> <input type="hidden" id="nights2" name="nights"> <span
					class="bnr-btn"> <input type="submit" value="객실검색">
				</span>
			</div>
		</div>
	</form>

<div class="blankdiv"></div>
<!-- ============================================================================ -->
<% 


List roomlist = (List) session.getAttribute("roomlist"); //전체룸(중복X) 4개
List remindlist = (List) session.getAttribute("remind"); //예약가능방 3개
List bookedlist = (List) session.getAttribute("booked"); //예약불가능방 1개
List revlist = (List) session.getAttribute("revlist");// 예약가능룸 11개
roomDBbean roombean = null;
revDBbean revbean = null;
roomDBbean remindbean = null;
roomDBbean bookedbean = null;

//=======================모든 방 출력(날짜선택X) =========================//
if(from.equals("")||from==null||roomlist==null||remindlist==null){
	for (int i = 0; i < roomlist.size(); i++) { 
		roombean = (roomDBbean) roomlist.get(i);
		%>
		<div class="roomselect">
			<div class="imgdiv">
				<img class="rev_roomimg" src="rooms/img/<%=roombean.getRoomImg1()%>">
			</div>
			<br>
			<div class="revtitle"><%=roombean.getRoomName()%>
				<span class="revsubtitle1"> 최대인원 <%=roombean.getRoomMax()%>명
					&nbsp; <%=roombean.getRoomCost()/10000%>만원 / 1박
				</span>
			</div>
			<div class="revsubtitle2"><%=roombean.getRoomText()%></div>
			 <span class="bnr-btn"><input class="saki" type="button" value="날짜부터 선택하세요" onclick="document.getElementById('from2').focus()"></span>
		</div>
		<%
	}
}//if end
//=========================예약가능 방 출력 ===========================//
if(!from.equals("")){
for(int rm=0; rm<remindlist.size(); rm++){
int nn = 0;
List<Integer> roomNumlist = new ArrayList<Integer>();
	remindbean = (roomDBbean) remindlist.get(rm);
	for (int k = 0; k < revlist.size(); k++) { 
		revbean = (revDBbean) revlist.get(k);
		if(revbean.getRoomType().equals(remindbean.getRoomType())){
			roomNumlist.add(nn, revbean.getRoomID()); 
			nn++;
		}
	}
%>
<div class="roomselect">
	<div class="imgdiv">
		<a href="room.do?roomType=<%=remindbean.getRoomType()%>">
		<img class="rev_roomimg" src="rooms/img/<%=remindbean.getRoomImg1()%>">
		</a>
	</div>
	<br>
	<form name="roomidid">
	<div class="revtitle"><%=remindbean.getRoomName()%>
		<span class="revsubtitle1"> 최대인원 <%=remindbean.getRoomMax()%>명
			&nbsp; <%=remindbean.getRoomCost()/10000%>만원 / 1박
		</span>
	</div>
	<div class="revsubtitle2"><%=remindbean.getRoomText()%></div>
	<input name="roomCost" type="hidden" value="<%=remindbean.getRoomCost()/10000%>">
	<input name="roomName" type="hidden" value="<%=remindbean.getRoomName()%>">
	<select name="roomID" class="selectpicker wid150" data-size="6"
		data-width="11vmax" required= >
		<% for (int j = 0; j < roomNumlist.size(); j++) { %>
		<option value="<%=roomNumlist.get(j)%>" class="roomnumber"><%=roomNumlist.get(j)%>호실</option>
		<% 
		} %>
	</select> <span class="bnr-btn"><input type="button" value="선택" onclick="roomselect(roomID.value, roomCost.value, roomName.value);"></span></form>
</div>

<% 	

}

//=========================예약 불가능 방 출력 ===========================//

for(int bl=0; bl<bookedlist.size(); bl++){
	bookedbean = (roomDBbean) bookedlist.get(bl);
%>
<div class="roomselect dis">
	<div class="imgdiv">
		<img class="rev_roomimg" src="rooms/img/<%=bookedbean.getRoomImg1()%>">
	</div>
	<br>
	<div class="revtitle"><%=bookedbean.getRoomName()%>
		<span class="revsubtitle1"> 최대인원 <%=bookedbean.getRoomMax()%>명
			&nbsp; <%=bookedbean.getRoomCost()/10000%>만원 / 1박
		</span>
	</div>
	<div class="revsubtitle2"><%=bookedbean.getRoomText()%></div>
	<span class="bnr-btn"><input id="disab" type="button" value="예약가능한 방이 없습니다" disabled></span>
</div>
<% 	}

}//if end 
%>

<!--========================= 최종 예약 ===========================-->
<div style="height: 100px"></div>

<div id="lastrevbg">
<div id="lastrev">
	<!-- 결과창 -->
		<br><br>
		<span class="pinktext">예약확인</span><br>
		<font size=5>
		_____<br>
	<% if(session.getAttribute("NowUser")!=null){ %>
		예약자 성함 : <%=session.getAttribute("NowName")%>님 <br>
	<%} %>
		체크인 : <%=from%> &nbsp; &nbsp;
		체크아웃 : <%=to %> &nbsp;&nbsp;
		숙박일 : <span id="NI"></span> 박<br>
		 어른 : <%=adult%> 명 &nbsp;&nbsp; 
		 어린이 : <%=children%> 명 &nbsp;&nbsp;
		 객실타입 : <span id="RoomName"></span> &nbsp;&nbsp;  객실번호 : <span id="RN"></span>호실<br>
		 총 금액 : <span id="TotalCost"></span>만원<br></font>
		  
	<!-- 로그인이 안되어있을 경우 -->
	<form action="revLast.do" method="post" >
		<input type="hidden" name="roomnumber" value="" id="hiddenroomNum">
		<input type="hidden" name="TotalCost" value="" id="hiddenTotalCost">
		<input type="hidden" name="nights" value="" id="hiddenNights">
		<input type="hidden" name="roomName" value="" id="hiddenRoomName">
	
	<% if(session.getAttribute("NowUser")==null){ %>
		<br>
		<input type="text" placeholder="이름" name="notloginName" required=>
		<input type="text" placeholder="이메일" name="notloginEmail" style="width: 300px;" required=>
		<input type="text" placeholder="전화번호" name="notloginTel" required=><br>
	<% } else{%><br>  <%} }catch(Exception e){} %>
		<span class="bnr-btn">
		<input type="submit" value="예약하기" id="lastrevbutton"></span>
	</form>
</div></div>
</body>
