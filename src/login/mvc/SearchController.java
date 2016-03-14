package login.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.common.DB;
import login.common.DBSQL;
import login.common.DBbean;

public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchController() {super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doGet(request, response)호출");	
	} //end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doPost(request, response)호출");
	} //end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		try{
			String data1= request.getParameter("id");
			String notice = "";
			
			DBSQL dbsql=new DBSQL();
			DBbean bean=new DBbean();
			bean.setId(data1);
				
				int ok=dbsql.checkID(data1);
				if(ok>0){notice="아이디 중복입니다";}
				else{	
					if(data1.equals("")){
						notice="공백입니다.";
					}
					else if( data1.length()<1 || data1.length()>12){ //TODO
						notice="1~12자리로";
					}else if(data1.length()>=4 || data1.length()<=12){
						for(int i = 0; i<data1.length(); i++){
							char check = data1.charAt(i);
							if((check< 48 || check > 57) && (check< 97 || check > 112) && (check< 65 || check > 90)){
								notice="영문, 숫자만 가능";
							}else{
								notice="사용가능합니다";	String id=data1;  request.setAttribute("id", id);
							}
						}
					}
				
				}
			
			request.setAttribute("pageFile", "login/join.jsp");
			request.setAttribute("notice", notice);
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
			dis.forward(request, response);
			
		}catch(Exception ex){	System.out.println("가입실패");	
		
		HttpSession session = request.getSession();
		session.setAttribute("error", ex.toString());
		System.out.println(ex);
		response.sendRedirect("./errorpage/error404.jsp");
		}
	} //end
} //class end
