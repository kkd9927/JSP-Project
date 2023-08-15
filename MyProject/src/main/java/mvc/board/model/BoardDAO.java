package mvc.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.DBConnection;

public class BoardDAO {
	private static BoardDAO instance;
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	private static ArrayList<String> category;
	
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		if(instance == null) {
			instance = new BoardDAO();
		}
		
		return instance;
	}
	
	public static ArrayList<String> getCategory() {
		if(category == null) {
			category = new ArrayList<String>();
			
			String sql = "SELECT * FROM CATEGORY";
			
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					category.add(rs.getString("CATEGORY"));
				}
				
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				
			}
		}
		
		return category;
	}
	
	public void createBoard(BoardDTO board) {
		String sql = "INSERT INTO BOARD_LIST VALUES(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getBoardId());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getUserId());
			pstmt.setString(4, board.getCategory());
			pstmt.setString(5, board.getDescription());
			pstmt.setString(6, board.getTitleImg());
			pstmt.setString(7, board.getInfoImg());
			
			int rs = pstmt.executeUpdate();
			
			if(rs == 1) {
				sql = "UPDATE USER_LIST SET MANAGE_BOARD = ? WHERE USER_ID = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, board.getBoardId());
				pstmt.setString(2, board.getUserId());
				
				rs = pstmt.executeUpdate();
			}
		} catch(Exception e) {
			
		}
		
		dbClose();
	}
	
	public ArrayList<BoardDTO> getBoardList(String category) {
		ArrayList<BoardDTO> totalList = new ArrayList<BoardDTO>();
		BoardDTO board = new BoardDTO();
		
		String sql = "";
		
		try {
			if(category.equals("전체")) {
				sql = "SELECT * FROM BOARD_LIST";
			} else {
				sql = "SELECT * FROM BOARD_LIST WHERE CATEGORY = ?";
			}
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			if(!category.equals("전체")) {
				pstmt.setString(1, category);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board = new BoardDTO();
				board.setBoardId(rs.getString("BOARD_ID"));
				board.setTitle(rs.getString("TITLE"));
				board.setUserId(rs.getString("USER_ID"));
				board.setCategory(rs.getString("CATEGORY"));
				board.setDescription(rs.getString("DESCRIPTION"));
				board.setTitleImg(rs.getString("TITLE_IMG"));
				board.setInfoImg(rs.getString("INFO_IMG"));
				
				totalList.add(board);
			}
		} catch(Exception e) {
			
		}
		
		dbClose();
		
		return totalList;
	}
	
	public ArrayList<BoardDTO> getSearchResult(String keyward) {
		ArrayList<BoardDTO> totalList = new ArrayList<BoardDTO>();
		BoardDTO board = new BoardDTO();
		
		try {
			String sql = "SELECT * FROM BOARD_LIST WHERE TITLE LIKE ?";
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyward+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board = new BoardDTO();
				board.setBoardId(rs.getString("BOARD_ID"));
				board.setTitle(rs.getString("TITLE"));
				board.setUserId(rs.getString("USER_ID"));
				board.setCategory(rs.getString("CATEGORY"));
				board.setDescription(rs.getString("DESCRIPTION"));
				board.setTitleImg(rs.getString("TITLE_IMG"));
				board.setInfoImg(rs.getString("INFO_IMG"));
				
				totalList.add(board);
			}
		} catch(Exception e) {
			
		}
		
		dbClose();
		
		return totalList;
	}
	
	public BoardDTO getUserBoard(String domain) {
		BoardDTO board = new BoardDTO();
		
		String sql = "SELECT * FROM BOARD_LIST WHERE BOARD_ID = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, domain);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board.setBoardId(rs.getString("BOARD_ID"));
				board.setTitle(rs.getString("TITLE"));
				board.setUserId(rs.getString("USER_ID"));
				board.setCategory(rs.getString("CATEGORY"));
				board.setDescription(rs.getString("DESCRIPTION"));
				board.setTitleImg(rs.getString("TITLE_IMG"));
				board.setInfoImg(rs.getString("INFO_IMG"));
			}
		} catch(Exception e) {
			
		}
				
		return board;
	}
	
	public void updateBoard(BoardDTO board) {
		String sql = "UPDATE BOARD_LIST SET TITLE = ?, CATEGORY = ?, DESCRIPTION = ?, TITLE_IMG = ?, INFO_IMG = ? WHERE BOARD_ID = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getCategory());
			pstmt.setString(3, board.getDescription());
			pstmt.setString(4, board.getTitleImg());
			pstmt.setString(5, board.getInfoImg());
			pstmt.setString(6, board.getBoardId());
			
			int rs = pstmt.executeUpdate();
		} catch(Exception e) {
			
		}
		
		dbClose();
	}
	
	public void deleteBoard(String domain, String userId) {
		String sql = "UPDATE USER_LIST SET MANAGE_BOARD = '' WHERE USER_ID = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			int result = pstmt.executeUpdate();
			
			if(result == 1) {
				sql = "SELECT * FROM USER_CONTENT WHERE USER_ID = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					sql = "DELETE FROM USER_CONTENT WHERE USER_ID = ?";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, domain);
					
					result = pstmt.executeUpdate();
					
					if(result == 1) {
						sql = "DELETE FROM CONTENT_LIST WHERE BOARD_ID = ?";
						
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, domain);
						
						result = pstmt.executeUpdate();
					}
				} else {
					sql = "DELETE FROM BOARD_LIST WHERE BOARD_ID = ?";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, domain);
					
					result = pstmt.executeUpdate();
				}
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
