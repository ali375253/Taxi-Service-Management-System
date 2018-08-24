package pak;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			Connection con=DBConnection.getConnection();
			
			Statement st=con.createStatement();
			ResultSet s=st.executeQuery("select * from tsms.user where username='"+request.getParameter("uname")+"' and password='"+request.getParameter("pass")+"'");

			if(s.next())
			{
				response.sendRedirect("http://localhost:8080/TBMS/index.jsp?userid="+s.getString(1));
			}
			else
			{
				response.sendRedirect("http://localhost:8080/TBMS/login.jsp?status=false");
			}
					
		}
		catch(Exception e)
		{
			System.out.println("Error"+e);
		}
	}

}
