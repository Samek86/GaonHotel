<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
#qnabg {
    background: url(./guest/img/bg02_s.png) no-repeat fixed;
	background-size: 100% cover;
	background-position: center -20px;
	height: 45%;
	width: 100%;
	display: table;
}
#qnabanner {
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


td a {
	color: #000;
}

.paging a {
	<!-- color: #000; -->
	font-size: 15px;
}
</style>
<link href="guest/css/SpryCollapsiblePanel.css" rel="stylesheet" type="text/css">
<script src="guest/js/jquery-1.11.3.js"></script>
<script src="guest/js/SpryCollapsiblePanel.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#select_type").change(function() {
			document.form.submit();
		});
	});
</script>



<div id="qnabg">
<div id="qnabanner">Q & A</div></div>
	
<div class="gridContainer clearfix">
  <div id="CollapsiblePanel1" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q. &nbsp;객실 체크인과 체크아웃 시간은 언제인가요?</div>
    <div class="CollapsiblePanelContent">
        <div class="abox"><span class="boldtext">A.</span> &nbsp;체크인 시간은 오후 2시부터이며 체크아웃은 정오 12시 입니다.</div>
        <ul class="tab">
		</ul>
    </div>
  </div>
  </div> 
  <div id="CollapsiblePanel2" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q. &nbsp;객실 투숙 중인 고객에게 연락하려면 어떻게 해야 되나요? </div>
    <div class="CollapsiblePanelContent">
        <div class="abox"><span class="boldtext">A.</span> &nbsp; 호텔 대표번호로 전화하여 투숙 고객의 성함을 알려주시면 됩니다.</div>
    </div>
  </div>

  <div id="CollapsiblePanel3" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q. &nbsp;호텔을 이용할 때 직원에게 팁을 지불해야 하나요?</div>
    <div class="CollapsiblePanelContent">
        <div class="abox"><span class="boldtext">A.</span> &nbsp; 호텔 이용시 봉사료가 포함되어 있기 때문에 따로 지불하실 필요가 없습니다.</div>
        <ul class="tab">
        </ul>
    </div>
  </div>
  <div id="CollapsiblePanel4" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q. &nbsp;호텔 내에서 인터넷을 사용할수 있나요?</div>
    <div class="CollapsiblePanelContent">
        <p class="abox"><span class="boldtext">A.</span> &nbsp;호텔 객실에서는 유.무선 인터넷을 모두 사용할수 있으며
           호텔 내 레스토랑이나 라운지에서는 무선인터넷을 사용할수있습니다.</p>
        <ul class="tab">
		</ul>
    </div>
  </div>
  <div id="CollapsiblePanel5" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q. &nbsp;객실 취소후 환불을 어떻게 되나요?</div>
    <div class="CollapsiblePanelContent">
        <p class="abox"><span class="boldtext">A.</span> &nbsp; 객실 취소 후 환불은 카드결제의 경우 바로 취소 처리되며 입금결제의 경우 2~3일정도
(주말 포함 시, 4일정도) 소요됩니다.</p>
        <ul class="tab">
		</ul>
    </div>
  </div>
    <div id="CollapsiblePanel6" class="CollapsiblePanel">
    <div class="CollapsiblePanelTab" tabindex="0">Q. &nbsp;객실예약의 취소나 변경을 언제까지 할 수 있나요?</div>
    <div class="CollapsiblePanelContent">
        <div class="abox"><span class="boldtext">A.</span> &nbsp; 도착 1일전 오후 6시까지는 추가요금 없이 취소나 변경이 가능하지만
         그이후의 경우 1박요금이 청구됩니다.</div>
        <ul class="tab">
        </ul>
    </div>
  </div>
<script type="text/javascript">
var CollapsiblePanel1 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel1", {contentIsOpen:false});
var CollapsiblePanel2 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel2", {contentIsOpen:false});
var CollapsiblePanel3 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel3", {contentIsOpen:false});
var CollapsiblePanel4 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel4", {contentIsOpen:false});
var CollapsiblePanel5 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel5", {contentIsOpen:false});
var CollapsiblePanel6 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel6", {contentIsOpen:false});
</script>
