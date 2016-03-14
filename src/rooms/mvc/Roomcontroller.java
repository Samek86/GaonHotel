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

public class Roomcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		request.setAttribute("pageFile", "rooms/room.jsp");
		
		try {
			String roomType = request.getParameter("roomType");
			HttpSession session = request.getSession();
			session.setAttribute("roomType", roomType);
			session.setAttribute("nowpage", "\".nowrooms\"");
			session.setAttribute("page", "rooms/room.jsp");
			
			roomDBsql rd=new roomDBsql();
			List<roomDBbean> roomlist = rd.roomList();
			session.setAttribute("roomlist", roomlist);//전체 룸 정보 - 4개출력

			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
		} catch (Exception e) {
			HttpSession session = request.getSession();
			session.setAttribute("error", e.toString());
			System.out.println(e);
			response.sendRedirect("./errorpage/error404.jsp");
		}
		
	}//end

}//class END

