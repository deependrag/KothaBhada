<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.kothabhada.PayHistoryDto"%>

<html>
<head>
<meta chars. et="utf-8">
<title>Invoice</title>
<link rel="stylesheet" href="assets/css/receipt.css">
<script src="script.js"></script>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store ,must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setHeader("Expires", "0"); //Proxies

		PayHistoryDto payhistoryDto = new PayHistoryDto();

		if (session.getAttribute("user_role") == null) {
			response.sendRedirect("./index.jsp");
		} else if (session.getAttribute("userid").equals("")) {
			response.sendRedirect("./DisplayClient");
		} else {
			if (session.getAttribute("other_payment_details") == null) {
				response.sendRedirect("./DisplayClient");
			} else {
				payhistoryDto = (PayHistoryDto) session.getAttribute("other_payment_details");
			}
		}
	%>

	<header>
		<h1>Receipt</h1>
		<address>
			<p>Deependra Dhakal</p>
			<p>
				Kapan-12, Budanilkantha<br>Kathmandu,Nepal
			</p>
			<p>+977 9842633181</p>
		</address>
		<span><img alt="" src="assests/img/logo.png"><input
			type="file" accept="image/*"></span>
	</header>
	<article>
		<table class="meta">
			<tr>
				<th><span>RefNo.</span></th>
				<td><span><%=payhistoryDto.getRefno()%></span></td>
			</tr>
			<tr>
				<th><span>Date</span></th>
				<td><span><%=payhistoryDto.getDate()%></span></td>
			</tr>
		</table>
		<table class="inventory">
			<thead>
				<tr>
					<th><span>Item</span></th>
					<th><span>Month</span></th>
					<th><span>Rate</span></th>
					<th><span>Price</span></th>
				</tr>
			</thead>
			<tbody>
				<d:forEach items="${payment_details}" var="b">
					<tr>
						<td>${b.item}</td>
						<td>${b.month}</td>
						<td><span data-prefix>Rs. </span>${b.rate}</td>
						<td><span data-prefix>Rs. </span>${b.price}</td>
					</tr>
				</d:forEach>
			</tbody>
		</table>
		<table class="balance">
			<tr>
				<th><span>Total</span></th>
				<td><span data-prefix>Rs. </span><span><%=payhistoryDto.getTopay()%></span></td>
			</tr>
			<tr>
				<th><span>Amount Paid</span></th>
				<td><span data-prefix>Rs. </span><span><%=payhistoryDto.getPaid()%></span></td>
			</tr>
			<tr>
				<th><span>Balance Due</span></th>
				<td><span data-prefix>Rs. </span><span><%=payhistoryDto.getDue()%></span></td>
			</tr>
		</table>
	</article>
	<aside>
		<h1>
			<span>Additional Notes</span>
		</h1>
		<div>
			<p>Above Amount is exclusive of vat/tax.</p>
		</div>
	</aside>
</body>
</html>