package pak;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddTaxi
 */
@WebServlet("/AddTaxi")
public class AddTaxi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTaxi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String tname=request.getParameter("tname");
		String ttype=request.getParameter("ttype");
		String reg=request.getParameter("reg");
		String home=request.getParameter("home");
		try
		{
			Connection c=DBConnection.getConnection();
			java.sql.Statement st=c.createStatement();
			String str="insert into tsms.taxi (name,type,reg_no,home_location)values('"+tname+"','"+ttype+"','"+reg+"','"+home+"')";
			int a=st.executeUpdate(str);
			if(a==1)
				out.println("<b>Data Added Successfully</b>");
			else
				out.println("<b>Failed</b>");
		}
		catch(Exception e)
		{
			System.out.println("Error"+e);
		}
	}

}
