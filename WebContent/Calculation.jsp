<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Calculate</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Cookie">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/calculationstyle.css">
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
	<div id="headdiv">
		<div class="container" id="content">
			<div id="maindiv">
				<div id="btndiv1">
					<button class="btn btn-primary" type="button" id="btn1">Previous
						rent history</button>
				</div>
				<div id="btndiv2">
					<button class="btn btn-primary" type="button" id="btn2">Admin
					</button>
				</div>
			</div>
			<div id="seconddiv">
                            <form action="CalculateRent" method="post">
				<div id="subdiv1">
					<span class="label label-default" id="lab1">Krishna Singh</span>
				</div>
				<hr>
				<div id="subdiv2">
					<span class="label label-default" id="lab2">Hotel Rent</span>
				</div>
				<div id="subdiv3">
					<div id="cdiv1">
						<span class="label label-default" id="lab3">From </span> <select
					name="rmonthfrom" class="selectbox">
					<option value="JAN" selected="">Janaury</option>
					<option value="FEB">Feburary</option>
					<option value="MAR">March</option>
					<option value="APR">April</option>
					<option value="MAY">May</option>
					<option value="JUN">June</option>
					<option value="JUL">July</option>
					<option value="AUG">August</option>
					<option value="SEP">September</option>
					<option value="AUG">October</option>
					<option value="NOV">November</option>
					<option value="DEC">December</option>
				</select>
					</div>
					<div id="cdiv2">
						<span class="label label-default" id="lab4">TO </span> <select
					name="rmonthto" class="selectbox">
					<option value="JAN" selected="">Janaury</option>
					<option value="FEB">Feburary</option>
					<option value="MAR">March</option>
					<option value="APR">April</option>
					<option value="MAY">May</option>
					<option value="JUN">June</option>
					<option value="JUL">July</option>
					<option value="AUG">August</option>
					<option value="SEP">September</option>
					<option value="AUG">October</option>
					<option value="NOV">November</option>
					<option value="DEC">December</option>
				</select>
					</div>
					<div id="cdiv3">
						<span class="label label-default" id="lab5">Rate </span> <input
							 name="rrate" type="number" placeholder="Rupees">
					</div>
				</div>
				<hr>
				<div id="subdiv2">
					<span class="label label-default" id="lab2">Electricity </span>
				</div>
				<div id="subdiv3">
					<div id="cdiv1">
						<span class="label label-default" id="lab3">From </span> <select
					name="emonthfrom" class="selectbox">
					<option value="JAN" selected="">Janaury</option>
					<option value="FEB">Feburary</option>
					<option value="MAR">March</option>
					<option value="APR">April</option>
					<option value="MAY">May</option>
					<option value="JUN">June</option>
					<option value="JUL">July</option>
					<option value="AUG">August</option>
					<option value="SEP">September</option>
					<option value="AUG">October</option>
					<option value="NOV">November</option>
					<option value="DEC">December</option>
				</select>
					</div>
					<div id="cdiv2">
						<span class="label label-default" id="lab4">TO </span> <select
					name="emonthto" class="selectbox">
					<option value="JAN" selected="">Janaury</option>
					<option value="FEB">Feburary</option>
					<option value="MAR">March</option>
					<option value="APR">April</option>
					<option value="MAY">May</option>
					<option value="JUN">June</option>
					<option value="JUL">July</option>
					<option value="AUG">August</option>
					<option value="SEP">September</option>
					<option value="AUG">October</option>
					<option value="NOV">November</option>
					<option value="DEC">December</option>
				</select>
					</div>
					<div id="cdiv3">
						<span class="label label-default" id="lab5">Rate </span> <input
							name="erate" type="number" placeholder="Rupees">
					</div>
				</div>
				<hr>
				<div id="subdiv2">
					<span class="label label-default" id="lab2">Water </span>
				</div>
				<div id="subdiv3">
					<div id="cdiv1">
						<span class="label label-default" id="lab3">From </span> <select
					name="wmonthfrom" class="selectbox">
					<option value="JAN" selected="">Janaury</option>
					<option value="FEB">Feburary</option>
					<option value="MAR">March</option>
					<option value="APR">April</option>
					<option value="MAY">May</option>
					<option value="JUN">June</option>
					<option value="JUL">July</option>
					<option value="AUG">August</option>
					<option value="SEP">September</option>
					<option value="AUG">October</option>
					<option value="NOV">November</option>
					<option value="DEC">December</option>
				</select>
					</div>
					<div id="cdiv2">
						<span class="label label-default" id="lab4">TO </span> <select
					name="wmonthto" class="selectbox">
					<option value="JAN" selected="">Janaury</option>
					<option value="FEB">Feburary</option>
					<option value="MAR">March</option>
					<option value="APR">April</option>
					<option value="MAY">May</option>
					<option value="JUN">June</option>
					<option value="JUL">July</option>
					<option value="AUG">August</option>
					<option value="SEP">September</option>
					<option value="AUG">October</option>
					<option value="NOV">November</option>
					<option value="DEC">December</option>
				</select>
					</div>
					<div id="cdiv3">
						<span class="label label-default" id="lab5">Rate </span> <input
							name="wrate" type="number" placeholder="Rupees">
					</div>
				</div>
				<hr>
				<div id="subdiv2">
					<span class="label label-default" id="lab2">Wastage </span>
				</div>
				<div id="subdiv3">
					<div id="cdiv1">
						<span class="label label-default" id="lab3">From </span> <select
					name="wamonthfrom" class="selectbox">
					<option value="JAN" selected="">Janaury</option>
					<option value="FEB">Feburary</option>
					<option value="MAR">March</option>
					<option value="APR">April</option>
					<option value="MAY">May</option>
					<option value="JUN">June</option>
					<option value="JUL">July</option>
					<option value="AUG">August</option>
					<option value="SEP">September</option>
					<option value="AUG">October</option>
					<option value="NOV">November</option>
					<option value="DEC">December</option>
				</select>
					</div>
					<div id="cdiv2">
						<span class="label label-default" id="lab4">TO </span> <select
					name="wamonthto" class="selectbox">
					<option value="JAN" selected="">Janaury</option>
					<option value="FEB">Feburary</option>
					<option value="MAR">March</option>
					<option value="APR">April</option>
					<option value="MAY">May</option>
					<option value="JUN">June</option>
					<option value="JUL">July</option>
					<option value="AUG">August</option>
					<option value="SEP">September</option>
					<option value="AUG">October</option>
					<option value="NOV">November</option>
					<option value="DEC">December</option>
				</select>
					</div>
					<div id="cdiv3">
						<span class="label label-default" id="lab5">Rate </span> <input
							name="warate" type="number" placeholder="Rupees">
					</div>
				</div>
				<hr>
				<div id="subdiv2">
					<span class="label label-default" id="lab2">Internet </span>
				</div>
				<div id="subdiv3">
					<div id="cdiv1">
						<span class="label label-default" id="lab3">From </span> <select
					name="imonthfrom" class="selectbox">
					<option value="JAN" selected="">Janaury</option>
					<option value="FEB">Feburary</option>
					<option value="MAR">March</option>
					<option value="APR">April</option>
					<option value="MAY">May</option>
					<option value="JUN">June</option>
					<option value="JUL">July</option>
					<option value="AUG">August</option>
					<option value="SEP">September</option>
					<option value="AUG">October</option>
					<option value="NOV">November</option>
					<option value="DEC">December</option>
				</select>
					</div>
					<div id="cdiv2">
						<span class="label label-default" id="lab4">TO </span> <select
					name="imonthto" class="selectbox">
					<option value="JAN" selected="">Janaury</option>
					<option value="FEB">Feburary</option>
					<option value="MAR">March</option>
					<option value="APR">April</option>
					<option value="MAY">May</option>
					<option value="JUN">June</option>
					<option value="JUL">July</option>
					<option value="AUG">August</option>
					<option value="SEP">September</option>
					<option value="AUG">October</option>
					<option value="NOV">November</option>
					<option value="DEC">December</option>
				</select>
					</div>
					<div id="cdiv3">
						<span class="label label-default" id="lab5">Rate </span> <input
							name="irate" type="number" placeholder="Rupees">
					</div>
				</div>
				<hr>
				<div id="pdiv">
					<div id="pdiv1">
						<div id="subdiv2">
							<span class="label label-default" id="lab2">Previous Due</span>
						</div>
						<div id="cdiv3">
							<input type="number" placeholder="Rupees" name="prev">
						</div>
					</div>
					<div id="pdiv2">
						<div id="subdiv2">
							<span class="label label-default" id="lab2"> Total</span>
						</div>
						<div id="cdiv3">
							<input type="number" placeholder="Rupees" name="total">
						</div>
					</div>
				</div>
				<hr>
				<div id="pdiv">
					<div id="pdiv1">
						<div id="subdiv2">
							<span class="label label-default" id="lab2">Paid </span>
						</div>
						<div id="cdiv3">
							<input type="number" placeholder="Rupees" name="paid">
						</div>
					</div>
					<div id="pdiv2">
						<div id="subdiv2">
							<span class="label label-default" id="lab2"> Remaining</span>
						</div>
						<div id="cdiv3">
							<input type="number" placeholder="Rupees" name="rem">
						</div>
					</div>
				</div>
                                  <hr>  
                                <div id="btndiv2">
                                    <button class="btn btn-primary" type="submit" id="btn2">Pay
					</button>
                                </div>
                                
                            </form>
                           
                        </div>
                    <hr>
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