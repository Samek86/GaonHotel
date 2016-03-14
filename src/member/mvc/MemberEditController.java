package member.mvc;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.common.DBSQL;
import member.common.DBbean;

public class MemberEditController extends HttpServlet {
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
		try{
			HttpSession session = request.getSession();
			DBbean bean = new DBbean();
			DBSQL sql = new DBSQL() ;
			bean.setPw(new String(request.getParameter("password2").getBytes("ISO-8859-1"),"UTF-8"));
			bean.setName(new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8"));
			bean.setZipcode(new String(request.getParameter("zipcode").getBytes("ISO-8859-1"), "UTF-8"));
			bean.setAddr1(new String(request.getParameter("addr1").getBytes("ISO-8859-1"), "UTF-8"));
			bean.setAddr2(new String(request.getParameter("addr2").getBytes("ISO-8859-1"), "UTF-8"));
			bean.setEmail(new String(request.getParameter("email").getBytes("ISO-8859-1"), "UTF-8"));
			bean.setTel(new String(request.getParameter("tel").getBytes("ISO-8859-1"), "UTF-8"));
			sql.dbUpdate((String)session.getAttribute("NowUser"),bean);
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
			
			
		}catch(Exception ex){ex.printStackTrace();
		HttpSession session = request.getSession();
		session.setAttribute("error", ex.toString());
		System.out.println(ex);
		response.sendRedirect("./errorpage/error404.jsp");
		}
	}
}
