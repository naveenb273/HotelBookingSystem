<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Hotel Booking System</title>
		
		<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
		
		<link href="${bootstrapCss}" rel="stylesheet" />
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">

		<spring:url value="/resources/core/js/jquery.1.10.2.min.js" var="jqueryJs" />
		<script src="${jqueryJs}"></script>
	</head>

	<body>
		<nav class="navbar navbar-inverse">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="http://localhost:8080/HotelBookingSystem/home">Hotel Booking System</a>
				</div>
			</div>
		</nav>
		<div class="container" style="min-height: 500px">
			<div class="starter-template">
				<h1> Room Booking Page</h1>
				<br>
				<font>${success } </font>
				<br>
				<font color="red">${failure } </font>
				<br>
				<div id="feedback"></div>
				<table class="table" border="2" style="width: 500px">
					<tr>
						<td colspan="2" align="center">
							<div>
								<h2>Check In Details:</h2>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px">
							<div>
								<label> City Name : </label>
							</div>
						</td>
						<td style="width: 300px">
							<div>
								<select id="cityList" name="cityList">
									<option value="CC">Choose City</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px">
							<div>
								<label> Hotel Name : </label>
							</div>
						</td>
						<td style="width: 300px">
							<div>
								<select id="hotelList" name="hotelList">
									<option value="CH">Choose Hotel</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px">
							<div>
								<label> Check In Date : </label>
							</div>
						</td>
						<td style="width: 300px">
							<div>
								<input type="text" id="checkInDate">
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px">
							<div>
								<label> Check Out Date : </label>
							</div>
						</td>
						<td style="width: 300px">
							<div>
								<input type="text" id="checkOutDate">
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px">
							<div>
								<label> Number Of Rooms : </label>
							</div>
						</td>
						<td style="width: 300px">
							<div>
								<input type="text" id="numOfRooms" width="30px">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<div>
								<h2>User Details:</h2>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px">
							<div>
								<label> First Name : </label>
							</div>
						</td>
						<td style="width: 300px">
							<div>
								<input type="text" id="firstName" >
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px">
							<div>
								<label> Last Name : </label>
							</div>
						</td>
						<td style="width: 300px">
							<div>
								<input type="text" id="lastName" >
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px">
							<div>
								<label> Date Of Birth : </label>
							</div>
						</td>
						<td style="width: 300px">
							<div>
								<input type="text" id="dateOfBirth">
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px">
							<div>
								<label> Phone Number : </label>
							</div>
						</td>
						<td style="width: 300px">
							<div>
								<input type="text" id="phNumber" >
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px">
							<div>
								<label> Email ID: </label>
							</div>
						</td>
						<td style="width: 300px">
							<div>
								<input type="text" id="emailId" >
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px">
							<div>
								<label> Address : </label>
							</div>
						</td>
						<td style="width: 300px">
							<div>
								<textarea rows="5" cols="34" id="address"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px">
							<div>
								<label> Reference Type : </label>
							</div>
						</td>
						<td style="width: 300px">
							<div>
								<select id="referenceType" name="referenceType">
									<option value="CRT">Choose Reference Type</option>
									<option value="PP">Passport</option>
									<option value="AC">Aadhaar Card</option>
									<option value="EIC">Election ID Card</option>
									<option value="RC">Ration Card</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 200px">
							<div>
								<label> Reference Number : </label>
							</div>
						</td>
						<td style="width: 300px">
							<div>
								<input type="text" id="referenceNum" >
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<div class="button">
								<button id="submit"> Book Room </button>
							</div>
						</td>
					</tr>
				</table>
				
				
			</div>
			<div class="container">
				<footer>
					<p>
						&copy; By Naveen Basavaraj - M1027628
					</p>
				</footer>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">

		jQuery(document).ready(function($) {
			getCityList();
			
			$("select#cityList").change(function(event) {
	
				// Prevent the form from submitting via the browser.
				event.preventDefault();
	
				getHotelList(); //$(this).find("option:selected")
	
			}).change();
			
			$("#submit").click(function(event) {
	
				// Prevent the form from submitting via the browser.
				event.preventDefault();
	
				bookRoom(); //$(this).find("option:selected")
	
			})
	
		});
	
		function getCityList(){
		
			// Prevent the form from submitting via the browser.
			event.preventDefault();
				
			var search = {}
	
			$.ajax({
				type : "GET",
				contentType : "application/json",
				url : "${home}goToRoomBooking/fetchCityList",
				data : JSON.stringify(search),
				dataType : 'json',
				timeout : 100000,
				success : function(response) {
					console.log("SUCCESS: ", response);
					getCityNames(response);
					display(response);
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
		
		function getCityNames(result){
			var cnl		=	result.cityNameList;
			if(cnl	!=	''){
				for(i in cnl){
					$("#cityList").append($("<option />").val(cnl[i]).text(cnl[i]));
				}
			}
		}
		
		function getHotelList() {
	
			var roomBookingAjaxReq = {"cityName": $('#cityList').val()} //cityName
	
			$.ajax({
				type : "POST",
				url : "${home}goToRoomBooking/fetchHotelList",
				data : JSON.stringify(roomBookingAjaxReq),
				contentType : "application/json",
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					console.log("SUCCESS: ", data);
					getHotelNames(data);
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
		
		function getHotelNames(result){
			var hnl		=	result.hotelNameList;
			var hil		=	result.hotelIdList;
			if(hnl	!=	''){
				$("#hotelList").find('option').remove().end()
				$("#hotelList").append($("<option />").val("CH").text("Choose Hotel"));
				for(i in hnl){
					$("#hotelList").append($("<option />").val(hnl[i]).text(hnl[i]));
				}
			}
		}
		
		$( function() {
		    $( "#checkInDate" ).datepicker();
		  } );
		  
		$( function() {
		    $( "#checkOutDate" ).datepicker();
		  } );
	  	$( function() {
		    $( "#dateOfBirth" ).datepicker();
		  } );
		  
		function bookRoom() {
			var numOfRooms	=	+$('#numOfRooms').val();
			var roomBookingAjaxReq = {"cityName": $('#cityList').val(), //cityName
									  "hotelName": $('#hotelList').val(), //hotelName
									  "checkInDate": $('#checkInDate').val(), //checkInDate
									  "checkOutDate": $('#checkOutDate').val(), //checkOutDate
									  "numOfRooms": isNaN(numOfRooms) ? 0 : numOfRooms, //numOfRooms
									  "firstName": $('#firstName').val(),  //firstName
									  "lastName": $('#lastName').val(), //lastName
									  "dateOfBirth": $('#dateOfBirth').val(), //dateOfBirth
									  "phNumber": $('#phNumber').val(), //phNumber
									  "emailId": $('#emailId').val(), //emailId
									  "address": $('#address').val(), //address
									  "referenceType": $('#referenceType').val(), //referenceType 
									  "referenceNum": $('#referenceNum').val() } //referenceNum
	
			$.ajax({
				type : "POST",
				url : "${home}goToRoomBooking/bookRoom",
				data : JSON.stringify(roomBookingAjaxReq),
				contentType : "application/json",
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					console.log("SUCCESS: ", data);
					getHotelNames(data);
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
		var msg = data.msg;
		$('#feedback').html(msg);
		$('#feedback').css({'color': 'red', 'width': '900px', 'font': 'message-box', 'font-size': 'x-large'});
	}
	</script>
</html>