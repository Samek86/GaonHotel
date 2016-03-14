package admin.mvc;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.common.DBSQL;

public class adminReservationListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String where;
	private String returnPage;
	private String pnum;
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
			pnum=request.getParameter("pageNUM");
			String skey=request.getParameter("keyfield");
			String sval=request.getParameter("keyword");
			if(sval==null||skey==null){
				where="where revname like '%%'";
				returnPage="";
			}else{
				where="where "+skey+" like '%"+sval+"%'";
				returnPage="&keyfield="+skey+"&keyword="+sval;
				}
				DBSQL dbsql=new DBSQL();
				int total=dbsql.total(where);
				List member=dbsql.dbSelectReservation(pnum, where);
				
				request.setAttribute("adminReserList", member);
				request.setAttribute("pnum", pnum);
				request.setAttribute("total", total);
				request.setAttribute("returnPage", returnPage);
				request.setAttribute("pageFile", "admin/adminReservationList.jsp");
				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
				dis.forward(request, response);
			}catch(Exception ex){  System.out.println("목록보기실패"+ex.toString());
			HttpSession session = request.getSession();
			session.setAttribute("error", ex.toString());
			response.sendRedirect("./errorpage/error404.jsp");
			} 
	}
}
