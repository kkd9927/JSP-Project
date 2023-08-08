package mvc.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mvc.DBConnection;

public class UserDAO {
	private static UserDAO instance;
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	
	private UserDAO() {}
	
	public static UserDAO getInstance() {
		if(instance == null) {
			instance = new UserDAO();
		}
		
		return instance;
	}
	
	public void insertUser(UserDTO user) {
		String sql = "INSERT INTO USER_LIST VALUES(?, ?, ?, ?, null)";
		
		String id = user.getId();
		String pw = user.getPw();
		String nickname = user.getNickname();
		String imgPath = user.getProfileImg();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, nickname);
			pstmt.setString(4, imgPath);
			
			int rs = pstmt.executeUpdate();
			
			dbClose();
		} catch(Exception e) {
			
		}
	}
	
	private void dbClose() throws SQLException, ClassNotFoundException {
		if(rs != null) {
			rs.close();
		}
		
		if(pstmt != null) {
			pstmt.close();
		}
		
		if(conn != null) {
			conn.close();
		}
	}
}
