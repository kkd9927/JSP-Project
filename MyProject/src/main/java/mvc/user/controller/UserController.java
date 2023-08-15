package mvc.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.board.model.BoardDAO;
import mvc.board.model.BoardDTO;
import mvc.content.model.ContentDAO;
import mvc.content.model.ContentDTO;
import mvc.user.model.UserDAO;
import mvc.user.model.UserDTO;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		if(command.equals("/pages/user/signup.user")) {
			RequestDispatcher rd = request.getRequestDispatcher("signupForm.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/user/signupSend.user")) {
			requestSignUp(request);
			RequestDispatcher rd = request.getRequestDispatcher("signupResult.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/user/login.user")) {
			RequestDispatcher rd = request.getRequestDispatcher("loginForm.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/user/loginSend.user")) {
			RequestDispatcher rd;
			String result = requestLogIn(request);
			if(!result.equals("failed")) { 	// 로그인이 성공했을 때
				rd = request.getRequestDispatcher(result);
			} else {						// 로그인이 실패했을 때
				rd = request.getRequestDispatcher("loginForm.jsp");
			}
			rd.forward(request, response);
		} else if(command.equals("/pages/user/info.user")) {
			requestGetBoard(request);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/user/userInfo.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/user/editInfo.user")) {
			RequestDispatcher rd = request.getRequestDispatcher("/pages/user/editForm.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/user/editInfoSend.user")) {
			requestUserUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/user/userInfo.jsp");
			rd.forward(request, response); 
		} else if(command.equals("/pages/user/delete.user")) {
			requestUserDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("deleteResult.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/user/logout.user")) {
			requestLogOut(request);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/main/main.jsp");
			rd.forward(request, response);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	private void requestSignUp(HttpServletRequest request) throws IOException {
		UserDAO dao = UserDAO.getInstance();
		UserDTO dto = new UserDTO();
		
		String filePath = getServletContext().getRealPath("/") + "upload\\profile";
		int fileSize = 5 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(request, filePath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String id = multi.getParameter("id");
		String pw = multi.getParameter("pw");
		String nickname = multi.getParameter("nickname");
		String imgName = "";
		String fileName = multi.getOriginalFileName("profileImg");
		
		if(fileName != null) {
			imgName = renameFile(fileName, filePath, id);
		}
		
		dto.setId(id);
		dto.setPw(pw);
		dto.setNickname(nickname);
		dto.setProfileImg(imgName);
		
		dao.insertUser(dto);
	}
	
	private String requestLogIn(HttpServletRequest request) {
		UserDAO userDao = UserDAO.getInstance();
		UserDTO user = null;
		BoardDAO boardDao = BoardDAO.getInstance();
		BoardDTO board = null;
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		user = userDao.getUser(id, pw);
		
		if(user != null) {
			board = boardDao.getUserBoard(user.getManageBoard());
			
			session.setAttribute("UserInfo", user);
			session.setAttribute("BoardInfo", board);
			
			String refererURL = request.getParameter("url"); // 요청을 보내기 전 경로, 예) http://localhost:8080/MyProject/pages/main/main.jsp
			String urlArr[] = refererURL.split(request.getContextPath()); // 위 경로에서 ContextPath(/MyProject)를 기준으로 문자열을 잘라 문자열 배열 리턴
			String url = urlArr[1]; // 배열의 1번째 인덱스(/pages/main/main.jsp)의 값을 할당
			
			return url;
		} else {
			String result = "failed";
			
			request.setAttribute("result", result);
			
			return result;
		}
	}
		
	private void requestLogOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
	}
	
	private void requestGetBoard(HttpServletRequest request) {
		BoardDAO boardDao = BoardDAO.getInstance();
		BoardDTO board = new BoardDTO();
		ContentDAO contentDao = ContentDAO.getInstance();
		
		ArrayList<ContentDTO> totalList = new ArrayList<ContentDTO>();
		ArrayList<ContentDTO> pageList = new ArrayList<ContentDTO>();
		List<ArrayList<ContentDTO>> totalPage = new ArrayList<ArrayList<ContentDTO>>();
		
		String domain = request.getParameter("userBoard");
		
		board = boardDao.getUserBoard(domain);
		totalList = contentDao.getContentList(domain);
		
		int pageNum = 1;
		if(request.getParameter("page") != null) {
			pageNum = Integer.parseInt(request.getParameter("page"));
		}
		
		int cnt = 1;
		int totalCnt = totalList.size();
		
		for(int i=0; i<totalList.size(); i++) {
			pageList.add(totalList.get(i));
			
			if(cnt == 10) {
				totalPage.add(pageList);
				totalCnt -= cnt;
				cnt = 1;
				
				pageList = new ArrayList<ContentDTO>();
			} else if(cnt == totalCnt) {
				totalPage.add(pageList);
			} else {
				cnt++;
			}
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("BoardInfo", board);
		
		if(!totalPage.isEmpty()) {
			request.setAttribute("ContentList", totalPage.get(pageNum-1));
		}
		
		request.setAttribute("TotalPage", totalPage.size());
		request.setAttribute("PageNum", pageNum);
	}
	
	private void requestUserUpdate(HttpServletRequest request) throws IOException {
		UserDAO dao = UserDAO.getInstance();
		UserDTO user = new UserDTO();
		
		String filePath = getServletContext().getRealPath("/") + "upload\\profile";
		int fileSize = 5 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(request, filePath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String id = multi.getParameter("id");
		String pw = multi.getParameter("pw");
		String nickname = multi.getParameter("nickname");
		String imgName = "";
		String fileName = multi.getOriginalFileName("profileImg");
		
		if(fileName != null) {
			imgName = renameFile(fileName, filePath, id);
		}
		
		user.setId(id);
		user.setPw(pw);
		user.setNickname(nickname);
		if(imgName.equals("")) {
			UserDTO dto = dao.getUser(id, pw);
			imgName = dto.getProfileImg();
			user.setProfileImg(imgName);
		} else {
			user.setProfileImg(imgName);
		}
		
		dao.updateUser(user);
		
		// 기존 로그인 정보 삭제 후 변경된 정보로 업데이트
		user = new UserDTO();
		HttpSession session = request.getSession();
		session.removeAttribute("UserInfo");
		
		user  = dao.getUser(id, pw);
		
		session.setAttribute("UserInfo", user );
	}
	
	private void requestUserDelete(HttpServletRequest request) {
		UserDAO userDao = UserDAO.getInstance();
		UserDTO user = null;
		BoardDAO boardDao = BoardDAO.getInstance();
		BoardDTO board = new BoardDTO();
		
		String id = request.getParameter("id");
		
		// id로 유저 객체를 들고와 파일 경로의 이미지 삭제
		user = userDao.getUser(id, null);
		
		String filePathUser = getServletContext().getRealPath("/") + "upload\\profile";
		File img = new File(filePathUser + "\\" + user.getProfileImg());
		img.delete();
		
		if(user.getManageBoard() != null) { // 운영하는 게시판이 있으면 게시판 객체를 들고와 파일 경로의 이미지 삭제
			board = boardDao.getUserBoard(user.getManageBoard());
			
			String userId = board.getUserId();
			String filePathBoard = getServletContext().getRealPath("/") + "upload\\board";
			File titleImg = new File(filePathBoard + "\\" + board.getTitleImg());
			File infoImg = new File(filePathBoard + "\\" + board.getInfoImg());
			titleImg.delete();
			infoImg.delete();
			
			boardDao.deleteBoard(user.getManageBoard(), userId);
		}
		
		userDao.deleteUser(id);
		
		// 회원탈퇴 후 기존 로그인정보 삭제
		HttpSession session = request.getSession();
		session.invalidate();
	}
	
	private String renameFile(String fileName, String filePath, String id) {
		// 확장자 추출
		String nameArr[] = fileName.split("\\.");
		String extension = nameArr[1];
		
		String oldFilePath = filePath + "\\" + fileName;
		String newFilePath = filePath + "\\" + id + "_img." + extension; // 파일명 id_img.extension
		String newFileName = id + "_img." + extension;
		
		File oldFile = new File(oldFilePath);
		File newFile = new File(newFilePath);
		
		if(newFile.exists()) {
			newFile.delete();
		}
		
		oldFile.renameTo(newFile);
		
		return newFileName;
	}
}
