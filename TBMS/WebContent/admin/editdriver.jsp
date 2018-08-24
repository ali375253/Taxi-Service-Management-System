<%@ page import="java.sql.*, pak.DBConnection" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
ResultSet s=null;
try
{
	String id=request.getParameter("id");
	Connection c=DBConnection.getConnection();
	java.sql.Statement st=c.createStatement();
	String str="select * from tsms.driver where driver_id='"+id+"'";
	s=st.executeQuery(str);
	s.next();
}
catch(Exception e)
{
	System.out.println("Error"+e);
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="/TBMS//admin/updatedriver.jsp">
<table>
<tr>
	<td>Driver ID</td>
	<td>
		<input type="text" name="id" value="<%=s.getString(1) %>">
	</td>
</tr>
<tr>
	<td>First Name</td>
	<td>
		<input type="text" name="fname" value="<%=s.getString(2) %>">
	</td>
</tr>
<tr>
	<td>Last Name</td>
	<td>
		<input type="text" name="lname" value="<%=s.getString(3) %>">
	</td>
</tr>
<tr>
	<td>Mobile Number</td>
	<td>
		<input type="text" name="mob"  value="<%=s.getString(4) %>">
	</td>
</tr>
<tr>
	<td>Address</td>
	<td>
		<input type="text" name="address"  value="<%=s.getString(5) %>">
	</td>
</tr>
<tr>
	<td>City</td>
	<td>
		<input type="text" name="city"  value="<%=s.getString(6) %>">
	</td>
</tr>
<tr>
	<td>State</td>
	<td>
		<input type="text" name="state"  value="<%=s.getString(7) %>">
	</td>
</tr>
<tr>
	<td>Username</td>
	<td>
		<input type="text" name="uname"  value="<%=s.getString(8) %>">
	</td>
</tr>
<tr>
	<td>Password</td>
	<td>
		<input type="text" name="pwd"  value="<%=s.getString(9) %>">
	</td>
</tr>

<tr>
	<td>
		<input type="submit" value="Update">
	</td>
	<td>
		<input type="reset" value="Reset">
	</td>
</tr>
</table>
</form>
</body>
</html>