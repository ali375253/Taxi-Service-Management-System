<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/TBMS/AddTaxi">
<table>
<tr>
	<td>Taxi Name</td>
	<td>
		<input type="text" name="tname">
	</td>
</tr>
<tr>
	<td>Taxi Type</td>
	<td>
		<input type="text" name="ttype">
	</td>
</tr>
<tr>
	<td>Registration Number</td>
	<td>
		<input type="text" name="reg">
	</td>
</tr>
<tr>
	<td>home_location</td>
	<td>
		<input type="text" name="home">
	</td>
</tr><tr>
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