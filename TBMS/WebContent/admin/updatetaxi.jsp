<%@ page import="java.sql.*,pak.DBConnection" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" e"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
String tname=request.getParameter("tname");
String ttype=request.getParameter("ttype");
String reg=request.getParameter("reg");
String home=request.getParameter("home");
try
{
	Connection c=DBConnection.getConnection();
	java.sql.Statement st=c.createStatement();
	String str="update tsms.taxi set name='"+tname+"', type='"+ttype+"',reg_no='"+reg+"',home_location='"+home+"' where taxi_id='"+id+"'";
	int a=st.executeUpdate(str);
	if(a==1)
		response.sendRedirect("taxes.jsp");
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