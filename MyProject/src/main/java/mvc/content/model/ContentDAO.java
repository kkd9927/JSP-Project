package mvc.content.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	
}
