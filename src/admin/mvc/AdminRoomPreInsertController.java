package admin.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.common.DBSQL;
import admin.common.DBbean;

public class AdminRoomPreInsertController extends HttpServlet {
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
		
		PrintWriter out = response.getWriter();
		DBSQL dbsql = new DBSQL();
		System.out.println(request.getParameter("selectRoomType"));
		if(request.getParameter("selectRoomType") != null) {
			DBbean bean = dbsql.dbSelectRoomDistinct(request.getParameter("selectRoomType"));
			StringBuilder sb = new StringBuilder();
			sb.append("{");
			sb.append("\"roomType\": \""+ bean.getRoomType() + "\"").append(", ");
			sb.append("\"roomSort\": \""+ bean.getRoomSort() + "\"").append(", ");
			sb.append("\"roomName\": \""+ bean.getRoomName() + "\"").append(", ");
			sb.append("\"roomCost\": \""+ bean.getRoomCost() + "\"").append(", ");
			sb.append("\"roomMax\": \""+ bean.getRoomMax() + "\"").append(", ");
			sb.append("\"roomText\": \""+ bean.getRoomText() + "\"").append(", ");
			sb.append("\"roomImg1\": \""+ bean.getRoomImg1() + "\"").append(", ");
			sb.append("\"roomImg2\": \""+ bean.getRoomImg2() + "\"").append(", ");
			sb.append("\"roomImg3\": \""+ bean.getRoomImg3() + "\"");
			sb.append("}");
			System.out.println(sb.toString());
			out.print(sb.toString());
			return;
		}
		request.setAttribute("adminRoomPreInsertRoomType", dbsql.dbSelectRoomType());
		HttpSession session = request.getSession();
		session.setAttribute("nowpage", "\".nowlogin\"");
		request.setAttribute("pageFile", "admin/adminRoomInsert.jsp");
		RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
		dis.forward(request, response);
	}
}
