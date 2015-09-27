<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
	 <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">

	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="css/style (2).css"> <!-- Resource style -->
	<script src="js/modernizr.js"></script> <!-- Modernizr -->
	<title>housekeeping.com</title>
</head>
<body>
<header>
	<h1>HouseKeeping.com</h1>
	<h2>Welcome <%= session.getAttribute("user") %></h2>
</header>
<style>
body {
    background-image: url("9.jpg");
    background-repeat: no-repeat;
    background-size: cover;
}
</style>
<section class="cd-faq">
	<ul class="cd-faq-categories">
		<li><a class="selected" href="#basics">About Us</a></li>
		<li><a href="#mobile">Locate Maids from Your Current Location</a></li>
		<li><a href="#account">Search maids by place</a></li>
		<li><a href="#payments">Contact Us</a></li>
		<li><a href="#privacy">Privacy</a></li>
	</ul> <!-- cd-faq-categories -->

	<div class="cd-faq-items">
		<ul id="basics" class="cd-faq-group">
			<li class="cd-faq-title"><h2>About Us</h2></li>
			<li>
				<a class="cd-faq-trigger" href="#0">About the company</a>
				<div class="cd-faq-content">
					<p>place reserved for about the company.. blah blah</p>
				</div> <!-- cd-faq-content -->
			</li>
			<li>
				<a class="cd-faq-trigger" href="#0">Our Team</a>
				<div class="cd-faq-content">
					 <p>place reserved for team description and other shit</p>
				</div> <!-- cd-faq-content -->
			</li>
		</ul> <!-- cd-faq-group -->

		<ul id="mobile" class="cd-faq-group">
			<li class="cd-faq-title"><h2>Locate Maids from Your Current Location</h2></li>
			<li>
				<a class="cd-faq-trigger" href="#0">Locate Now</a>
				<div class="cd-faq-content">
					<p>Welcome <%= session.getAttribute("user") %><br><br><script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
    <button onclick="getLocation()">Locate Yourself</button><br><form action="Search" method="post">
<input type="number" step="any" id="lat" name="lat" /><%--<fmt:formatNumber type="number" minFractionDigits="6" value="${lat}" /> --%>
<input type="number" step="any"  id="lon" name="lon" /><%--<fmt:formatNumber type="number" minFractionDigits="6" value="${lon}" /> --%>
<input type="submit" value="Locate nearest maids">
</form></p>
				</div> <!-- cd-faq-content -->
			</li>
		</ul> <!-- cd-faq-group -->

		<ul id="account" class="cd-faq-group">
			<li class="cd-faq-title"><h2>Search Maids By Place</h2></li>
			<li>
				<a class="cd-faq-trigger" href="#0">Locate Now</a>
				<div class="cd-faq-content">
					<p>this is extension of the app ..LL be done later</p>
				</div> <!-- cd-faq-content -->
			</li>
		</ul> <!-- cd-faq-group -->

		<ul id="payments" class="cd-faq-group">
			<li class="cd-faq-title"><h2>Contact Us</h2></li>
			<li>
				<a class="cd-faq-trigger" href="#0">Contact Details</a>
				<div class="cd-faq-content">
					<p>Here we put contact details</p>
				</div> <!-- cd-faq-content -->
			</li>

			<li>
				<a class="cd-faq-trigger" href="#0">Where we are located</a>
				<div class="cd-faq-content">
					<p>This place is reserved for giving location of incubation center</p>
				</div> <!-- cd-faq-content -->
			</li>
		</ul> <!-- cd-faq-group -->

		<ul id="privacy" class="cd-faq-group">
			<li class="cd-faq-title"><h2>Privacy</h2></li>
			<li>
				<a class="cd-faq-trigger" href="#0">Company Privacy</a>
				<div class="cd-faq-content">
					<p>here give company privacy detaills</p>
				</div> <!-- cd-faq-content -->
			</li>
		</ul> <!-- cd-faq-group -->

	</div> <!-- cd-faq-items -->
	<a href="#0" class="cd-close-panel">Close</a>
</section> <!-- cd-faq -->
<script>
var lat = document.getElementById("lat");
var lon = document.getElementById("lon");

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        lat.value = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    lat.value = position.coords.latitude ; 
    lon.value = position.coords.longitude;	
}
</script>
<script src="js/jquery-2.1.1.js"></script>
<script src="js/jquery.mobile.custom.min.js"></script>
<script src="js/main.js"></script> <!-- Resource jQuery -->
</body>
</html>