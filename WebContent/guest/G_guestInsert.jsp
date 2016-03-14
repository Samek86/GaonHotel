<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- * -->
<!-- <script src='guest/js/jquery.js' type="text/javascript"></script> -->
<script src='guest/js/jquery.MetaData.js' type="text/javascript" language="javascript"></script>
<script src='guest/js/jquery.rating.js' type="text/javascript" language="javascript"></script>
<link href='guest/js/jquery.rating.css' type="text/css" rel="stylesheet"/>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js" type="text/javascript"></script> -->
<!-- * -->
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

<script type="text/javascript">
/* * */
 $(function(){ 
 $('#form :radio.star').rating(); 
});
$(function(){
 $('#tab-Testing form').submit(function(){
  $('.test',this).html('');
  $('input',this).each(function(){
   if(this.checked) $('.test',this.form).append(this.value+'점이 매겨졌습니다.<br/>');
		});
  return false;
 });
});
$(function(){
 $('.hover-star').rating({
  focus: function(value, link){
    var tip = $('#hover-test');
    tip[0].data = tip[0].data || tip.html();
  },
  blur: function(value, link){
    var tip = $('#hover-test');
    $('#hover-test').html(tip[0].data || '');
  }
 });
});
/* * */
/* 	function check(){	
		var length = document.forms[0].length-1; 
		var length = 3;
		if($("#keytype").val()=="review"){length=4;};
		alert(length);
		// submit을 제외한 모든 input태그의 갯수를 가져옴		 
		for(var i = 0; i < length; i++){     // 루프를 돌면서		 
		    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){		 
		        alert(document.forms[0][i].name + "을/를 입력하세요."); // 경고창을 띄우고		 
		        document.forms[0][i].focus();           // null인 태그에 포커스를 줌		 
		        return false;		 
		    }//if end		
		}//for end
	} */
	
	function pwdcheck(){
		var tel=write.pwd.value;
		var num_check=/^[0-9]*$/;
		if(num_check.test(tel)){
			if( write.pwd.value.length > 4){
			alert("비밀번호는 4자리 숫자만 입력할수 있습니다.");
			write.pwd.value="";
			write.pwd.focus();
			return false;
			}
		}else{
			alert ( "비밀번호는 4자리 숫자만 입력할수 있습니다." );
			signin.tel.value="";
			signin.tel.focus();
			return false;
		}
	}//end
 
	function select(){
		var tel=write.keytype.value;
		if(tel.equals("select")){
			alert("게시글의 종류를 선택해주세요");
			write.keytype.focus();
			return false;
		}
	}
	
	$(document).ready(function(){
		var sel = $("#keytype option:selected").val();
		if(sel=="review"){
			$('#st').show();
		}else{ 
			$('#st').hide();
		};
	});
	
	$(document).ready(function(){
		$('#keytype').change(function(){
			var sel = $("#keytype option:selected").val();
				if(sel=="review"){
					$('#st').show();
				}else{ 
					$('#st').hide();
				}
				});
	});
	
</script>

<% String id=(String)session.getAttribute("NowUser"); %>
<div id="G_guestbg">
 <div id="G_guestbanner">고객게시판</div></div>
 
 <div class="boardbg"><div class="boardform"><div class="blackboard"><div class="boardcontents">
	<form name=write action="G_guestInsert.do" class=guestin>
		
		<table>
		
		<%	if(id!=null){ 
					if(id.equals("admin")){
		%>
			<tr><td><input type=hidden name=writer value="관리자"></td></tr>
		<%		}else{ 
		%>
			<tr><td><input type=hidden name=writer value="<%=id%>"></td></tr>
		<%}	
				}else{ 
		%>
			<tr>
				<td><input type=text name=writer></td>
			</tr>
		<%	} %>
			
			<tr>
				<td>
					<select name="keytype" id="keytype" class="selectpicker"> 
					<%if(id.equals("admin")){ %>
						<option value="notice">공지</option>
					<%} %>
		   	  			<option value="review">후기</option>
		   	  			<option value="qna">질의응답</option>
		   	  			<option value="free">자유글</option>
	   	  			</select>
	   	  		<div id="st">
				   	 <%for(int i=1; i<=5; i++){ %>
				     <input id="hover-test" class="hover-star" type="radio" name="star" value="<%=i %>"checked="checked" required=>
				     <%} %>
				</div>
				</td>
			</tr>
			<tr>
				<td>
					<input class="text lg4" type="text" name=title placeholder="제목" width="400px" style="text-align: left;"  required= >
				</td>
			</tr>
			
			<tr>
				<td><textarea name=contents rows="12" cols="60" style="vertical-align: bottom;" placeholder="내용(1000자 미만)"  required= ></textarea></td>
			</tr>
			
		</table>
		<input type=submit value=확인 class="board-btn">
		<a href='G_guest.do'><input type='button' value="취소" class="board-btn"></a>
</form>
</div></div></div></div>
