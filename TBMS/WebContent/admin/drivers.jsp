<%@ page import="java.sql.*, pak.DBConnection" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
 	ResultSet s=null;
	try
	{
		Connection c=DBConnection.getConnection();
		Statement st=c.createStatement();
		s=st.executeQuery("select * from tsms.driver");
		s.next();
		
	}
	catch(Exception e)
	{
		System.out.println("Error");
	}   
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table width="70%" border="1">
		<tr>
			<td><b>Taxi id</td>	
			<td><b>Name</td>
			<td><b>Type</td>
			<td><b>Registration no</td>
			<td><b>Edit</td>
			<td><b>Delete</td>
		</tr>
		
		<% 
		while(s.next())
		{
			out.print("<tr>");
			out.print("<td>"+s.getString(1)+"</td>");
			out.print("<td>"+s.getString(2)+"</td>");
			out.print("<td>"+s.getString(3)+"</td>");
			out.print("<td>"+s.getString(4)+"</td>");
			out.print("<td align='center'><a href='editdriver.jsp?id="+s.getString(1)+"'><img src='edit.ico' height='30' width='30'></td>");
			out.print("<td align='center'><a href='deletedriver.jsp?id="+s.getString(1)+"'><img src='delete.png' height='30' width='30'></td>");
			out.print("</tr>");
		}
		%>
		<tr>
		</tr>
	</table>
</body>
</html>