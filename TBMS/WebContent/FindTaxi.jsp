<%@ page import="java.sql.*,pak.DBConnection, java.lang.Integer" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String arr[]=new String[6];
	String id=request.getParameter("userid");
	String s=request.getParameter("s");
	String e=request.getParameter("e");
	String k=request.getParameter("k");
	String d=request.getParameter("d");
	String kilometer="";
	for(int i=0;i<k.length();i++)
	{
		if(k.charAt(i)==' ')
		{
			kilometer=k.substring(0,i);
			break;
		}
	}
	int kklo=Integer.parseInt(kilometer);
	
	int count=0;
	int a=0,b=0;
	String m=s;
	for(int i=s.length()-1;i>=0;i--)
	{
		if(s.charAt(i)==',')
			++count;
		
		if(i==0 || count==3)
		{
			int t;
			if(i==0)
				t=a=i;
			else
				t=a=i+1;
			while(s.charAt(a)!=',')
			{
				a++;
			}
			m=m.substring(t,a);
			break;
		}
	}
	try
	{
		Connection con=DBConnection.getConnection();
		
		Statement st=con.createStatement();
		ResultSet set=st.executeQuery("select distinct type from tsms.taxi where home_location='"+m+"'");
		
		
		int i=0;
		while(set.next())
		{
			arr[i]=set.getString("type");
			i++;
		}
		
		set.close();
		st.close();
		con.close();
	}
	catch(Exception ee)
	{
		System.out.println("Eroor"+ee);
	}
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="bookServlet" method="get">
<table align=center>
<tr>
	<td align="right"><b>Start : </td>
	<td><input type="text" name="ss" value="<%=s %>"></td>
</tr>
<tr>
	<td align="right"><b>End : </td>
	<td><input type="text" name="ee"  value="<%=e %>"></td>
</tr>
<tr>
	<td align="right"><b>Kilometer : </td>
	<td><input type="text" name="kk"  value="<%=k %>"></td>
</tr>
<tr>
	<td align="right"><b>Duration : </td>
	<td><input type="text"  name="dd" value="<%=d %>"></td>
	<input name="id" type="text" hidden>
</tr>

<tr>
	<td align="center"><b>Select :</td>
	<td>
	<select name="sel" id="MySelect" onchange="myFun()">
	<%
	for(int i=0;i<arr.length;i++)
	{
		String ta=arr[i];
		System.out.print("a");
		%><option value="<%=i%>"><%=ta %></option>
	<% 
	}
	%>
	</select>
	</td>
</tr>
<tr>
<td align="center"><b>Fair</td>
<td><input type="text" id="p" name="price"></td>
</tr>
<tr>
	<td align="center"><button type="submit">Confirm</button></td>
</tr>

</table>
</form>
<p id="abc" style="color:white"><%=kklo %></p>
<script>
function myFun()
{

	var e = document.getElementById("MySelect");
     var g=e.options[e.selectedIndex].text;
   
    var price=0;
   
    var k=document.getElementById("abc").innerHTML;
    var ko=parseInt(k);
        if(g.localeCompare("Auto")==0)
    {
    	price=4*ko;
    }
    else if(g.localeCompare("micro")==0)
    {
    	price=6*ko;
    }
    else if(g.localeCompare("mini")==0)
    {
    	price=8*ko;
    }
    else if(g.localeCompare("prime")==0)
    {
    	price=10*ko;
    }
    else if(g.localeCompare("rentals")==0)
    {
    	price=12*ko;
    }
    else if(g.localeCompare("Share")==0)
    {
    	price=4*ko;
    }
    
    document.getElementById("p").value=price;
}

</script>
</body>
</html>