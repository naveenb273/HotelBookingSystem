<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hotel Booking System</title>

<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css"
	var="bootstrapCss" />

<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />

<spring:url value="/resources/core/js/jquery.1.10.2.min.js"
	var="jqueryJs" />
<script src="${jqueryJs}"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Hotel Booking System</a>
			</div>
		</div>
	</nav>

	<div class="container" style="min-height: 500px">
		<div class="starter-template">
			<h1>Welcome Guest</h1>
			<br> <font>${success } </font> <br> <font color="red">${failure }
			</font> <br>
			<div class="form-group form-group-lg">
				<a id="bookRoom"
					href="http://localhost:8080/HotelBookingSystem/goToRoomBooking"><label
					class="col-sm-2 control-label">Book A Room</label></a>
			</div>
			<br>
			<div class="form-group form-group-lg">
				<a id="listHotels"
					href="http://localhost:8080/HotelBookingSystem/goToListHotels"><label
					class="col-sm-2 control-label">View Lowest Priced Hotels</label></a>
			</div>
		</div>
	</div>
	<div class="container">
		<footer>
			<p>&copy; By Naveen Basavaraj - M1027628</p>
		</footer>
	</div>
</body>
<!-- <script>
		jQuery(document).ready(function($) {
	
			$("#bookRoom").click(function(event) {
	
				// Prevent the form from submitting via the browser.
				event.preventDefault();
	
				searchViaAjax();
	
			});
	
		});
	
		function searchViaAjax() {
	
			var search = {}
	
			$.ajax({
				type : "GET",
				contentType : "application/json",
				url : "${home}goToRoomBooking/fetchCityList",
				data : JSON.stringify(search),
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					console.log("SUCCESS: ", data);
					display(data);
				},
				error : function(e) {
					console.log("ERROR: ", e);
					display(e);
				},
				done : function(e) {
					console.log("DONE");
				}
			});
	
		}
	
		function display(data) {
			var json = "<h4>Ajax Response</h4><pre>"
					+ JSON.stringify(data, null, 4) + "</pre>";
			$('#feedback').html(json);
		}
	</script> -->
</html>