package guest.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class G_InsertPreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_InsertPreController() { super();  }
    
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
		//System.out.println("insertprecontroller ok");
		
		try{
			String data1=request.getParameter("num");
			String data2=request.getParameter("pageNUM");
			HttpSession s = request.getSession();
			String user = (String)s.getAttribute("NowUser");
			if(user==null || user==""){
				if(data1==null || data2==null){
					out.println("<script type='text/javascript'>");
					out.println("alert('글쓰기 권한이 없습니다. 로그인후 이용하세요.')");
					out.println("location.href='./G_guest.do'");
					out.println("</script>");
				}else{
					out.println("<script type='text/javascript'>");
					out.println("alert('게시글이 삭제되었습니다.')");
					out.println("location.href='./G_guestDetail.do?num="+data1+"&pageNUM="+data2+"'");
					out.println("</script>");
				}
				
			}else{
				request.setAttribute("pageFile", "guest/G_guestInsert.jsp");
				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
				dis.forward(request, response);
			}
		
		}catch(Exception ex){  System.out.println("글쓰기페이지 실패"+ex.toString()); 
		HttpSession session = request.getSession();
		session.setAttribute("error", ex.toString());
		System.out.println(ex);
		response.sendRedirect("./errorpage/error404.jsp");
		}  
	}//user END
}//class END
