package rooms.mvc;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooms.common.roomDBbean;
import rooms.common.roomDBsql;

public class Roomcontroller_notDB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		request.setAttribute("pageFile", "rooms/room_notDB.jsp");

		HttpSession session = request.getSession();
		session.setAttribute("nowpage", "\".nowrooms\"");
		session.setAttribute("page", "rooms/room_notDB.jsp");
		session.setAttribute("NowName", "¡ÿ»£");
		session.setAttribute("NowUser", "junho");
		RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
		dis.forward(request, response);
		
	}//end

}//class END

