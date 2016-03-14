package reservation.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class indexcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session.removeAttribute("from");
		session.removeAttribute("to");
		session.removeAttribute("adult");
		session.removeAttribute("children");
		session.removeAttribute("nowpage");
		session.removeAttribute("page");
		request.setAttribute("email", "send");
		response.sendRedirect("./index.jsp?email=send");
	}//end

}//class END

