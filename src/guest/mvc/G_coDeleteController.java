package guest.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import guest.common.DBSQL_co;
import guest.common.DBbean_rep;


public class G_coDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_coDeleteController() { super();  }

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
			String data=request.getParameter("num");
			String data1=request.getParameter("conum");
			
			DBSQL_co dbsql=new DBSQL_co();
			DBbean_rep bean=new DBbean_rep();
			
			dbsql.coDelete(data1);
			request.setAttribute("num", data);
			
			RequestDispatcher dis=request.getRequestDispatcher("./G_guestDetail.do");
			dis.forward(request, response);
					
		}catch(Exception ex){  System.out.println("co_Delete ½ÇÆÐ"+ex.toString());
		HttpSession session = request.getSession();
		session.setAttribute("error", ex.toString());
		System.out.println(ex);
		response.sendRedirect("./errorpage/error404.jsp");
		}  
	}//user END
}//class END
