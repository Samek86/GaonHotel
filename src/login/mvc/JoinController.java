package login.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.common.DBSQL;
import login.common.DBbean;

public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

   public JoinController() {super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("2doGet(request, response)호출");	
	} //end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("2doPost(request, response)호출");
	} //end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		try{
			DBSQL dbsql = new DBSQL();
			DBbean bean = new DBbean();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String day = request.getParameter("day");
			
			java.util.Date tempDate = sdf.parse(year + "-" + month + "-" + day);
			java.sql.Date date = new java.sql.Date(tempDate.getTime());
			bean.setId(new String(request.getParameter("id").getBytes("ISO-8859-1"), "UTF-8"));
			bean.setPw(new String(request.getParameter("password1").getBytes("ISO-8859-1"), "UTF-8"));
			bean.setName(new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8"));
			bean.setBirth(date);
			
			bean.setZipcode(new String(request.getParameter("zipcode").getBytes("ISO-8859-1"), "UTF-8"));
			bean.setAddr1(new String(request.getParameter("addr1").getBytes("ISO-8859-1"), "UTF-8"));
			bean.setAddr2(new String(request.getParameter("addr2").getBytes("ISO-8859-1"), "UTF-8"));
			bean.setEmail(new String(request.getParameter("email").getBytes("ISO-8859-1"), "UTF-8"));
			bean.setTel(new String(request.getParameter("tel").getBytes("ISO-8859-1"), "UTF-8"));
			int ok=dbsql.dbInsert(bean);
			if(ok>0){
				request.setAttribute("pageFile", "main/main.jsp");
				HttpSession session = request.getSession();
				//session.setMaxInactiveInterval(10); // 10초
				session.setAttribute("NowUser", request.getParameter("id"));
				session.setAttribute("NowName", new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8"));
				session.setAttribute("nowpage", "\".nowhome\"");
				session.setAttribute("page", "main/main.jsp");
				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
				dis.forward(request, response);
			}
		}catch(Exception ex){	System.out.println("가입실패");	
		HttpSession session = request.getSession();
		session.setAttribute("error", ex.toString());
		System.out.println(ex);
		response.sendRedirect("./errorpage/error404.jsp");}
	} //end
} //class end
