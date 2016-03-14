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


public class Reservationcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String from, to, adult, children, nights;
		
		try {
			request.setAttribute("pageFile", "reservation/reservation.jsp");
			from = (String)request.getParameter("from");	
			to = (String)request.getParameter("to");	
			HttpSession session = request.getSession();
			session.setAttribute("nowpage", "\".nowreservation\"");
			List<revDBbean> revlist = null;
			
					if(from!=null||to!=null){
						adult = (String)request.getParameter("adult");	
						children = (String)request.getParameter("children");
						//nights = (String)request.getParameter("nights");
						revDBsql rev=new revDBsql();
						revlist = rev.revcheck(from, to);//예약가능한방목록
						roomDBsql roomDB = new roomDBsql();
						List<roomDBbean> remind = roomDB.remindRoom(from, to);
						List<roomDBbean> booked = roomDB.bookedRoom(from, to);
						session.setAttribute("remind", remind);//예약가능한방종류 -3개출력
						session.setAttribute("booked", booked);//예약불가능한방종류 - 1개출력
					}
					else{
						from = (String)session.getAttribute("from");
						to = (String)session.getAttribute("to");
						adult = (String)session.getAttribute("adult");
						children = (String)session.getAttribute("children");
						nights = (String)session.getAttribute("nights");
						revlist = (List)session.getAttribute("revlist");
					}
			roomDBsql rd=new roomDBsql();
			List<roomDBbean> roomlist = rd.roomList();
			session.setAttribute("roomlist", roomlist);//전체 룸 정보 - 4개출력
			session.setAttribute("revlist", revlist);//예약가능한 방정보 모두 12/16개출력
			session.setAttribute("from", from);
			session.setAttribute("to", to);
			session.setAttribute("adult", adult);
			session.setAttribute("children", children);
			//session.setAttribute("nights", nights);
			session.setAttribute("page", "reservation/reservation.jsp");
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

