package pak;
import java.sql.*;
import org.postgresql.*;
public class DBConnection {
	public static Connection getConnection()
	{
		Connection con=null;
		try
		{
			Class.forName("org.postgresql.Driver");
			con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/TBMS","postgres","aliasgar");
			
		}
		catch(Exception e)
		{
			System.out.println(e+"nathi");
		}
		return con;
	}
}
