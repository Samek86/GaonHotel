package contact.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Contactcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session.setAttribute("nowpage", "\".nowcontact\"");
		session.setAttribute("page", "contact/contact.jsp");
		request.setAttribute("pageFile", "contact/contact.jsp");
		RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
		dis.forward(request, response);
	}//end

}//class END

