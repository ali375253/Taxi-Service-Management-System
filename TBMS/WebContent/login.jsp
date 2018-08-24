<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
String str=request.getParameter("status");
if(str.equals("false"))
{
	str="Wrong password...!!!";
}

 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>
	<p align="center" style="color:red;"><%=str %></p>
	<form action="LoginServlet" method="post">
		<table align="center" border="1">
			<tr>
				<td>Username : </td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr>
				<td>Password : </td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" ></td>
				<td><input type="reset"></td>
			</tr>
		</table>
		<table align="center">
			<tr>
				<td><a href="UserRegistration.jsp">Registration</a></td>
			</tr>
		</table>
	</form>
</body>
<script>

</script>
</html>