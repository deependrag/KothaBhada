<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/viewhistory.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Cookie">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/Pretty-Footer.css">
<link rel="stylesheet" href="assets/css/Pretty-Header.css">
</head>

<body>
	<nav class="navbar navbar-default custom-header">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand navbar-link" href="#"> <img
					src="assets/img/Logowhite.png" id="logo"></a>
				<button class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#navbar-collapse">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse">
				<ul class="nav navbar-nav links">
					<li role="presentation"><a href="index.jsp">Home </a></li>
					<li role="presentation"><a href="#">Facilities </a></li>
					<li role="presentation"><a href="#"> FAQ</a></li>
					<li role="presentation"><a href="#" class="custom-navbar">Contact
							us</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false" href="#"> <span
							class="caret"></span><img src="assets/img/avatar.PNG"
							class="dropdown-image"></a>
						<ul class="dropdown-menu dropdown-menu-right" role="menu">
							<li role="presentation" class="active"><a href="./Logout">Logout
							</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div>
		<div class="container">
			<h3 id="name">Name: Deependra Dhakal</h3>
			<button class="btn btn-default" type="button" id="monthlypayment">Default
				Monthly Payment</button>
			<a href="./Calculation.jsp">
				<button class="btn btn-default" type="button" id="paynow">Pay
					Now</button>
			</a>
			<div class="table-responsive" id="recentdue">
				<table class="table">
					<thead id="recentduehead">
						<tr>
							<th>S.N.</th>
							<th>Particular</th>
							<th>Rate</th>
							<th>Total</th>
						</tr>
					</thead>
					<tbody id="recentduebody">
						<tr>
							<td>1</td>
							<td>Rent from JAN-MAR</td>
							<td>3000</td>
							<td>9000</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Water from JAN-Mar</td>
							<td>3000</td>
							<td>9000</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="searchsection">
				<span class="label label-default" id="labelyear">Year</span> <select
					name="year" class="selectbox">
					<option value="2017" selected="">2017</option>
					<option value="2016">2016</option>
					<option value="2015">2015</option>
				</select><span class="label label-default" id="labelfrommonth">Month</span> <select
					name="monthfrom" class="selectbox">
					<option value="1" selected="">Janaury</option>
					<option value="2">Feburary</option>
					<option value="3">March</option>
					<option value="4">April</option>
					<option value="5">May</option>
					<option value="6">June</option>
					<option value="7">July</option>
					<option value="8">August</option>
					<option value="9">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
				</select><span class="label label-default" id="labelfrommonth">To</span> <select
					name="monthfrom" class="selectbox">
					<option value="1" selected="">Janaury</option>
					<option value="2">Feburary</option>
					<option value="3">March</option>
					<option value="4">April</option>
					<option value="5">May</option>
					<option value="6">June</option>
					<option value="7">July</option>
					<option value="8">August</option>
					<option value="9">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
				</select>
				<button class="btn btn-default" type="button" id="search">Search
				</button>
				<div class="table-responsive" id="paymenthistory">
					<table class="table">
						<thead id="recentduehead">
							<tr>
								<th>RefNo</th>
								<th>Payment Date</th>
								<th>Month</th>
								<th>Amount to pay</th>
								<th>Amount Paid</th>
								<th>Due</th>
							</tr>
						</thead>
						<tbody id="recentduebody">
							<d:forEach items="${view_payment_history}" var="b">
								<tr>
									<td>${b.refno}</td>
									<td>${b.date}</td>
									<td>${b.month}</td>
									<td>${b.topay}</td>
									<td>${b.paid}</td>
									<td>${b.due}</td>
								</tr>
							</d:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<footer id="myfooter">
		<div class="row">
			<div class="col-md-4 col-sm-6 footer-navigation">
				<h3>
					<img src="assets/img/Logowhite.png" id="logofooter">
				</h3>
				<p class="company-name">Kortha Bhada© 2017</p>
			</div>
			<div class="col-md-4 col-sm-6 footer-contacts">
				<div>
					<span class="fa fa-map-marker footer-contacts-icon"> </span>
					<p>
						<span class="new-line-span">Kapan-12</span> Budanilkantha
					</p>
				</div>
				<div>
					<i class="fa fa-phone footer-contacts-icon"></i>
					<p class="footer-center-info email text-left">+977 981234566</p>
				</div>
				<div>
					<i class="fa fa-envelope footer-contacts-icon"></i>
					<p>
						<a href="#" target="_blank">support@kothabhada.com</a>
					</p>
				</div>
			</div>
			<div class="clearfix visible-sm-block"></div>
			<div class="col-md-4 footer-about">
				<h4>About the company</h4>
				<p>This is the web appication to keep record of the house rent.</p>
				<div class="social-links social-icons">
					<a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i
						class="fa fa-twitter"></i></a><a href="#"><i
						class="fa fa-linkedin"></i></a><a href="#"><i class="fa fa-github"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>