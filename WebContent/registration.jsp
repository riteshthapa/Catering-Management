<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
	<h1>Account Registration</h1>
	
	<form method="post" action="Register">
		<table>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username_field" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="password_field" /></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="first_name_field" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="last_name_field" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="register_button" value="Register" />
			</tr>
		</table>
	</form>
	
	<br>
	<p><a href="Login" />Login</a></p>
	<% if(request.getAttribute("message") != null) { %>
		<p><%= request.getAttribute("message") %>
	<% } %>
</body>
</html>