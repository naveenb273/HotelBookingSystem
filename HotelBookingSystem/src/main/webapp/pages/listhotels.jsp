<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Hotel Price List</title>
		
		<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
		
		<link href="${bootstrapCss}" rel="stylesheet" />
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   		<link rel="stylesheet" href="/resources/demos/style.css"> -->

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
				<h1>Hotel Price List</h1>
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
								<h2>Hotel Details:</h2>
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
				</table>
			</div>
			<div id="hotelListTable" style="border: 2px;"></div>
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
	
				getHotelList(); 
	
			}).change();
			
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
				url : "${home}fetchListOfHotels",
				data : JSON.stringify(roomBookingAjaxReq),
				contentType : "application/json",
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					console.log("SUCCESS: ", data);
					getHotelNames(data);
					$('#hotelListTable').show();
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
			var tL		=	result.tariffList;
			$("#hotelListTable").find('tr').remove().end();
			if(hnl	!=	''){
				$('#hotelListTable').append("<table style='width: 500px' border='2px'>");
				$('#hotelListTable').append("<tr><td style='width: 200px' align='center'><label>Hotel Name</label></td>");
				$('#hotelListTable').append("<td style='width: 200px' align='center'><label>Tariff</label></td></tr>");
				for(i in hnl){
					$("#hotelListTable").append("<tr>");
					$("#hotelListTable").append($("<td style='width: 200px' align='left'><label>"+hnl[i]+"</label></td>"));
					$("#hotelListTable").append($("<td style='width: 200px' align='left'><label>"+tL[i]+"</label></td>"));
					$("#hotelListTable").append("</tr>");
				}
				$("#hotelListTable").append("</table>");
			}
		}
		
	function display(data) {
		var msg = data.msg;
		$('#feedback').html(msg);
		$('#feedback').css({'color': 'red', 'width': '900px', 'font': 'message-box', 'font-size': 'x-large'});
	}
	</script>
</html>