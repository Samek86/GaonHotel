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


public class G_DetailNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_DetailNoticeController() { super();  }

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
			HttpSession session = request.getSession();
			String data=request.getParameter("num");
			String pnum = request.getParameter("pageNUM");
			DBSQL_re dbsql=new DBSQL_re(); 
			DBbean_bo notice=dbsql.boardNoticeDetail(data);
						
			request.setAttribute("notice", notice);
			session.setAttribute("notice", notice);
			request.setAttribute("num", data);
			request.setAttribute("pnum", pnum);
			
			request.setAttribute("pageFile", "guest/G_guestNoticeDetail.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
		}catch(Exception ex){  System.out.println("목록보기실패"+ex.toString()); 
			HttpSession session2 = request.getSession();
			session2.setAttribute("error", ex.toString());
			System.out.println(ex);
			response.sendRedirect("./errorpage/error404.jsp");
		}  
	}//user END
}//class END
