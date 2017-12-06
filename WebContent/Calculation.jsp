<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <%
		response.setHeader("Cache-Control", "no-cache, no-store ,must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setHeader("Expires", "0"); //Proxies
		
		if (session.getAttribute("user_role") == null) {
			response.sendRedirect("./index.jsp");
		}
		if ( session.getAttribute("userid").equals("")){
			response.sendRedirect("./DisplayClient");
		}
		
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
	<div id="headdiv">
		<div class="container" id="content">
                    
                    <form action="CalculateRent" method="post">
			<div id="maindiv">
				<div id="btndiv1">
					<button class="btn btn-primary" type="button" id="btn1">Previous
						rent history</button>
				</div>
				<div id="btndiv2">
					<button class="btn btn-primary" type="submit" id="btn2">Calculate Total
					</button>
				</div>
			</div>
			<div id="seconddiv">
                            <form action="CalculateRent" method="post">
				<div id="subdiv1">
					<span class="label label-default" id="lab1">Krishna Singh</span>
				</div>
				<hr class="hline">
				<div id="subdiv2">
					<span class="label label-default" id="lab2">Hotel Rent</span>
				</div>
				<div id="subdiv3">
					<div id="cdiv1">
						<span class="label label-default" id="lab3">From </span> 
                                                <d:if test="${empty rfrom}">
                                        <select class="ninput" name="rmonthfrom" class="selectbox">
                                            <option value="Janaury" selected="">Janaury</option>
                                           <option value="Feburary">Feburary</option>
                                            <option value="March">March</option>
                                            <option value="April">April</option>
                                            <option value="May">May</option>
                                            <option value="June">June</option>
                                            <option value="July">July</option>
                                            <option value="August">August</option>
                                            <option value="September">September</option>
                                            <option value="October">October</option>
                                            <option value="November">November</option>
                                            <option value="December">December</option>
                                        </select>
                                                    </d:if>
                                                <d:if test="${not empty rfrom}">
                                                    <select class="ninput" name="rmonthfrom" class="selectbox">
                                                        <option value="${rfrom}" selected="">${rfrom}</option>
                                                    </select>
                                                    <d:remove var="rfrom" scope="session" />
                                                </d:if>
					</div>
					<div id="cdiv2">
						<span class="label label-default" id="lab4">TO </span> 
                                                <d:if test="${empty rto}">
                                        <select class="ninput" name="rmonthto" class="selectbox">
                                            <option value="Janaury" selected="">Janaury</option>
                                           <option value="Feburary">Feburary</option>
                                            <option value="March">March</option>
                                            <option value="April">April</option>
                                            <option value="May">May</option>
                                            <option value="June">June</option>
                                            <option value="July">July</option>
                                            <option value="August">August</option>
                                            <option value="September">September</option>
                                            <option value="October">October</option>
                                            <option value="November">November</option>
                                            <option value="December">December</option>
                                        </select>
                                                    </d:if>
                                                <d:if test="${not empty rto}">
                                                    <select class="ninput" name="rmonthto" class="selectbox">
                                                        <option value="${rto}" selected="">${rto}</option>
                                                    </select>
                                                    <d:remove var="rto" scope="session" />
                                                </d:if>
					</div>
					<div id="cdiv3">
						<span class="label label-default" id="lab5">Rate </span> <input class="ninput"
							 name="rrate" type="number" placeholder="Rupees">
					</div>
				</div>
				<hr class="hline">
				<div id="subdiv2">
					<span class="label label-default" id="lab2">Electricity </span>
				</div>
				<div id="subdiv3">
					<div id="cdiv1">
						<span class="label label-default" id="lab3">From </span>
                                                <d:if test="${empty efrom}">
                                        <select class="ninput" name="emonthfrom" class="selectbox">
                                            <option value="Janaury" selected="">Janaury</option>
                                           <option value="Feburary">Feburary</option>
                                            <option value="March">March</option>
                                            <option value="April">April</option>
                                            <option value="May">May</option>
                                            <option value="June">June</option>
                                            <option value="July">July</option>
                                            <option value="August">August</option>
                                            <option value="September">September</option>
                                            <option value="October">October</option>
                                            <option value="November">November</option>
                                            <option value="December">December</option>
                                        </select>
                                                    </d:if>
                                                <d:if test="${not empty efrom}">
                                                    <select class="ninput" name="emonthfrom" class="selectbox">
                                                        <option value="${efrom}" selected="">${efrom}</option>
                                                    </select>
                                                    <d:remove var="efrom" scope="session" />
                                                </d:if>
					</div>
					<div id="cdiv2">
						<span class="label label-default" id="lab4">TO </span>
                                                <d:if test="${empty eto}">
                                        <select class="ninput" name="emonthto" class="selectbox">
                                            <option value="Janaury" selected="">Janaury</option>
                                           <option value="Feburary">Feburary</option>
                                            <option value="March">March</option>
                                            <option value="April">April</option>
                                            <option value="May">May</option>
                                            <option value="June">June</option>
                                            <option value="July">July</option>
                                            <option value="August">August</option>
                                            <option value="September">September</option>
                                            <option value="October">October</option>
                                            <option value="November">November</option>
                                            <option value="December">December</option>
                                        </select>
                                                    </d:if>
                                                <d:if test="${not empty eto}">
                                                    <select class="ninput" name="emonthto" class="selectbox">
                                                        <option value="${eto}" selected="">${eto}</option>
                                                    </select>
                                                    <d:remove var="eto" scope="session" />
                                                </d:if>
					</div>
                                        <div id="cdiv3">
						<span class="label label-default" id="lab5">Unit</span> <input class="ninput"	
							name="unit" value="${unit}" type="number" placeholder="Unit">
                                                <d:remove var="unit" scope="session" />
					</div>
					<div id="cdiv3">
						<span class="label label-default" id="lab5">Rate </span> <input class="ninput"	
							name="erate" type="number" placeholder="Rupees">
					</div>
				</div>
				<hr class="hline">
				<div id="subdiv2">
					<span class="label label-default" id="lab2">Water </span>
				</div>
				<div id="subdiv3">
					<div id="cdiv1">
						<span class="label label-default" id="lab3">From </span>
                                                <d:if test="${empty wfrom}">
                                        <select class="ninput" name="wmonthfrom" class="selectbox">
                                            <option value="Janaury" selected="">Janaury</option>
                                           <option value="Feburary">Feburary</option>
                                            <option value="March">March</option>
                                            <option value="April">April</option>
                                            <option value="May">May</option>
                                            <option value="June">June</option>
                                            <option value="July">July</option>
                                            <option value="August">August</option>
                                            <option value="September">September</option>
                                            <option value="October">October</option>
                                            <option value="November">November</option>
                                            <option value="December">December</option>
                                        </select>
                                                    </d:if>
                                                <d:if test="${not empty wfrom}">
                                                    <select class="ninput" name="wmonthfrom" class="selectbox">
                                                        <option value="${wfrom}" selected="">${wfrom}</option>
                                                    </select>
                                                    <d:remove var="wfrom" scope="session" />
                                                </d:if>
					</div>
					<div id="cdiv2">
						<span class="label label-default" id="lab4">TO </span> 
                                                <d:if test="${empty wto}">
                                        <select class="ninput" name="wmonthto" class="selectbox">
                                            <option value="Janaury" selected="">Janaury</option>
                                           <option value="Feburary">Feburary</option>
                                            <option value="March">March</option>
                                            <option value="April">April</option>
                                            <option value="May">May</option>
                                            <option value="June">June</option>
                                            <option value="July">July</option>
                                            <option value="August">August</option>
                                            <option value="September">September</option>
                                            <option value="October">October</option>
                                            <option value="November">November</option>
                                            <option value="December">December</option>
                                        </select>
                                                    </d:if>
                                                <d:if test="${not empty wto}">
                                                    <select class="ninput" name="wmonthto" class="selectbox">
                                                        <option value="${wto}" selected="">${wto}</option>
                                                    </select>
                                                    <d:remove var="wto" scope="session" />
                                                </d:if>
					</div>
					<div id="cdiv3">
						<span class="label label-default" id="lab5">Rate </span> <input class="ninput"
							name="wrate" type="number" placeholder="Rupees">
					</div>
				</div>
				<hr class="hline">
				<div id="subdiv2">
					<span class="label label-default" id="lab2">Wastage </span>
				</div>
				<div id="subdiv3">
					<div id="cdiv1">
						<span class="label label-default" id="lab3">From </span> 
                                                <d:if test="${empty wafrom}">
                                        <select class="ninput" name="wamonthfrom" class="selectbox">
                                            <option value="Janaury" selected="">Janaury</option>
                                           <option value="Feburary">Feburary</option>
                                            <option value="March">March</option>
                                            <option value="April">April</option>
                                            <option value="May">May</option>
                                            <option value="June">June</option>
                                            <option value="July">July</option>
                                            <option value="August">August</option>
                                            <option value="September">September</option>
                                            <option value="October">October</option>
                                            <option value="November">November</option>
                                            <option value="December">December</option>
                                        </select>
                                                    </d:if>
                                                <d:if test="${not empty wafrom}">
                                                    <select class="ninput" name="wamonthfrom" class="selectbox">
                                                        <option value="${wafrom}" selected="">${wafrom}</option>
                                                    </select>
                                                    <d:remove var="wafrom" scope="session" />
                                                </d:if>
					</div>
					<div id="cdiv2">
						<span class="label label-default" id="lab4">TO </span>
                                               <d:if test="${empty wato}">
                                        <select class="ninput" name="wamonthto" class="selectbox">
                                            <option value="Janaury" selected="">Janaury</option>
                                           <option value="Feburary">Feburary</option>
                                            <option value="March">March</option>
                                            <option value="April">April</option>
                                            <option value="May">May</option>
                                            <option value="June">June</option>
                                            <option value="July">July</option>
                                            <option value="August">August</option>
                                            <option value="September">September</option>
                                            <option value="October">October</option>
                                            <option value="November">November</option>
                                            <option value="December">December</option>
                                        </select>
                                                    </d:if>
                                                <d:if test="${not empty wato}">
                                                    <select class="ninput" name="wamonthto" class="selectbox">
                                                        <option value="${wato}" selected="">${wato}</option>
                                                    </select>
                                                    <d:remove var="wato" scope="session" />
                                                </d:if>
					</div>
					<div id="cdiv3">
						<span class="label label-default" id="lab5">Rate </span> <input class="ninput"
							name="warate" type="number" placeholder="Rupees">
					</div>
				</div>
				<hr class="hline">
				<div id="subdiv2">
					<span class="label label-default" id="lab2">Internet </span>
				</div>
				<div id="subdiv3">
					<div id="cdiv1">
						<span class="label label-default" id="lab3">From </span> 
                                                <d:if test="${empty ifrom}">
                                        <select class="ninput" name="imonthfrom" class="selectbox">
                                            <option value="Janaury" selected="">Janaury</option>
                                           <option value="Feburary">Feburary</option>
                                            <option value="March">March</option>
                                            <option value="April">April</option>
                                            <option value="May">May</option>
                                            <option value="June">June</option>
                                            <option value="July">July</option>
                                            <option value="August">August</option>
                                            <option value="September">September</option>
                                            <option value="October">October</option>
                                            <option value="November">November</option>
                                            <option value="December">December</option>
                                        </select>
                                                    </d:if>
                                                <d:if test="${not empty ifrom}">
                                                    <select class="ninput" name="imonthfrom" class="selectbox">
                                                        <option value="${ifrom}" selected="">${ifrom}</option>
                                                    </select>
                                                 <d:remove var="ifrom" scope="session" />
                                                </d:if>
					</div>
					<div id="cdiv2">
						<span class="label label-default" id="lab4">TO </span> 
                                               <d:if test="${empty ito}">
                                        <select class="ninput" name="imonthto" class="selectbox">
                                            <option value="Janaury" selected="">Janaury</option>
                                           <option value="Feburary">Feburary</option>
                                            <option value="March">March</option>
                                            <option value="April">April</option>
                                            <option value="May">May</option>
                                            <option value="June">June</option>
                                            <option value="July">July</option>
                                            <option value="August">August</option>
                                            <option value="September">September</option>
                                            <option value="October">October</option>
                                            <option value="November">November</option>
                                            <option value="December">December</option>
                                        </select>
                                                    </d:if>
                                                <d:if test="${not empty ito}">
                                                    <select class="ninput" name="imonthto" class="selectbox">
                                                        <option value="${ito}" selected="">${ito}</option>
                                                    </select>
                                                    <d:remove var="ito" scope="session" />
                                                </d:if>
					</div>
					<div id="cdiv3">
						<span class="label label-default" id="lab5">Rate </span> <input
							class="ninput" name="irate" type="number" placeholder="Rupees">
					</div>
                                </div>
				<hr class="hline">
				<div id="pdiv">
					<div id="pdiv1">
						<div id="subdiv2">
							<span class="label label-default" id="lab2">Previous Due</span>
						</div>
						<div id="cdiv3">
							<input class="ninput"type="number" placeholder="Rupees" name="prev">
						</div>
					</div>
					<div id="pdiv2">
						<div id="subdiv2">
							<span class="label label-default" id="lab2"> Total</span>
						</div>
                                            
                                               
                                                <div id="cdiv3">
							<input class="ninput" value="${total}" type="number" placeholder="Rupees" name="total">
                                                        <d:remove var="total" scope="session" />
						</div>
                                                
                                               
					</div>
				</div>
				<hr class="hline">
				<div id="pdiv">
					<div id="pdiv1">
						<div id="subdiv2">
							<span class="label label-default" id="lab2">Paid </span>
						</div>
						<div id="cdiv3">
							<input class="ninput" type="number" value="0" placeholder="Rupees" name="paid">
						</div>
					</div>
					
				</div>
                                  <hr class="hline">  
                                <div id="btndiv2">
                                    <button class="btn btn-primary" type="submit" id="btn2">Pay
					</button>
                                </div>
                                
                            </form>
                            
                           
                        </div>
                    <hr class="hline">
                    </form>
		</div>
	</div>
	<footer>
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