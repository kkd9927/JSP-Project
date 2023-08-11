package mvc.content.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import mvc.board.model.BoardDAO;
import mvc.board.model.BoardDTO;
import mvc.content.model.ContentDAO;
import mvc.content.model.ContentDTO;

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
			RequestDispatcher rd = request.getRequestDispatcher("contentWriteForm.jsp");
			rd.forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	private void requestWriteContent(HttpServletRequest request) throws IOException {
		ContentDAO contentDao = ContentDAO.getInstance();
		ContentDTO content = new ContentDTO();
		BoardDAO boardDao = BoardDAO.getInstance();
		BoardDTO board = new BoardDTO();
		
		String filePath = getServletContext().getRealPath("/") + "upload\\board";
		int fileSize = 5 * 1024 * 1024;
		
		String domain = request.getParameter("domain");
		String title = request.getParameter("title");
		String text = request.getParameter("content");
		
		Part part = request.getPart("contentImg");
		
		String contentImgName;
	}
}
