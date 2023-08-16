package mvc.content.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.DBConnection;
import mvc.board.model.BoardDTO;

public class ContentDAO {
	private static ContentDAO instance;
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	
	public ContentDAO() {}
	
	public static ContentDAO getInstance() {
		if(instance == null) {
			instance = new ContentDAO();
		}
		
		return instance;
	}
	
	public int insertContent(ContentDTO content) {
		int contentId = 0;
		
		String sql = "INSERT INTO BOARD_CONTENT VALUES(?, AUTO_INCREMENT.NEXTVAL, ?, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:mi'), ?, ?, ?, ?)";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content.getBoardId());
			pstmt.setString(2, content.getUserId());
			pstmt.setString(3, content.getTitle());
			pstmt.setString(4, content.getContent());
			pstmt.setString(5, content.getFiles());
			pstmt.setInt(6, 0);
			
			int rsInsert = pstmt.executeUpdate();
			
			if(rsInsert == 1) {
				sql = "SELECT * FROM BOARD_CONTENT WHERE BOARD_ID = ? AND USER_ID = ? AND TITLE = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, content.getBoardId());
				pstmt.setString(2, content.getUserId());
				pstmt.setString(3, content.getTitle());
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					contentId = rs.getInt("CONTENT_ID");
					
					sql = "INSERT INTO USER_CONTENT VALUES(?, ?)";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, rs.getString("USER_ID"));
					pstmt.setInt(2, contentId);
					
					rsInsert = pstmt.executeUpdate();
				}
			}
		} catch(Exception e) {
			
		}
		
		dbClose();
		
		return contentId;
	}
	
	public ContentDTO getContent(int contentId) {
		ContentDTO content = new ContentDTO();
		
		String sql = "SELECT * FROM BOARD_CONTENT WHERE CONTENT_ID = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				content.setBoardId(rs.getString("BOARD_ID"));
				content.setContentId(rs.getInt("CONTENT_ID"));
				content.setUserId(rs.getString("USER_ID"));
				content.setWriteDate(rs.getString("WRITE_DATE"));
				content.setTitle(rs.getString("TITLE"));
				content.setContent(rs.getString("CONTENT"));
				content.setFiles(rs.getString("IMAGE"));
				content.setRec(rs.getInt("REC"));
			}
		} catch(Exception e) {
			
		}
		
		dbClose();
		
		return content;
	}
	
	public ArrayList<ContentDTO> getContentList(String domain) {
		ArrayList<ContentDTO> totalList = new ArrayList<ContentDTO>();
		ContentDTO content = new ContentDTO();
		
		String sql = "SELECT * FROM(SELECT ROWNUM AS RN, C.* FROM(SELECT * FROM BOARD_CONTENT WHERE BOARD_ID = ? ORDER BY CONTENT_ID DESC) C)";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, domain);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				content = new ContentDTO();
				content.setBoardId(rs.getString("BOARD_ID"));
				content.setContentId(rs.getInt("CONTENT_ID"));
				content.setUserId(rs.getString("USER_ID"));
				content.setWriteDate(rs.getString("WRITE_DATE"));
				content.setTitle(rs.getString("TITLE"));
				content.setContent(rs.getString("CONTENT"));
				content.setFiles(rs.getString("IMAGE"));
				content.setRec(rs.getInt("REC"));
				
				totalList.add(content);
			}
		} catch(Exception e) {
			
		}
		
		dbClose();
		
		return totalList;
	}
	
	public void updateContent(ContentDTO content) {
		String sql = "UPDATE BOARD_CONTENT SET BOARD_ID = ?, USER_ID = ?, TITLE = ?, CONTENT = ?, IMAGE = ? WHERE CONTENT_ID = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content.getBoardId());
			pstmt.setString(2, content.getUserId());
			pstmt.setString(3, content.getTitle());
			pstmt.setString(4, content.getContent());
			pstmt.setString(5, content.getFiles());
			pstmt.setInt(6, content.getContentId());
			
			int rs = pstmt.executeUpdate();
		} catch(Exception e) {
			
		}
		
		dbClose();
	}
	
	public void deleteContent(int contentId) {
		String sql = "DELETE FROM USER_CONTENT WHERE CONTENT_ID = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentId);
			
			int rs1 = pstmt.executeUpdate();
			
			if(rs1 == 1) {
				sql = "DELETE FROM BOARD_CONTENT WHERE CONTENT_ID = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, contentId);
				
				int rs2 = pstmt.executeUpdate();
			}
		} catch(Exception e) {
			
		}
		
		dbClose();
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
