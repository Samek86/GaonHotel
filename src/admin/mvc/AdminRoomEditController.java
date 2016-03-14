package admin.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.common.DBSQL;
import admin.common.DBbean;

public class AdminRoomEditController extends HttpServlet {
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
		
		/*
<tr><td><input class="input" type="text" name="roomID" placeholder="°´½Ç ¹øÈ£" value="<%= bean.getRoomID() %>"></td></tr>
<tr><td><input class="input" type="text" name="roomType" placeholder="°´½Ç À¯Çü" value="<%= bean.getRoomType() %>"></td></tr>
<tr><td><input class="input" type="text" name="roomName" placeholder="°´½Ç ÀÌ¸§" value="<%= bean.getRoomName() %>"></td></tr>
<tr><td><input class="input" type="text" name="roomCost" placeholder="°´½Ç 1¹Ú´ç °¡°Ý" value="<%= bean.getRoomCost() %>"></td></tr>
<tr><td><input class="input" type="text" name="roomMax" placeholder="°´½Ç ÃÖ´ë ÀÎ¿ø" value="<%= bean.getRoomMax() %>"></td></tr>
<tr><td><input class="input" type="text" name="roomText" placeholder="°´½Ç ¼³¸í" value="<%= bean.getRoomText() %>"></td></tr>
<tr><td><input class="input" type="file" name="roomImg1" placeholder="°´½Ç ÀÌ¹ÌÁö1" value="<%= bean.getRoomImg1() %>"></td></tr>
<tr><td><input class="input" type="file" name="roomImg2" placeholder="°´½Ç ÀÌ¹ÌÁö2" value="<%= bean.getRoomImg2() %>"></td></tr>
<tr><td><input class="input" type="file" name="roomImg3" placeholder="°´½Ç ÀÌ¹ÌÁö3" value="<%= bean.getRoomImg3() %>"></td></tr>
		*/
		DBSQL dbsql = new DBSQL();
		DBbean bean = new DBbean();
		
		HttpSession session = request.getSession();
		session.setAttribute("nowpage", "\".nowlogin\"");
		RequestDispatcher dis = request.getRequestDispatcher("adminRoomList.do");
		dis.forward(request, response);
	}
}
