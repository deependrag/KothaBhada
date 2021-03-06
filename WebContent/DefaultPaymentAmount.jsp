<%@page import="com.kothabhada.DefaultPaymentDto"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Default Payment Amount</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/defaultpayment.css">
<link rel="stylesheet" href="assets/css/Pretty-Header.css">
<link rel="stylesheet" href="assets/css/Pretty-Footer.css">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Cookie">
</head>

<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store ,must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setHeader("Expires", "0"); //Proxies

		DefaultPaymentDto defaultpayment = new DefaultPaymentDto();
		
		if (session.getAttribute("user_role") == null) {
			response.sendRedirect("./index.jsp");
		}else{
			if(session.getAttribute("view_default_payment") == null || session.getAttribute("userid").equals("")){
				response.sendRedirect("./DisplayClient");
			}else{
				defaultpayment = (DefaultPaymentDto) session.getAttribute("view_default_payment");
			}	
		}
	%>
	<%
		
	%>
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
	<div class="container" id="formcontainer">
		<form method="post" id="defaultpayment"
			action="./InsertDefaultPaymentAmount">
			<label>Rent </label> <input class="form-control" type="number"
				placeholder="Rupees/Month" name="rent"
				value="<%=defaultpayment.getRent()%>"> <label>Electricity
			</label> <input class="form-control" type="number" name="electricity"
				placeholder="Rupees/Unit"
				value="<%=defaultpayment.getElectricity()%>"> <label>Wastes
			</label> <input class="form-control" type="number" placeholder="Rupees/Month"
				name="waste" value="<%=defaultpayment.getWaste()%>"> <label>Water
			</label> <input class="form-control" type="number" name="water"
				placeholder="Rupees/Month" value="<%=defaultpayment.getWater()%>">
			<label>Internet </label> <input class="form-control" type="number"
				placeholder="Rupees/Month" name="internet"
				value="<%=defaultpayment.getInternet()%>">
			<button class="btn btn-default" type="submit" id="btnsave">Save
			</button>
		</form>
	</div>
	<footer id="myfooter">
		<div class="row">
			<div class="col-md-4 col-sm-6 footer-navigation">
				<h3>
					<img src="assets/img/Logowhite.png" id="logofooter">
				</h3>
				<p class="company-name">Kortha Bhada� 2017</p>
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
	<script src="assets/js/dashboard.js"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>