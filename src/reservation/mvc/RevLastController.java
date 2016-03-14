package reservation.mvc;

import reservation.common.revDBbean;
import reservation.common.revDBsql;
import rooms.common.roomDBbean;
import rooms.common.roomDBsql;

import login.common.DBSQL;
import login.common.DBbean;
import mail.common.MailBean;
import mail.common.SMTP;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RevLastController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}// end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String from="", to="", email="", name="", tel="";
		int adult=0, children=0, nights=0;
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		revDBbean revbean = new revDBbean();
		//roomDBsql roomsql = new roomDBsql();
		try {
			HttpSession session = request.getSession();
			int roomNum = Integer.parseInt(new String(request.getParameter("roomnumber").getBytes("ISO-8859-1"), "UTF-8"));
			int TotalCost = Integer.parseInt(request.getParameter("TotalCost"));
			String RoomName = new String(request.getParameter("roomName").getBytes("ISO-8859-1"), "UTF-8");
			nights = Integer.parseInt(request.getParameter("nights"));
			adult = Integer.parseInt((String) session.getAttribute("adult"));
			children = Integer.parseInt((String) session.getAttribute("children"));
			from = (String) session.getAttribute("from");
			to = (String) session.getAttribute("to");

			// TODO 로그인되었을 경우에는 정보가져와서 넣기
			String NowUser = (String) session.getAttribute("NowUser");
			if (NowUser != null) {
				DBSQL dbsql = new DBSQL();
				DBbean userbean = null;
				
				List<DBbean> userlist = (List<DBbean>)dbsql.revInfo(NowUser);
					for (int i = 0; i < userlist.size(); i++) { //4번 반복 null일 경우 사용
					userbean = (DBbean) userlist.get(i);
					email = userbean.getEmail();
					name = userbean.getName();
					tel = userbean.getTel();
					System.out.println(email+name+tel);
				}
			} else {
				email = request.getParameter("notloginEmail");
				name = new String(request.getParameter("notloginName").getBytes("ISO-8859-1"), "UTF-8");
				tel = request.getParameter("notloginTel");
			}
			revbean.setRevName(name);
			revbean.setRevEmail(email);
			revbean.setRevTel(tel);
			revbean.setRevRoomID(roomNum);
			revbean.setRevTotalCost(TotalCost*10000);
			revbean.setRevCap(adult + children);
			revbean.setRevIn(from);
			revbean.setRevOut(to);
			revbean.setRevTerm(nights);
			revbean.setRevRoomName(RoomName);

			revDBsql rev = new revDBsql();
			int ok = rev.revInsert(revbean);

			if (ok > 0) {
				request.setAttribute("email", "send");
				session.setAttribute("revbean", revbean); 
				request.setAttribute("pageFile", "reservation/revLast.jsp");
				session.setAttribute("nowpage", "\".nowreservation\"");
				session.setAttribute("page", "reservation/revLast.jsp");
				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp");
				dis.forward(request, response);

				StringBuilder sb = new StringBuilder();
				sb.append("<body style='margin: 0;padding: 0;'>	<div style='max-width: 500px;'>	<table style='width: 100%; height: 100%;	margin: 0; font-size: 12pt;' cellspacing='0'>");
				sb.append("<tr><th style='height: 150px;	text-align: center;	font-size: 36pt;color: #FFFFFF;	background-color: #2C3E50;' colspan='2'>GAON HOTEL</th></tr>");
				sb.append("<tr><th style='text-align: left;	padding : 5px 0px 5px 10px;	font-size: 13pt;border-bottom: 5px solid #E74C3C;background-color: #CFD9E4; color:#222;' colspan='2'>호텔 정보</th></tr>");
				sb.append("<tr> <td  style='text-align: left;	padding: 3px 0px 3px 15px;'>방 번호</td>	<td style='text-align: right;	padding: 3px 15px 3px 0px;'>"+roomNum+"호</td>");
				sb.append("</tr>	<tr><th style='text-align: left;	padding : 5px 0px 5px 10px;	font-size: 13pt;border-bottom: 5px solid #E74C3C;background-color: #CFD9E4; color:#222;' colspan='2'>체크인 정보</th></tr>");
				sb.append("<tr>	<td  style='text-align: left;	padding: 3px 0px 3px 15px;'>체크인</td>	<td  style='text-align: right;	padding: 3px 15px 3px 0px;'>"+ from.substring(0, 4)+"년"+from.substring(5,7)+"월"+from.substring(8)+"일"+"</td>	</tr>");
				sb.append("<tr>	<td  style='text-align: left;	padding: 3px 0px 3px 15px;'>체크아웃</td>	<td  style='text-align: right;	padding: 3px 15px 3px 0px;'>"+ to.substring(0, 4)+"년"+to.substring(5,7)+"월"+to.substring(8)+"일"+"</td>	</tr>");
				sb.append("<tr>	<td  style='text-align: left;	padding: 3px 0px 3px 15px;'>몇박</td>	<td  style='text-align: right;	padding: 3px 15px 3px 0px;'>"+nights+"박</td>	</tr>");
				sb.append("<tr>	<td  style='text-align: left;	padding: 3px 0px 3px 15px;'>예약일</td>	<td  style='text-align: right;	padding: 3px 15px 3px 0px;'>"+cal.get(Calendar.YEAR)+"년 "+cal.get(Calendar.MONTH)+1+"월 "+cal.get(Calendar.DATE)+"일</td>");
				sb.append("</tr>	<tr><th style='text-align: left;	padding : 5px 0px 5px 10px;	font-size: 13pt;border-bottom: 5px solid #E74C3C;background-color: #CFD9E4; color:#222;' colspan='2'>예약자 정보</th></tr>");
				sb.append("<tr>	<td  style='text-align: left;	padding: 3px 0px 3px 15px;'>예약자 이름</td> <td  style='text-align: right;	padding: 3px 15px 3px 0px;'>"+name+"</td>	</tr>");
				sb.append("<tr>	<td  style='text-align: left;	padding: 3px 0px 3px 15px;'>예약자 이메일</td> <td  style='text-align: right;	padding: 3px 15px 3px 0px;'>"+email+"</td></tr>");
				sb.append("<tr>	<td  style='text-align: left;	padding: 3px 0px 3px 15px;'>인원</td>	<td  style='text-align: right;	padding: 3px 15px 3px 0px;'>"+(adult+children)+"명</td>	</tr>");
				sb.append("<tr>  <th style='text-align: left;	padding : 5px 0px 5px 10px;	font-size: 13pt;border-bottom: 5px solid #E74C3C;background-color: #CFD9E4; color:#222;' colspan='2'>가격 정보</th></tr>");
				sb.append("<tr>  <td  style='text-align: left;	padding: 3px 0px 3px 15px;'>총 금액</td><td  style='text-align: right;	padding: 3px 15px 3px 0px;'>"+TotalCost+"만원</td>	</tr>");
				sb.append("<tr><th style='text-align: left;	padding : 5px 0px 5px 10px;	font-size: 13pt;border-bottom: 5px solid #E74C3C;background-color: #CFD9E4; color:#222;' colspan='2'>오시는 길</th></tr>");
				sb.append("<tr>	<td  style='text-align: left;	padding: 3px 0px 3px 15px;'>주소</td>	<td  style='text-align: right;	padding: 3px 15px 3px 0px;'>서울특별시 마포구 신수동 <br>63-14 구프라자3층</td>	</tr>");
				sb.append("<tr>	<td  style='text-align: left;	padding: 3px 0px 3px 15px;'>버스</td>	<td  style='text-align: right;	padding: 3px 15px 3px 0px;'>110A, 153, 604, 740, 753</td>	</tr>");
				sb.append("<tr>	<td  style='text-align: left;	padding: 3px 0px 3px 15px;'>지하철</td>	<td  style='text-align: right;	padding: 3px 15px 3px 0px;'>신촌역 6번출구 약 300m 직진</td>	</tr>");
				sb.append("<tr><th style='text-align: left;	padding : 5px 0px 5px 10px;	font-size: 13pt;border-bottom: 5px solid #E74C3C;background-color: #CFD9E4; color:#222;' colspan='2'>문의</th></tr>");
				sb.append("<tr>	<td  style='text-align: left;	padding: 3px 0px 3px 15px;'>전화</td>	<td  style='text-align: right;	padding: 3px 15px 3px 0px;'>010-1234-5678</td>	</tr>");
				sb.append("<tr><td  style='text-align: left;	padding: 3px 0px 3px 15px;'>이메일</td>	<td  style='text-align: right;	padding: 3px 15px 3px 0px;'>gaonhotel16@gmail.com</td>	</tr>");
				sb.append("</table></div></body> ");
				MailBean bean = new MailBean();
					
					bean.setName("GAON HOTEL");
					bean.setEmail(email);
					bean.setToemail("gaonhotel16@gmail.com");
					bean.setTitle("가온호텔-예약완료");
					bean.setText(sb.toString());
					SMTP smtp = new SMTP();
					smtp.send(bean);
					
			} else {
				System.out.println("예약입력 실패1" + getServletName());
				
			}
		} catch (Exception e) {
			System.out.println("예약입력 실패2" +e.toString());
			HttpSession session = request.getSession();
			session.setAttribute("error", e.toString());
			System.out.println(e);
			response.sendRedirect("./errorpage/error404.jsp");
			
		}
	}// end

}// class END
