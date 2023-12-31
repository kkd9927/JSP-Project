package mvc.board.controller;

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

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		if(command.equals("/pages/board/create.board")) {
			requestGetCategory(request);
			RequestDispatcher rd = request.getRequestDispatcher("createForm.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/board/createSend.board")) {
			boolean result = requestCreateBoard(request);
			RequestDispatcher rd;
			
			if(result) {
				rd = request.getRequestDispatcher("createResultSuccess.jsp");
			} else {
				rd = request.getRequestDispatcher("createResultFail.jsp");
			}
			
			rd.forward(request, response);
		} else if(command.equals("/pages/main/main.board") || command.equals("/pages/main/main.jsp")) {
			requestGetBoard(request);
			requestGetList(request);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/main/boardList.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/main/search.board")) {
			requestGetList(request);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/main/search.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/board/" + request.getParameter("userBoard") + ".board")) {
			requestGetBoard(request);
			RequestDispatcher rd = request.getRequestDispatcher("boardMain.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/board/update.board")) {
			requestGetCategory(request);
			requestGetBoard(request);
			RequestDispatcher rd = request.getRequestDispatcher("updateForm.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/board/updateSend.board")) {
			requestUpdateBoard(request);
			RequestDispatcher rd = request.getRequestDispatcher("boardMain.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/board/delete.board")) {
			requestDeleteBoard(request);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/main/main.jsp");
			rd.forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	private void requestGetCategory(HttpServletRequest request) {
		ArrayList<String> category = BoardDAO.getCategory();
		request.setAttribute("category", category);
	}
	
	private boolean requestCreateBoard(HttpServletRequest request) throws IOException {
		BoardDAO boardDao = BoardDAO.getInstance();
		BoardDTO board = new BoardDTO();
		
		String filePath = getServletContext().getRealPath("/") + "upload\\board";
		int fileSize = 5 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, filePath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		if(boardDao.getUserBoard(multi.getParameter("domain")).getBoardId() == null) {
			String domain = multi.getParameter("domain");
			String title = multi.getParameter("title");
			String category = multi.getParameter("category");
			String id = multi.getParameter("id");
			String description = multi.getParameter("description");
			String fileNameTitle = multi.getOriginalFileName("titleImg");
			String fileNameInfo = multi.getOriginalFileName("infoImg");
			
			String titleImgName = "";
			String infoImgName = "";
			
			if(fileNameTitle != null) {
				titleImgName = renameFile(fileNameTitle, filePath, domain, "title");
			} 
			
			if(fileNameInfo != null) {
				infoImgName = renameFile(fileNameInfo, filePath, domain, "info");
			}
			
			board.setBoardId(domain);
			board.setTitle(title);
			board.setCategory(category);
			board.setUserId(id);
			board.setDescription(description);
			board.setTitleImg(titleImgName);
			board.setInfoImg(infoImgName);
			
			boardDao.createBoard(board);
			
			// 기존 로그인 정보 삭제 후 변경된 정보(게시판 추가)로 업데이트
			UserDAO userDAO = UserDAO.getInstance();
			UserDTO user = new UserDTO();
			HttpSession session = request.getSession();
			session.removeAttribute("UserInfo");
			
			user = userDAO.getUser(id, null);
			session.setAttribute("UserInfo", user);
			session.setAttribute("BoardInfo", board);
			
			return true;
		} else {
			return false;
		}
	}
	
	private void requestGetList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardDTO> totalList = new ArrayList<BoardDTO>();
		ArrayList<BoardDTO> pageList = new ArrayList<BoardDTO>();
		List<ArrayList<BoardDTO>> totalPage = new ArrayList<ArrayList<BoardDTO>>();
		
		String type = "";
		String category = "";
		
		if(request.getParameter("type") != null) {
			type = request.getParameter("type");
		} else {
			type = "list";
		}
		
		if(type.equals("list")) {
			if(request.getParameter("category") != null) {
				category = request.getParameter("category");
			} else {
				category = "전체";
			}
			
			totalList = dao.getBoardList(category);
			request.setAttribute("Category", category);
		} else if(type.equals("search")) {
			String keyward = request.getParameter("keyward");
			totalList = dao.getSearchResult(keyward);
			request.setAttribute("Keyward", keyward);
		}
			
		int pageNum = 1;
		if(request.getParameter("page") != null) {
			pageNum = Integer.parseInt(request.getParameter("page"));
		}
		
		int cnt = 1;
		int totalCnt = totalList.size();
		
		for(int i=0; i<totalList.size(); i++) {
			pageList.add(totalList.get(i));
			
			if(cnt == 8) {
				totalPage.add(pageList);
				totalCnt -= cnt;
				cnt = 1;
				
				pageList = new ArrayList<BoardDTO>();
			} else if(cnt == totalCnt) {
				totalPage.add(pageList);
			} else {
				cnt++;
			}
		}
		
		if(!totalPage.isEmpty()) {
			request.setAttribute("BoardList", totalPage.get(pageNum-1));
		}
		
		request.setAttribute("TotalPage", totalPage.size());
		request.setAttribute("PageNum", pageNum);
	}
	
	private void requestGetBoard(HttpServletRequest request) {
		BoardDAO boardDao = BoardDAO.getInstance();
		BoardDTO board = new BoardDTO();
		UserDAO userDao = UserDAO.getInstance();
		UserDTO user = new UserDTO();
		ContentDAO contentDao = ContentDAO.getInstance();
		
		ArrayList<ContentDTO> totalList = new ArrayList<ContentDTO>();
		ArrayList<ContentDTO> pageList = new ArrayList<ContentDTO>();
		List<ArrayList<ContentDTO>> totalPage = new ArrayList<ArrayList<ContentDTO>>();
		
		HttpSession session = request.getSession();
		UserDTO login = (UserDTO)session.getAttribute("UserInfo");
		
		String domain;
		if(session.getAttribute("UserInfo") != null) {
			domain = login.getManageBoard();
		} else {
			domain = request.getParameter("userBoard");
		}
		
		board = boardDao.getUserBoard(domain);
		user = userDao.getUser(board.getUserId(), null);
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
		
		if(!totalPage.isEmpty()) {
			request.setAttribute("ContentList", totalPage.get(pageNum-1));
		}
		
		request.setAttribute("BoardInfo", board);
		request.setAttribute("UserInfo", user);
		request.setAttribute("TotalPage", totalPage.size());
		request.setAttribute("PageNum", pageNum);
	}
	
	private void requestUpdateBoard(HttpServletRequest request) throws IOException {
		BoardDAO boardDao = BoardDAO.getInstance();
		BoardDTO board = new BoardDTO();
		UserDAO userDao = UserDAO.getInstance();
		UserDTO user = new UserDTO();
		
		String filePath = getServletContext().getRealPath("/") + "upload\\board";
		int fileSize = 5 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(request, filePath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String domain = multi.getParameter("domain");
		String title = multi.getParameter("title");
		String category = multi.getParameter("category");
		String id = multi.getParameter("id");
		String description = multi.getParameter("description");
		String fileNameTitle = multi.getOriginalFileName("titleImg");
		String fileNameInfo = multi.getOriginalFileName("infoImg");
		
		String titleImgName = "";
		String infoImgName = "";
		
		if(fileNameTitle != null) {
			titleImgName = renameFile(fileNameTitle, filePath, domain, "title");
		} 
		
		if(fileNameInfo != null) {
			infoImgName = renameFile(fileNameInfo, filePath, domain, "info");
		}
		
		board.setBoardId(domain);
		board.setTitle(title);
		board.setCategory(category);
		board.setUserId(id);
		board.setDescription(description);
		
		if(titleImgName.equals("")) { // 타이틀 이미지가 공백일 때 기존 이미지 불러오기
			BoardDTO dto = boardDao.getUserBoard(domain);
			titleImgName = dto.getTitleImg();
			board.setTitleImg(titleImgName);
		} else {
			board.setTitleImg(titleImgName);
		}
		
		if(infoImgName.equals("")) { // 로고 이미지가 공백일 때 기존 이미지 불러오기
			BoardDTO dto = boardDao.getUserBoard(domain);
			infoImgName = dto.getInfoImg();
			board.setInfoImg(infoImgName);
		} else {
			board.setInfoImg(infoImgName);
		}
		
		boardDao.updateBoard(board);
		
		// 기존 게시판 정보 삭제 후 변경된 정보로 업데이트
		board = new BoardDTO();
		board = boardDao.getUserBoard(domain);
		user = userDao.getUser(board.getUserId(), null);
		request.setAttribute("BoardInfo", board);
		request.setAttribute("UserInfo", user);
	}
	
	private void requestDeleteBoard(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO board = new BoardDTO();
		
		String domain = request.getParameter("domain");
		
		// domain으로 게시판 객체를 들고와 파일 경로의 이미지 삭제
		board = dao.getUserBoard(domain);
		
		String userId = board.getUserId();
		String filePath = getServletContext().getRealPath("/") + "upload\\board";
		File titleImg = new File(filePath + "\\" + board.getTitleImg());
		File infoImg = new File(filePath + "\\" + board.getInfoImg());
		titleImg.delete();
		infoImg.delete();
		
		dao.deleteBoard(domain, userId);
		
		// 게시판삭제 후 기존 세션 삭제
		HttpSession session = request.getSession();
		session.removeAttribute("UserInfo");
		
		// 유저 정보만 재생성
		UserDAO userDao = UserDAO.getInstance();
		UserDTO user = new UserDTO();
		
		user = userDao.getUser(board.getUserId(), null);
		session.setAttribute("UserInfo", user );
	}
	
	private String renameFile(String fileName, String filePath, String domain, String type) {
		// 확장자 추출
		String nameArr[] = fileName.split("\\.");
		String extension = nameArr[1];
		
		String oldFilePath = filePath + "\\" + fileName;
		String newFilePath = "";
		String newFileName = "";
		
		if(type.equals("title")) {
			newFilePath = filePath + "\\" + domain + "_" + type + "_img." + extension; // 파일명 id_img.extension
			newFileName = domain + "_title_img." + extension;
		} else if(type.equals("info")) {
			newFilePath = filePath + "\\" + domain + "_" + type + "_img." + extension; // 파일명 id_img.extension
			newFileName = domain + "_info_img." + extension;
		}
		
		File oldFile = new File(oldFilePath);
		File newFile = new File(newFilePath);
		
		if(newFile.exists()) {
			newFile.delete();
		}
		
		oldFile.renameTo(newFile);
		
		return newFileName;
	}
}
