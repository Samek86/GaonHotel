package guest.mvc;

import guest.common.DBSQL_co;
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


public class G_ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String sql3;
	private String returnPage;
       
    public G_ListController() { super();  }

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
			String pnum=request.getParameter("pageNUM");
			String keyt=request.getParameter("keytype");
			String keyf=request.getParameter("keyfield");
			String keyw=request.getParameter("keyword");
			
			if(pnum==null) { pnum="1";}
			if(keyf==null || keyw==null){
				keyf="writer"; keyw="";
			}
			if(keyt==null || keyt=="all") keyt="";
			
			String returnpage="&keytype="+keyt+"&keyfield="+keyf+"&keyword="+keyw;
			
			DBSQL_re dbsql=new DBSQL_re();
			int total=dbsql.total();
			int sub=dbsql.subtotal(keyt,keyf,keyw);
			List ob=dbsql.boardSelect(pnum,keyf,keyw,keyt);	
			List notice=dbsql.boardNoticeSelect();
			HttpSession session = request.getSession();			
			
			session.setAttribute("notice", notice);
			request.setAttribute("notice", notice);
			request.setAttribute("hotel", ob);
			request.setAttribute("total", total);
			request.setAttribute("sub", sub);
			request.setAttribute("returnpage", returnpage);
			
			session.setAttribute("nowpage", "\".nowguest\"");
			request.setAttribute("pageFile", "guest/G_guest.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
		}catch(Exception ex){  System.out.println("목록보기실패"+ex.toString());
		
		HttpSession session = request.getSession();
		session.setAttribute("error", ex.toString());
		System.out.println(ex);
		response.sendRedirect("./errorpage/error404.jsp");
		}  
	}//user END
}//class END
