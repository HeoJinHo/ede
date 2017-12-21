<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	var result = ${result};
	var start = ${start}-1;
	$("#total").html(result.total);
	var k = 0;
	for(var i=start;i<start+10;i++){
		var j = "<div id='div-inner"+i+"'></div>";
		$("#div").append(j)
		var a = $("<p></p>").html(result.items[k].title);
		var b = $("<p></p>").html(result.items[k].description);
		var c = $("<p></p>").html(result.items[k].bloggername);
		var d = $("<p></p>").html(result.items[k].postdate);
		var e = $("<p></p>").html(result.items[k].link);
		$("#div-inner"+i).append(a, b, c, d, e);
		k++;
	}
})
</script>

<section id="div">
	
</section>



