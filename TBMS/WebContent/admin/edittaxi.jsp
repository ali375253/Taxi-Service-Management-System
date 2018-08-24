<%@ page import="java.sql.*, pak.DBConnection" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
ResultSet s=null;
try
{
	String id=request.getParameter("id");
	Connection c=DBConnection.getConnection();
	java.sql.Statement st=c.createStatement();
	String str="select * from tsms.taxi where taxi_id='"+id+"'";
	s=st.executeQuery(str);
	s.next();
}
catch(Exception e)
{
	System.out.println("Error"+e);
}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="/TBMS//admin/updatetaxi.jsp">
<table>
<tr>
	<td>Taxi ID</td>
	<td>
		<input type="text" name="id" value="<%=s.getString(1) %>">
	</td>
</tr>
<tr>
	<td>Taxi Name</td>
	<td>
		<input type="text" name="tname" value="<%=s.getString(2) %>">
	</td>
</tr>
<tr>
	<td>Taxi Type</td>
	<td>
		<input type="text" name="ttype" value="<%=s.getString(3) %>">
	</td>
</tr>
<tr>
	<td>Registration Number</td>
	<td>
		<input type="text" name="reg"  value="<%=s.getString(4) %>">
	</td>
</tr>
<tr>
	<td>home_location</td>
	<td>
		<input type="text" name="home"  value="<%=s.getString(5) %>">
	</td>
</tr><tr>
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