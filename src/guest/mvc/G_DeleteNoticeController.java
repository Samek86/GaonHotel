package guest.mvc;

import guest.common.DBSQL_re;

import guest.common.DBbean_rep;
import guest.common.DBbean_bo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class G_DeleteNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_DeleteNoticeController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			String num=request.getParameter("num").trim();
			
			DBSQL_re dbsql=new DBSQL_re();
			DBbean_bo bean=new DBbean_bo();
			
			dbsql.dbNoticeDelete(num);
			response.sendRedirect("./G_guest.do");	
					
		}catch(Exception ex){  System.out.println("수정페이지 실패"+ex.toString()); 
		HttpSession session = request.getSession();
		session.setAttribute("error", ex.toString());
		System.out.println(ex);
		response.sendRedirect("./errorpage/error404.jsp");
		}  
	}//user END
}//class END
