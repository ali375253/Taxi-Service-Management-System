package pak;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class bookServlet
 */
@WebServlet("/bookServlet")
public class bookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String ss=request.getParameter("ss");
		String ee=request.getParameter("ee");
		String kk=request.getParameter("kk");
		String dd=request.getParameter("dd");
		String sel=request.getParameter("sel");
		String price=request.getParameter("price");
		String id=request.getParameter("id");
		String tripid;
		try
		{
			Connection con=DBConnection.getConnection();
			Statement st=con.createStatement();
			String str="insert into tsms.trip(pickup_from,drop_location,distance,duration)values('"+ss+"','"+ee+"','"+kk+"','"+dd+"')";
			int a=st.executeUpdate(str);
			if(a==1)
			{
				Statement st2=con.createStatement();
				ResultSet rs=st2.executeQuery("select max(trip_id) from tsms.trip");
				rs.next();
				response.sendRedirect("/TBMS/admin/payment.jsp?id="+id+"+&tripid="+rs.getString(1)+"&amount="+price);
			}
			else
				out.println("<b>Failed</b>");
		}
		catch(Exception e)
		{
			out.print("Error"+e);
		}
	}
}
