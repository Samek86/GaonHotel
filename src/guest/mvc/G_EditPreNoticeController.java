package guest.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import guest.common.DBSQL_re;
import guest.common.DBbean_bo;


public class G_EditPreNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_EditPreNoticeController() { super();  }

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
			String nn=request.getParameter("num2");
			DBSQL_re dbsql=new DBSQL_re();
			DBbean_bo pre=dbsql.boardNoticeDetail(nn);
			request.setAttribute("hey", pre);
			request.setAttribute("pageFile", "guest/G_guestNoticeEdit.jsp");
			RequestDispatcher dis=request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
		}catch(Exception ex){  System.out.println("수정페이지 실패"+ex.toString());
		HttpSession session = request.getSession();
		session.setAttribute("error", ex.toString());
		System.out.println(ex);
		response.sendRedirect("./errorpage/error404.jsp");
		}  
	}//user END
}//class END
