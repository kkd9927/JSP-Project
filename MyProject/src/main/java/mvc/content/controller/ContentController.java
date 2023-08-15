package mvc.content.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import mvc.board.model.BoardDAO;
import mvc.board.model.BoardDTO;
import mvc.content.model.ContentDAO;
import mvc.content.model.ContentDTO;
import mvc.user.model.UserDAO;
import mvc.user.model.UserDTO;

@MultipartConfig(
		fileSizeThreshold = 1024 * 1024,
		maxFileSize = 1024 * 1024 * 5, //5메가
		maxRequestSize = 1024 * 1024 * 5 * 10 // 5메가 10개까지
)
public class ContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		if(command.equals("/pages/board/write.content")) {
			RequestDispatcher rd = request.getRequestDispatcher("contentWriteForm.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/board/writeSend.content")) {
			requestWriteContent(request);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/board/readContent.content");
			rd.forward(request, response);
		} else if(command.equals("/pages/board/readContent.content")) {
			requestGetContent(request);
			RequestDispatcher rd = request.getRequestDispatcher("content.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/board/edit.content")) {
			requestGetContent(request);
			RequestDispatcher rd = request.getRequestDispatcher("contentEditForm.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/board/editSend.content")) {
			requestEditContent(request);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/board/readContent.content");
			rd.forward(request, response);
		} else if(command.equals("/pages/board/delete.content")) {
			requestDeleteContent(request);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/board/" + request.getParameter("userBoard") + ".board");
			rd.forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	private void requestWriteContent(HttpServletRequest request) throws ServletException, IOException {
		ContentDAO dao = ContentDAO.getInstance();
		ContentDTO content = new ContentDTO();
		
		String domain = request.getParameter("domain");
		String userid = request.getParameter("userid");
		String title = request.getParameter("title");
		String text = request.getParameter("content");
		String files = "";
		
		// Part API 이용하여 다중 파일 업로드 구현
		// 서블릿 3.0 이상 / 공식문서: https://tomcat.apache.org/tomcat-7.0-doc/servletapi/javax/servlet/http/Part.html
		
		List<Part> partList = (List<Part>)request.getParts(); // getParts 메소드는 Collection 타입으로 반환되기 때문에 List로 캐스팅 
		String filePath = getServletContext().getRealPath("/") + "upload\\content";
		
		int cnt = 1;
		
		for(int i=0; i<partList.size(); i++) {
			Part part = partList.get(i);
			
			if(!part.getName().equals("contentImg")) {	// input name이 contentImg가 아니면 컨티뉴
				continue;
			}
			
			if(part.getSubmittedFileName().equals("")) {	// 파일 이름이 없으면(즉 업로드가 안됐으면) 컨티뉴
				continue;
			}
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREA);
			String date = dateFormat.format(new Date());
			
			String originName = part.getSubmittedFileName(); // 업로드한 파일이름 추출
			String nameArr[] = originName.split("\\.");
			String extension = nameArr[1]; // .을 기준으로 분리하여 파일 확장자 추출
			String fileName = userid + "_" + date + "_" + cnt + "." + extension; // 파일명 userid_date_cnt.extention
			
			files += fileName + "/";
			
			part.write(filePath + "\\" + fileName); // 서버에 파일 업로드
			
			cnt++;
		}
		
		content.setBoardId(domain);
		content.setUserId(userid);
		content.setTitle(title);
		content.setContent(text);
		content.setFiles(files);
		
		int contentId = dao.insertContent(content);
		
		request.setAttribute("contentId", contentId);
	}
	
	private void requestGetContent(HttpServletRequest request) {
		ContentDAO contentDao = ContentDAO.getInstance();
		ContentDTO content = new ContentDTO();
		BoardDAO boardDao = BoardDAO.getInstance();
		BoardDTO board = new BoardDTO();
		UserDAO userDao = UserDAO.getInstance();
		UserDTO user = new UserDTO();
		
		int contentId = 0;
		
		if(request.getAttribute("contentId") != null) {
			contentId = (int)request.getAttribute("contentId");
		} else {
			contentId = Integer.parseInt(request.getParameter("contentId"));
		}
		
		content = contentDao.getContent(contentId);
		board = boardDao.getUserBoard(content.getBoardId());
		user = userDao.getUser(content.getUserId(), null);
		
		request.setAttribute("ContentInfo", content);
		request.setAttribute("BoardInfo", board);
		request.setAttribute("WriterInfo", user);
	}
	
	private void requestEditContent(HttpServletRequest request) throws ServletException, IOException {
		ContentDAO dao = ContentDAO.getInstance();
		ContentDTO content = new ContentDTO();
		
		String domain = request.getParameter("domain");
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		String userid = request.getParameter("userid");
		String title = request.getParameter("title");
		String text = request.getParameter("content");
		
		String files = "";
		
		if(request.getParameter("filesLength") != null) {
			int fileCnt = Integer.parseInt(request.getParameter("filesLength"));
			
			for(int i=1; i<=fileCnt; i++) {
				if(request.getParameter("originImg" + i) != null) {
					files += request.getParameter("originImg" + i) + "/";
				}
			}
		}
		
		List<Part> partList = (List<Part>)request.getParts();
		String filePath = getServletContext().getRealPath("/") + "upload\\content";
		
		int cnt = 1;
		
		if(!files.equals("")) {
			cnt = files.split("/").length + 1;
		}
		
		for(int i=0; i<partList.size(); i++) {
			Part part = partList.get(i);
			
			if(!part.getName().equals("contentImg")) {
				continue;
			}
			
			if(part.getSubmittedFileName().equals("")) {
				continue;
			}
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREA);
			String date = dateFormat.format(new Date());
			
			String originName = part.getSubmittedFileName();
			String nameArr[] = originName.split("\\.");
			String extension = nameArr[1];
			String fileName = userid + "_" + date + "_" + cnt + "." + extension;
			
			files += fileName + "/";
			
			part.write(filePath + "\\" + fileName);
			
			cnt++;
		}
		
		content.setBoardId(domain);
		content.setContentId(contentId);
		content.setUserId(userid);
		content.setTitle(title);
		content.setContent(text);
		content.setFiles(files);
		
		dao.updateContent(content);
		
		request.setAttribute("contentId", contentId);
	}
	
	private void requestDeleteContent(HttpServletRequest request) {
		ContentDAO dao = ContentDAO.getInstance();
		ContentDTO content = new ContentDTO();
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		
		// 업로드 파일 삭제
		content = dao.getContent(contentId);
		String files[] = content.getFiles().split("/");
		String filePath = getServletContext().getRealPath("/") + "upload\\content";
		
		for(int i=0; i<files.length; i++) {
			File file = new File(filePath + "\\" + files[i]);
			file.delete();
		}
		
		dao.deleteContent(contentId);
	}
}
