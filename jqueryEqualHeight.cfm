<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery Equal Height Solution</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script>
<script type="text/javascript">
$(window).load(function(){

	// loop through all elements with "equal-height" class
	$('.equal-height').each(function(){

		// set newHeight to zero
		var newHeight = 0;

		// loop through children to identify biggest height
		$(this).children().each(function(){

			var currentHeight = $(this).height();
	
			if (currentHeight >= newHeight){
				newHeight = currentHeight;
			}
		});

		// loop through children to set height to match biggest one
		$(this).children().each(function(){

			$(this).height(newHeight);
		});
	});
});

</script>

<style type="text/css">
	#box1 {background-color:#999;font-size:24px;float:left;width:200px;}
	#box2 {background-color:#666;font-size:36px;float:left;width:200px;}
	#box3 {background-color:#999;font-size:75px;float:left;width:200px;}
	#box4 {background-color:#999;font-size:24px;float:left;width:200px;}
	#box5 {background-color:#666;font-size:36px;float:left;width:200px;}
	#box6 {background-color:#999;font-size:75px;float:left;width:200px;}
	.clearFloat {
		clear:both;	
	}
	.spacer {
		height:10px;
		width:600px;
	}
	.equal-height {
		margin-top:10px;	
	}
</style>
</head>

<body>
<div id="container1" class="equal-height">
 <div id="box1">some text</div>
 <div id="box2">some double more text</div>
 <div id="box3">some other text</div>
<br class="clearFloat" />
</div>

<div id="container2" class="equal-height">

 <div id="box4">some double more text</div>
 <div id="box5">some more text</div>
 <div id="box6">some other text</div>
<br class="clearFloat" />
</div>
</body>
</html>