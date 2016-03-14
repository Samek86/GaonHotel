package member.mvc;

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

import member.common.DBSQL;

public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String where;
	private String returnPage;
	private String pnum;
       
    public memberController() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		try{
		pnum=request.getParameter("pageNUM");
		String skey=request.getParameter("keyfield");
		String sval=request.getParameter("keyword");
		if(sval==null||skey==null){
			where="where name like '%%'";
			returnPage="";
		}else{
			where="where "+skey+" like '%"+sval+"%'";
			returnPage="&keyfield="+skey+"&keyword="+sval;}
		
			DBSQL dbsql=new DBSQL();
			int total=dbsql.total(where);
			List member=dbsql.dbSelect(pnum, where);
			
			request.setAttribute("member", member);
			request.setAttribute("pnum", pnum);
			request.setAttribute("total", total);
			request.setAttribute("returnPage", returnPage);
			request.setAttribute("pageFile", "member/member.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
		}catch(Exception ex){  System.out.println("목록보기실패"+ex.toString());
		HttpSession session = request.getSession();
		session.setAttribute("error", ex.toString());
		response.sendRedirect("./errorpage/error404.jsp");
		}  
	}//user END
}//class END
