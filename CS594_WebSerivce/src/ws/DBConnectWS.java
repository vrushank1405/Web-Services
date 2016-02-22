package ws;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectWS {
	public static Connection getConnection() {
		Connection c = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		/*
		 * For Cs3 server String url =
		 * "jdbc:mysql://cs3.calstatela.edu/cs320stu143"; String username =
		 * "cs320stu143"; String password = "xL4i*#*.";
		 */
		/* For localhost */
		String url = "jdbc:mysql://localhost/fnalpractice";
		String username = "root";
		String password = "admin";

		try {
			c = DriverManager.getConnection(url, username, password);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;

	}

}
