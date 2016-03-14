package reservation.mvc;

import reservation.common.revDBbean;
import reservation.common.revDBsql;
import rooms.common.roomDBbean;
import rooms.common.roomDBsql;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Reservationcontroller_notDB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String from, to, adult, children;
		request.setAttribute("pageFile", "reservation/reservation_notDB.jsp");
		
		try {
			from = (String)request.getParameter("from");	
			to = (String)request.getParameter("to");	
			HttpSession session = request.getSession();
			session.setAttribute("nowpage", "\".nowreservation\"");
			
					if(from!=null||to!=null){
						adult = (String)request.getParameter("adult");	
						children = (String)request.getParameter("children");
					}
					else{
						from = (String)session.getAttribute("from");
						to = (String)session.getAttribute("to");
						adult = (String)session.getAttribute("adult");
						children = (String)session.getAttribute("children");
					}
			session.setAttribute("from", from);
			session.setAttribute("to", to);
			session.setAttribute("adult", adult);
			session.setAttribute("children", children);
			session.setAttribute("page", "reservation/reservation_notDB.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
			
		} catch (Exception e) {
		}
	}//end

}//class END

