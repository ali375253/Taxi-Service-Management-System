<%@ page import="java.sql.*, pak.DBConnection" language="java" contentType="text/html; charset=ISO-8859-1"
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
try
{
	Connection c=DBConnection.getConnection();
	java.sql.Statement st=c.createStatement();
	String str="delete from tsms.driver where driver_id='"+id+"'";
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