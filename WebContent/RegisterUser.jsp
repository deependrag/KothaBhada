<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600'
	rel='stylesheet' type='text/css'>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/formStyle.css">

<%
	response.setHeader("Cache-Control", "no-cache, no-store ,must-revalidate");//HTTP 1.1
	response.setHeader("Pragma", "no-cache");//HTTP 1.0
	response.setHeader("Expires", "0"); //Proxies

	if (session.getAttribute("user_email") == null) {
		response.sendRedirect("./index.jsp");
	}
%>
<div class="testbox">
	<h1>Registration</h1>

	<form action="./Register" method="post">
		<hr>
		<label id="icon" for="name"><i class="icon-envelope "></i></label> <input
			type="text" name="email" id="name" placeholder="Email" required /> <label
			id="icon" for="name"><i class="icon-user"></i></label> <input
			type="text" name="name" id="name" placeholder="Name" required /> <label
			id="icon" for="name"><i class="icon-shield"></i></label> <input
			type="password" name="password" id="name" placeholder="Password"
			required />
		<div class="gender">
			<input type="radio" value="Male" id="male" name="gender" checked />
			<label for="male" class="radio">Male</label> <input type="radio"
				value="Female" id="female" name="gender" /> <label for="female"
				class="radio">Female</label>
		</div>
		<a href="" class="button"><input type="submit" class="btn"
			value="Register" /></a>
	</form>
</div>