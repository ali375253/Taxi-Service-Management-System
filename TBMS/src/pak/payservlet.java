package pak;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class payservlet
 */
@WebServlet("/admin/payservlet")
public class payservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public payservlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mode=request.getParameter("choice");
		String amount=request.getParameter("amount");
		String id=request.getParameter("id");
		try
		{
			Connection con=DBConnection.getConnection();
			Statement st=con.createStatement();
			Statement st3=con.createStatement();
			String str="insert into tsms.payment(payment_mode,amount) values('"+mode+"',"+amount+")";
		
			int a=st.executeUpdate(str);
			if(a==1)
			{
				response.getWriter().print("payment Successful");
			}
			else
				response.getWriter().println("<b>Failed</b>");		
		}
		catch(Exception e)
		{
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
