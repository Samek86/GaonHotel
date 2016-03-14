package admin.mvc;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.common.DBSQL;
import admin.common.DBbean;

public class AdminRoomInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
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
		
		try {
			int maxSize = 1024 * 1024 * 10;
			String savePath = request.getSession().getServletContext().getRealPath("/") + "rooms\\img\\";
			System.out.println(savePath);
			String roomImg1FileName = null;
			String roomImg2FileName = null;
			String roomImg3FileName = null;
			
			MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			if(mr.getFilesystemName("roomImg1File") != null) {
				roomImg1FileName = mr.getFilesystemName("roomImg1File");
				roomImg2FileName = mr.getFilesystemName("roomImg2File");
				roomImg3FileName = mr.getFilesystemName("roomImg3File");
				roomImg1FileName = new String(roomImg1FileName.getBytes("ISO-8859-1"), "UTF-8");
				roomImg2FileName = new String(roomImg2FileName.getBytes("ISO-8859-1"), "UTF-8");
				roomImg3FileName = new String(roomImg3FileName.getBytes("ISO-8859-1"), "UTF-8");
			}
			
			DBSQL dbsql = new DBSQL();
			DBbean bean = new DBbean();
			bean.setRoomID(Integer.parseInt(mr.getParameter("roomID")));
			bean.setRoomType(mr.getParameter("roomType"));
			bean.setRoomSort(mr.getParameter("roomSort"));
			bean.setRoomName(mr.getParameter("roomName"));
			bean.setRoomCost(Integer.parseInt(mr.getParameter("roomCost")));
			bean.setRoomMax(Integer.parseInt(mr.getParameter("roomMax")));
			bean.setRoomText(mr.getParameter("roomText"));
			bean.setRoomImg1(mr.getParameter("roomImg1"));
			bean.setRoomImg2(mr.getParameter("roomImg2"));
			bean.setRoomImg3(mr.getParameter("roomImg3"));
			System.out.println(bean.getRoomImg1());
			System.out.println(bean.getRoomImg2());
			System.out.println(bean.getRoomImg3());
			dbsql.dbInsert(bean);
		} catch(Exception e) {e.printStackTrace();}
		
		HttpSession session = request.getSession();
		session.setAttribute("nowpage", "\".nowlogin\"");
		RequestDispatcher dis = request.getRequestDispatcher("adminRoomList.do");
		dis.forward(request, response);
	}
}
