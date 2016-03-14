package member.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.common.DBSQL;
import member.common.DBbean;

public class MemberPreEditController extends HttpServlet {
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
		HttpSession session = request.getSession();
		DBbean bean = new DBbean();
		DBSQL sql = new DBSQL();
		bean = sql.dbSelectDetail((String)session.getAttribute("NowUser"));
		
		request.setAttribute("memberEdit", bean);
		request.setAttribute("pageFile", "member/memberEdit.jsp");
		RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
		dis.forward(request, response);
	}
}
