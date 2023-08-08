package mvc.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.user.model.UserDAO;
import mvc.user.model.UserDTO;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		if(command.equals("/pages/account/signup")) {
			RequestDispatcher rd = request.getRequestDispatcher("MyProject/pages/account/signupForm.jsp");
			rd.forward(request, response);
		} else if(command.equals("/pages/account/signupSend")) {
			requestSignUp(request);
			RequestDispatcher rd = request.getRequestDispatcher("MyProject/pages/account/signupResult.jsp");
			rd.forward(request, response);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	private void requestSignUp(HttpServletRequest request) throws IOException {
		UserDAO dao = UserDAO.getInstance();
		UserDTO dto = new UserDTO();
		
		String filePath = getServletContext().getRealPath("/") + "upload/profile";
		int fileSize = 5 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(request, filePath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String id = multi.getParameter("id");
		String pw = multi.getParameter("pw");
		String nickname = multi.getParameter("nickname");
		String imgPath = "";
		
		Enumeration file = multi.getFileNames();
		if(file.nextElement() != null) {
			String fileName = multi.getOriginalFileName("profileImg");
			
			//파일 확장자 추출
			String nameArr[] = fileName.split("\\.");
			String extension = nameArr[1];
			
			String oldFilePath = filePath + "\\" + fileName;
			String newFilePath = filePath + "\\" + id + "_img." + extension;
			
			File oldFile = new File(oldFilePath);
			File newFile = new File(newFilePath);
			
			if(newFile.exists()) {
				newFile.delete();
			}
			
			oldFile.renameTo(newFile);
			imgPath = newFilePath;
		}
		
		dto.setId(id);
		dto.setPw(pw);
		dto.setNickname(nickname);
		dto.setProfileImg(imgPath);
		
		dao.insertUser(dto);
	}
}
