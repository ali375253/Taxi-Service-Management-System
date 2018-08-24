<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
    String am=request.getParameter("amount");
    String id=request.getParameter("id");
    String tid=request.getParameter("tripid");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="payservlet" method="get">
<table>
<tr>
	<td><input type="text" name="amount" value="<%=am%>" hidden>
	<td><input type="text" name="id" value="<%=id%>" hidden>
	<td><input type="text" name="tid" value="<%=tid%>" hidden>
	<td>Payment Mode :</td>
	<td>
	<select name=choice>
		<option>Cash</option>
		<option>PayTM</option>
		<option>Ola Money</option>
	</select>
	</td>
</tr>
<tr>
	<td><input type="submit" value="Pay"> 
</tr>
</table>
</form>
</body>
</html>