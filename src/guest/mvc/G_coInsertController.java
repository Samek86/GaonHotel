package guest.mvc;

import guest.common.DBSQL_co;


import guest.common.DBSQL_re;
import guest.common.DBbean_bo;
import guest.common.DBbean_rep;


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


public class G_coInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_coInsertController() { super();  }

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
			String data1=request.getParameter("num");
			String data2=request.getParameter("rewriter");
			String data3=request.getParameter("recontent");
			String data4=request.getParameter("pnum");
			DBSQL_co dbsql=new DBSQL_co();
			DBbean_rep bean=new DBbean_rep();			
						
			bean.setNum(Integer.parseInt(data1));
			bean.setRewriter(data2);		
			bean.setRecontent(data3);
			DBSQL_re dbsql2 = new DBSQL_re();
			DBbean_bo aa=dbsql2.boardDetail(data1);
			
			HttpSession s = request.getSession();
			String user = (String)s.getAttribute("NowUser");
			if(user==null || user=="" || user=="guest"){
				out.println("<script type='text/javascript'>");
				out.println("alert('글쓰기 권한이 없습니다. 로그인후 이용하세요.')");
				out.println("location.href='./G_guestDetail.do?num="+data1+"&pageNUM="+data4+"'");
				out.println("</script>");
				
			}else{
				int ok=dbsql.coInsert(bean, data1);
				if(ok>0){
					request.setAttribute("detail", aa);
					RequestDispatcher dis=request.getRequestDispatcher("./G_guestDetail.do");
					dis.forward(request, response);
				}//if END
			}			
		}catch(Exception ex){  System.out.println("글 등록실패");
		
		HttpSession session = request.getSession();
		session.setAttribute("error", ex.toString());
		System.out.println(ex);
		response.sendRedirect("./errorpage/error404.jsp");}  
	}//user END
}//class END
