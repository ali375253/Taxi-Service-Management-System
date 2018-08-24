
package pak;
import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddDriver
 */
@WebServlet("/AddDriver")
public class AddDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDriver() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
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
			String str="insert into tsms.driver (first_name,last_name,mobile_no,address,city,states,username,password)values('"+fname+"','"+lname+"','"+mob+"','"+address+"','"+city+"','"+state+"','"+uname+"','"+pwd+"')";
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
