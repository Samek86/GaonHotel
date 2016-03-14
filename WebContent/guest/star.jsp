<head>
<script src='guest/js/jquery.js' type="text/javascript"></script>
<script src='guest/js/jquery.MetaData.js' type="text/javascript" language="javascript"></script>
<script src='guest/js/jquery.rating.js' type="text/javascript" language="javascript"></script>
<link href='guest/js/jquery.rating.css' type="text/css" rel="stylesheet"/>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js" type="text/javascript"></script>
</head>
<body>
<script type="text/javascript" language="javascript">
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
    tip.html(link.title || 'value: '+value);
    alert(value);
  },
  blur: function(value, link){
    var tip = $('#hover-test');
    $('#hover-test').html(tip[0].data || '');
  }
 });
});
</script>
	<div class="Clear">
    <div>
    <%for(int i=1; i<=5; i++){ %>
     <input id="hover-test" class="hover-star" type="radio" name="test-3B-rating-1" value="<%=i %>" title="<%=i %>	"/>
     <%} %>
    </div>
   </div>
</body>
</html>