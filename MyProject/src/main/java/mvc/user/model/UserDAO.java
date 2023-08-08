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
		} catch(Exception e) {
			
		}
		
		dbClose();
	}
	
	public UserDTO loginUser(String id, String pw) {
		UserDTO dto = new UserDTO();
		String sql = "SELECT * FROM USER_LIST WHERE USER_ID = ? AND USER_PW = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setId(rs.getString("USER_ID"));
				dto.setPw(rs.getString("USER_PW"));
				dto.setNickname(rs.getString("NICKNAME"));
				dto.setProfileImg(rs.getString("PROFILE_IMG"));
				dto.setManageBoard(rs.getString("MANAGE_BOARD"));
				
				return dto;
			}
			
		} catch(Exception e) {
			
		}
		
		dbClose();
		
		return null;
	}
	
	private void dbClose() {
		try {
			if(rs != null) {
				rs.close();
			}
			
			if(pstmt != null) {
				pstmt.close();
			}
			
			if(conn != null) {
				conn.close();
			}
		} catch(SQLException e) {
			
		}
	}
}
