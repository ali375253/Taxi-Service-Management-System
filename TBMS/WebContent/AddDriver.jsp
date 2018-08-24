<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Driver</title>
</head>
<body>
<form method="post" action="/TBMS/AddDriver">
<table>
<tr>
	<td>First Name</td>
	<td>
		<input type="text" name="fname">
	</td>
</tr>
<tr>
	<td>Last Name</td>
	<td>
		<input type="text" name="lname">
	</td>
</tr>
<tr>
	<td>Mobile No.</td>
	<td>
		<input type="text" name="mob">
	</td>
</tr>
<tr>
	<td>Address</td>
	<td>
		<input type="text" name="address">
	</td>
</tr>
<tr>
	<td>City</td>
	<td>
		<input type="text" name="city">
	</td>
</tr>
<tr>
	<td>State</td>
	<td>
		<input type="text" name="state">
	</td>
</tr>
<tr>
	<td>Username</td>
	<td>
		<input type="text" name="uname">
	</td>
</tr>
<tr>
	<td>Password</td>
	<td> 
		<input type="password" name="pwd">
	</td>
</tr>
<tr>
	<td>
		<input type="submit" value="Add">
	</td>
	<td>
		<input type="reset" value="Reset">
	</td>
</tr>
</table>
</form>

</body>
</html>