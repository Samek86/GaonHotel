package reservation.mvc;

import reservation.common.revDBbean;
import reservation.common.revDBsql;
import rooms.common.roomDBbean;
import rooms.common.roomDBsql;

import login.common.DBSQL;
import login.common.DBbean;
import mail.common.MailBean;
import mail.common.SMTP;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class checkrevController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}// end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		revDBsql revsql = new revDBsql();
		DBSQL loginsql = new DBSQL();
		int revnum=0;
		HttpSession session = request.getSession();
		try {
			String NowUser = (String) session.getAttribute("NowUser");
			String email = (String)loginsql.IdToEmail(NowUser);
			String revnumber = (String.valueOf(request.getParameter("revnum")));
			if(request.getParameter("revnum")==null||request.getParameter("revnum").equals("")){revnum=0;}
			else{revnum=Integer.parseInt(revnumber);}
			List<revDBbean> revList = (List<revDBbean>)revsql.revUserList(email);
			if(revList==null){
				request.setAttribute("pageFile", "reservation/notrev.jsp");
				session.setAttribute("nowpage", "\".nowreservation\"");
				session.setAttribute("page", "reservation/notrev.jsp");
				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
				dis.forward(request, response);
			}
			session.setAttribute("revList", revList); 
			request.setAttribute("pageFile", "reservation/checkrev.jsp");
			session.setAttribute("nowpage", "\".nowreservation\"");
			session.setAttribute("page", "reservation/checkrev.jsp");
			request.setAttribute("revnum", revnum);
			session.setAttribute("revnum", revnum);
			
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
			
			
		} catch (Exception e) {
			request.setAttribute("pageFile", "reservation/notrev.jsp");
			session.setAttribute("nowpage", "\".nowreservation\"");
			session.setAttribute("page", "reservation/notrev.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
		}
	}// end

}// class END
