package tuyen.websach.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	  private static String url = "jdbc:sqlserver://localhost;databaseName=BookStore";
	   private static String username = "sa";
	   private static String password = "123";
	   private static String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	 
	  
	   
	   static {
	      try {
	         Class.forName(driverClass);
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      }
	   }

	   public static Connection getConnection() throws SQLException {
	      return DriverManager.getConnection(url, username, password);
	   }
	  

}
