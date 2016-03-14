package admin.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.common.DBSQL;

public class AdminRoomListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
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
		
		DBSQL dbsql = new DBSQL();
		request.setAttribute("adminRoomList", dbsql.dbSelectRoom());
		HttpSession session = request.getSession();
		session.setAttribute("nowpage", "\".nowlogin\"");
		request.setAttribute("pageFile", "admin/adminRoomList.jsp");
		RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
		dis.forward(request, response);
	}
}
