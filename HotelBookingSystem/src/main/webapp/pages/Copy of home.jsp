<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>  
<html>  
<head>  
 <title>First jQuery Example</title>  
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">  
 </script>  
 <script type="text/javascript" language="javascript">  

		$(document).ready(function() {
			$("p").click(function() {
				$(this).hide();
			});
			$('#bookRoom').click(function() {
				alert('Book Room booked');
			});
			$('#listHotels').click(function() {
				alert('list Hotels booked');
			});
		});
	</script>  
 </head>  
<body>  
<form action="">
	<a id="bookRoom" href="">Book A Room</a>
	<a id="listHotels" href="">View Lowest Priced Hotels</a>
</form>

<p>This is first paragraph.</p>  
<p>This is second paragraph.</p>  
<p>This is third paragraph.</p>  
</body>  
</html>  