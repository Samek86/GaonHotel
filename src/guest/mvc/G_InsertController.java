package guest.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import guest.common.DBSQL_re;
import guest.common.DBbean_bo;


public class G_InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_InsertController() { super();  }

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
			DBSQL_re dbsql=new DBSQL_re();
			DBbean_bo bean=new DBbean_bo();

			String data1=request.getParameter("title");
			String data2=request.getParameter("contents");
			String data4=request.getParameter("writer");
			String data5=request.getParameter("keytype");
			String data6=request.getParameter("star");
			//System.out.println(data6);
			if (data5.equals("notice")){
				bean.setTitle(data1);
				bean.setContent(data2);
				bean.setWriter(data4);
				bean.setType(data5);
				
				int ok=dbsql.boardNotcieInsert(bean);
				if(ok>0){
					out.println("�� ��ϿϷ�");
					response.sendRedirect("./G_guest.do");
				}//if END
			}else{
					
				int rate=Integer.parseInt(data6);
				bean.setTitle(data1);
				bean.setContent(data2);
				bean.setWriter(data4);
				bean.setType(data5);
				bean.setRate(rate);
				
				int ok=dbsql.boardInsert(bean);
				if(ok>0){
					out.println("�� ��ϿϷ�");
					response.sendRedirect("./G_guest.do");
				}//if END
			}
			
		}catch(Exception ex){  System.out.println("�� ��Ͻ���");
		HttpSession session = request.getSession();
		session.setAttribute("error", ex.toString());
		System.out.println(ex);
		response.sendRedirect("./errorpage/error404.jsp");
		}  
	}//user END
}//class END
