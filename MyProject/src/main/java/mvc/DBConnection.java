package mvc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Connection conn = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "BOARD_DB";
		String password = "board1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
		
		return conn;
	}
}
