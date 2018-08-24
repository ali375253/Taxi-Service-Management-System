<%@ page import="java.sql.*,pak.DBConnection" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String mob=request.getParameter("mob");
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
try
{
	Connection c=DBConnection.getConnection();
	java.sql.Statement st=c.createStatement();
	String str="update tsms.driver set first_name='"+fname+"', last_name='"+lname+"',mobile_no='"+mob+"',address='"+address+"',city='"+city+"',states='"+state+"',username='"+mob+"',password='"+mob+"' where driver_id='"+id+"'";
	int a=st.executeUpdate(str);
	if(a==1)
		response.sendRedirect("drivers.jsp");
	else
		out.println("<b>Failed</b>");
}
catch(Exception e)
{
	System.out.println("Error"+e);
}
%>
</body>
</html>