package mvc.user.model;

public class UserDTO {
	private String id;
	private String pw;
	private String nickname;
	private String profileImg;
	private String manageBoard;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getManageBoard() {
		return manageBoard;
	}
	public void setManageBoard(String manageBoard) {
		this.manageBoard = manageBoard;
	}
}
