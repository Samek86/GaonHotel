package mail.mvc;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mail.common.MailBean;
import mail.common.SMTP;


public class Mailcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Mailcontroller() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("EditPreController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("EditPreController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		MailBean bean = new MailBean();
		try{
			
			bean.setName(request.getParameter("�̸�"));
			bean.setEmail("gaonhotel16@gmail.com");//�������
			bean.setToemail(request.getParameter("�̸���"));//������ ��� �̸���
			bean.setTel(request.getParameter("�޴���"));
			bean.setTitle(request.getParameter("����"));
			bean.setText("������ ��� : "+request.getParameter("�̸���") + request.getParameter("����"));
			SMTP smtp = new SMTP();
			smtp.send(bean);
			request.setAttribute("email", "send");
			RequestDispatcher dis=request.getRequestDispatcher("index.do?email=send");
			dis.forward(request, response);
		}catch(Exception ex){  System.out.println("mailcontroller error"+ex.toString()); 
		HttpSession session = request.getSession();
		session.setAttribute("error", ex.toString());
		System.out.println(ex);
		response.sendRedirect("./errorpage/error404.jsp");
		}  
	}//user END
}//class END
