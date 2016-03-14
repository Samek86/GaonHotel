<%@ page import="admin.common.DBbean"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
List<DBbean> listRoomType = (List<DBbean>)request.getAttribute("adminRoomPreInsertRoomType");
%>
<script>
	$(function() {
		$( "#pen" ).draggable({cursor: "pointer",cursorAt: { top: 210, left: 45 } });
	});
	
	$(function() {
		$( "#joinform" ).draggable({cursor: "pointer",cursorAt: { top: 235, left: 270 } });
	});
	
	$(function() {
		//input 초기화
		$("#inputRoomSort").val("<%= listRoomType.size() + 1 %>");
		$("#inputRoomImg1").hide();
		$("#inputRoomImg2").hide();
		$("#inputRoomImg3").hide();
		
		//inputRoomImg 이벤트
		$("#inputRoomImg1File").change(function() {
			var filePath = $("#inputRoomImg1File").val();
			var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
			$("#inputRoomImg1").val(fileName);
		});
		$("#inputRoomImg2File").change(function() {
			var filePath = $("#inputRoomImg2File").val();
			var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
			$("#inputRoomImg2").val(fileName);
		});
		$("#inputRoomImg3File").change(function() {
			var filePath = $("#inputRoomImg3File").val();
			var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
			$("#inputRoomImg3").val(fileName);
		});
		
		//selectRoomType 이벤트
		$("#selectRoomType").change(function() {
			$.ajax({
				url: "adminRoomPreInsert.do",
				data: "selectRoomType=" + $("#selectRoomType").val(),
				dataType: "json",
				type: "GET",
				success: function(data) {
					if($("#selectRoomType").val() == "add") {
						$("#inputRoomType").val("");
						$("#inputRoomSort").val("<%= listRoomType.size() + 1 %>");
						$("#inputRoomName").val("");
						$("#inputRoomCost").val("");
						$("#inputRoomMax").val("");
						$("#inputRoomText").val("");
						$("#inputRoomImg1").val("");
						$("#inputRoomImg2").val("");
						$("#inputRoomImg3").val("");
						
						$("#inputRoomType").attr("readonly", false);
						$("#inputRoomName").attr("readonly", false);
						$("#inputRoomCost").attr("readonly", false);
						$("#inputRoomMax").attr("readonly", false);
						$("#inputRoomText").attr("readonly", false);
						$("#inputRoomImg1").attr("readonly", false);
						$("#inputRoomImg2").attr("readonly", false);
						$("#inputRoomImg3").attr("readonly", false);
						
						$("#inputRoomImg1").hide();
						$("#inputRoomImg2").hide();
						$("#inputRoomImg3").hide();
						$("#inputRoomImg1File").show();
						$("#inputRoomImg2File").show();
						$("#inputRoomImg3File").show();
					} else {
						$("#inputRoomType").val(data.roomType);
						$("#inputRoomSort").val(data.roomSort);
						$("#inputRoomName").val(data.roomName);
						$("#inputRoomCost").val(data.roomCost);
						$("#inputRoomMax").val(data.roomMax);
						$("#inputRoomText").val(data.roomText);
						$("#inputRoomImg1").val(data.roomImg1);
						$("#inputRoomImg2").val(data.roomImg2);
						$("#inputRoomImg3").val(data.roomImg3);
						
						$("#inputRoomType").attr("readonly", true);
						$("#inputRoomName").attr("readonly", true);
						$("#inputRoomCost").attr("readonly", true);
						$("#inputRoomMax").attr("readonly", true);
						$("#inputRoomText").attr("readonly", true);
						$("#inputRoomImg1").attr("readonly", true);
						$("#inputRoomImg2").attr("readonly", true);
						$("#inputRoomImg3").attr("readonly", true);
						
						$("#inputRoomImg1").show();
						$("#inputRoomImg2").show();
						$("#inputRoomImg3").show();
						$("#inputRoomImg1File").hide();
						$("#inputRoomImg2File").hide();
						$("#inputRoomImg3File").hide();
					}
				},
				error: function(data) {
					alert("error : " + data);
				}
			});
		});
	});
</script> 
<style>
#joinbg {
    background: url(./login/img/woodbg.png) no-repeat center;
    position: static;  
    background-size: cover;
    height: 100%;
    margin: 0;
}

#jointable{
margin : 30px auto auto 30px;

}

#joinform {
	height: 85%;
	color : #444 !important;
	position : absolute;
	background-color : rgba(255, 0, 0, 0 );; /*rgba(26, 37, 48, 1 ); #1A2530; */
	left : 50%;
	width: 500px;
	margin-left:-250px;
	top : 110px;
	text-align : center;
	padding: 1em 0px;
	font-size: 2vmin;
	cursor: default;
    vertical-align: middle;
    z-index: 10;
    /* display: table-cell;  */
}
#joinform2 {
	height: 100px;
	color : #444 !important;
	position : relative;
	background-color : rgba(0, 0, 255, 0); /*rgba(26, 37, 48, 1 ); #1A2530; */
	width: 100%;
	top: 20px;
	text-align : center;
	padding: 25px auto;
	font-size: 2vmin;
	cursor: default;
    vertical-align: middle;
    /* display: table-cell;  */
}

#joinform .jointext {
	margin: 2px 0 2px 0;
}

#joinform .title {
	font-size:3vmin;
	margin: 15px 0px;
}

#joinform div, #joinform span{
color : #444;
font-size: 2vmin;
}
#joinform input::-webkit-input-placeholder{
color : #444;
font-size: 2vmin;
}
#joinform input:-ms-input-placeholder {
color : #444;
font-size: 2vmin;
}

