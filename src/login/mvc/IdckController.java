package login.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.common.DBSQL;
import login.common.DBbean;

public class IdckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

   // public IdckController() {super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	} //end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	//PrintWriter out=response.getWriter();
	try{
		String id= request.getParameter("ID");
		String pw= request.getParameter("PW");
		String msg = "";
		DBSQL dbsql=new DBSQL();
		DBbean bean=new DBbean();
		bean.setId(id);
		bean.setPw(pw);
		
		//TODO sql 수정해서 이름 받아오기
		String nowname = "";
		int ok = dbsql.dbSearch(id ,pw);
		HttpSession session = request.getSession();
		if(ok==0){msg="존재하지 않는 아이디입니다";
			session.setAttribute("nowpage", "\".nowlogin\"");
			request.setAttribute("login", "login/login.jsp");
			request.setAttribute("msg", msg);
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
		}
		if(ok==1){msg="비밀번호가 잘못되었습d니다";
			session.setAttribute("nowpage", "\".nowlogin\"");
			request.setAttribute("login", "login/login.jsp");
			request.setAttribute("msg", msg);
			request.setAttribute("id", id);
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
		}
		if(ok==2){
			String page = (String)session.getAttribute("page");
			//pageFile에서 앞부분만 빼와서 밑에 넣기
			if(page==null){page="main/main.jsp";}
			session.setAttribute("nowpage", "\".now"+page.substring(0, page.indexOf("/"))+"\"");
			request.removeAttribute("login");
			request.setAttribute("pageFile", page);

			String name = dbsql.dbSelectNowName(id);
			session.setAttribute("NowName", name);
			session.setAttribute("NowUser", id);
			session.setAttribute("revid", id);
			//session.setAttribute("nowname", nowname);
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
		}
		}catch(Exception ex){
			HttpSession session = request.getSession();
			session.setAttribute("error", ex.toString());
			System.out.println(ex);
			response.sendRedirect("./errorpage/error404.jsp");
			
		}
	} //end
} //class end
