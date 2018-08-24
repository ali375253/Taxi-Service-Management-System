<%@ page import="java.sql.*, pak.DBConnection" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Statement st=null;
	ResultSet rs=null;
	int n=0;
	String qry=null;
	try
	{
		Connection con=DBConnection.getConnection();
		st=con.createStatement();
		if(request.getParameter("q").equals("1"))
		 	qry="select * from tsms.user";
		else if(request.getParameter("q").equals("2"))
			qry="select d.first_name,d.last_name,t.name,t.type,t.reg_no from tsms.driver d inner join tsms.drives dr on d.driver_id=dr.driver_id inner join tsms.taxi t on t.taxi_id=dr.taxi_id";
		else if(request.getParameter("q").equals("3"))
			qry="select u.first_name,u.last_name,t.pickup_from,t.drop_location,t.distance,t.duration from tsms.user u inner join tsms.bookings b on u.user_id=b.user_id inner join tsms.trip t on t.trip_id=b.trip_id";
		else if(request.getParameter("q").equals("4"))
			qry="select d.first_name,d.last_name,t.pickup_from,t.drop_location,t.distance,t.duration from tsms.driver d inner join tsms.confirmation c on d.driver_id=c.driver_id inner join tsms.trip t on t.trip_id=c.trip_id";
		else if(request.getParameter("q").equals("5"))
			qry="select u.first_name,u.last_name,t.pickup_from,t.drop_location,t.distance,t.duration,p.payment_mode, p.amount from tsms.user u inner join tsms.paysfor pay on u.user_id=pay.user_id inner join tsms.trip t on t.trip_id=pay.trip_id inner join tsms.payment p on p.payment_id=pay.payment_id";
		rs=st.executeQuery(qry);
		ResultSetMetaData rsmd = rs.getMetaData();
		n = rsmd.getColumnCount();
	}
	catch(Exception e)
	{
		out.print(e);
	}
		
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border=1>
<%
	while(rs.next())
	{
		String arr[]=new String[n];
		for(int i=0;i<n;i++)
		{
			arr[i]=rs.getString(i+1);
		}
		out.print("<tr>");
		for(int j=0;j<n;j++)
		{
			
			out.print("<td>"+arr[j]+"</td>");
	
		}
		out.print("</tr>");
		
		
	}
%>
</table>
</body>
</html>