#joinform .input {
	/* display : table; */
	color : #444;
	font-size: 2vmin;
	border-color : #444;
	height: 30px;
	width: 150px;
	outline: 0;
}
#joinform .input_s {
	/* display : table; */
	color : #444;
	font-size: 2vmin;
	border-color : #444;
	height: 30px;
	width: 100px;
	outline: 0;
}
#joinform .input_xl {
	/* display : table; */
	color : #444;
	font-size: 2vmin;
	border-color : #444;
	height: 30px;
	width: 370px;
	outline: 0;
}
#joinform .input_l {
	/* display : table; */
	color : #444;
	font-size: 2vmin;
	border-color : #444;
	height: 30px;
	width: 250px;
	outline: 0;
}
#joinform .button {
	/* display : table; */
	color : #444;
	font-size: 1.9vmin;
	border-color : #444;
	height: 30px;
	width: 105px;
	background-color: rgba(255,255,255,0);
	border-radius : 5px;
	border-style : solid;
	text-align: center;
	outline: 0;
}

#joinform .button:hover {
	color : #fff;
	text-decoration: none;
	background-color: #E74C3C; 
	transition: 0.3s all ease;
	-webkit-transition: 0.3s all ease;
	-moz-transition: 0.3s all ease;
	-o-transition: 0.3s all ease;
	-ms-transition: 0.3s all ease;
 }

#joinform2 input {	
 	margin : 15px;
	color: #444;
	background : rgba(255,255,255,0);
	border: 3px;
	border-radius : 10px;
	border-color : #444;
	border-style : solid;
	width : 15vmin;
	padding: 8px 15px;
	cursor: pointer;
	font-size: 2.8vmin;
	transition: 0.5s all ease;
	text-decoration: none;
	-webkit-transition: 0.5s all ease;
	-moz-transition: 0.5s all ease;
	-o-transition: 0.5s all ease;
	-ms-transition: 0.5s all ease;
	outline: 0;
}

#joinform2 input:hover {
	color : #fff;
	text-decoration: none;
	background-color: #E74C3C; 
 }
 
 #joinpaper {
	background : url(./login/img/memo2.png) no-repeat center;
	background-size: cover;
	height: 100%;
	width: 100%;
	position : absolute;
	left : 0;
	top : 0;
	padding: 10px 20px;
	text-align : center;
	margin: 0;
	z-index: 0;
}

#pen{
top :31.5%;
left : 60%;
width : 85px;
z-index : 2000;
cursor : pointer;
position : absolute;
transform:rotate(19deg);
-ms-transform::rotate(19deg);
-webkit-transform::rotate(19deg);
}

.btn-default {
border-color: #444;
}

.btn-default:hover, .btn-default:focus, .btn-default:AFTER, .btn-default:FOCUS  {
 
border-color: #444;
}
.open > .dropdown-toggle.btn-default , .open > .dropdown-toggle.btn-default:hover {
border-color: #444;
}

#joinform .input.lg33 {
width: 360px;
}
</style>
<div class="alert" style="position: fixed; bottom: 0;">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	  <h4><font color="#1A2530">종이와 펜은 이동 가능합니다</font></h4>
</div>
<img src="./login/img/pen2.png" id="pen">
<div id="joinbg">
	<form name="signin" method="post" enctype="multipart/form-data" action="adminRoomInsert.do">
		<div id="joinform">
			<div id="joinpaper">
				<table id="jointable">
					<tr><td><div class="jointext title" align="center"><img src="./admin/img/paperlogo.png" width="150px">&nbsp; 객실 추가</div></td></tr>
					<tr><td><input class="input" type="text" name="roomID" placeholder="객실 번호" required=></td></tr>
					<tr>
						<td>
							<input id="inputRoomType" class="input" type="text" name="roomType" placeholder="객실 유형" required=>
							<select id="selectRoomType" class="selectpicker wb">
								<option value="add">객실 유형 추가</option>
							<% for(int i = 0; i < listRoomType.size(); i++) { %>
								<option value="<%= listRoomType.get(i).getRoomType() %>"><%= listRoomType.get(i).getRoomType() %></option>
							<% } %>
							</select>
							<input id="inputRoomSort" type="hidden" name="roomSort">
						</td>
					</tr>
					<tr><td><input id="inputRoomName" class="input" type="text" name="roomName" placeholder="객실 이름" required=></td></tr>
					<tr><td><input id="inputRoomCost" class="input" type="text" name="roomCost" placeholder="객실 1박당 가격" required=></td></tr>
					<tr><td><input id="inputRoomMax" class="input" type="text" name="roomMax" placeholder="객실 최대 인원" required=></td></tr>
					<tr><td><input id="inputRoomText" class="input" type="text" name="roomText" placeholder="객실 설명" required=  style="width:340px;"></td></tr>
					<tr><td>
						<input id="inputRoomImg1File" class="input lg33" type="file" name="roomImg1File" placeholder="객실 이미지1" >
						<input id="inputRoomImg1" class="input" type="text" name="roomImg1">
					</td></tr>
					<tr><td>
						<input id="inputRoomImg2File" class="input lg33" type="file" name="roomImg2File" placeholder="객실 이미지2" >
						<input id="inputRoomImg2" class="input" type="text" name="roomImg2">
					</td></tr>
					<tr><td>
						<input id="inputRoomImg3File" class="input lg33" type="file" name="roomImg3File" placeholder="객실 이미지3" >
						<input id="inputRoomImg3" class="input" type="text" name="roomImg3">
					</td></tr>
					<tr><td style="text-align: center"><div id=joinform2>
						<input type="submit" value="등록하기">
						<input type="button" value="등록취소" onclick="location.href='adminRoomList.do'">
					</div></td></tr>
				</table>
			</div>
		</div>
	</form>
</div>