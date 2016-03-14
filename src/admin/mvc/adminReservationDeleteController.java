package admin.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.common.DBSQL;

public class adminReservationDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String where;
	private String returnPage;
	private String pnum;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ListController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ListController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		try{
			DBSQL dbsql=new DBSQL();
			int id=Integer.parseInt(request.getParameter("id"));
				dbsql.adminReserdbDelete(id);
					RequestDispatcher dis = request.getRequestDispatcher("adminReservationList.do");
					dis.forward(request, response);
			}catch(Exception ex){  System.out.println("목록삭제실패"+ex.toString());
			HttpSession session = request.getSession();
			session.setAttribute("error", ex.toString());
			response.sendRedirect("./errorpage/error404.jsp");
			} 
	}
}
