package guest.mvc;

import guest.common.DBSQL_re;
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


public class G_EditNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_EditNoticeController() { super();  }

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
			int data=Integer.parseInt(request.getParameter("num"));
			String data1=request.getParameter("title");
			String data2=request.getParameter("contents");
			
			DBSQL_re dbsql=new DBSQL_re();
			DBbean_bo bean=new DBbean_bo();
			
			bean.setNum(data);
			bean.setTitle(data1);
			bean.setContent(data2);
			
			int ok=dbsql.dbNoticeEdit(bean);
			if(ok>0){ System.out.println("수정 성공"); }
			DBbean_bo aa=dbsql.boardNoticeDetail(request.getParameter("num"));
			request.setAttribute("notice", aa);
			
			request.setAttribute("pageFile", "guest/G_guestNoticeDetail.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
					
		}catch(Exception ex){  System.out.println("수정페이지 실패"+ex.toString()); 
		HttpSession session = request.getSession();
		session.setAttribute("error", ex.toString());
		System.out.println(ex);
		response.sendRedirect("./errorpage/error404.jsp");
		}  
	}//user END
}//class END
