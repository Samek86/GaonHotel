package admin.common;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBSQL {
	private Connection CN;
	private Statement ST;
	private PreparedStatement PST;
	private ResultSet RS;
	private String sql;
	private int total;
	
	private int limit=10; //1~10개 단위
	private String pnum; //request.getParameter("pageNUM")
	private int pageNUM;
	private int pagecount; //총페이지수
	private int start; //시작행번호
	private int end; //끝행번호
	private int temp; 
	private int startpage; //시작페이지
	private String returnpage;
	
	public DBSQL() {
		try{
			CN = DB.getConnection();
		}catch(Exception ex){}
	}
	
	/*
	 *	객실관리 부분
	 */
	public List<DBbean> dbSelectRoom() { //AdminRoomListController
		List<DBbean> list = new ArrayList<DBbean>();
		try {
			sql = "SELECT * FROM GAON_ROOM ORDER BY ROOMID";
			PST = CN.prepareStatement(sql);
			RS = PST.executeQuery();
			while(RS.next()) {
				DBbean bean = new DBbean();
				bean.setRoomNum(RS.getInt("ROOMNUM"));
				bean.setRoomID(RS.getInt("ROOMID"));
				bean.setRoomType(RS.getString("ROOMTYPE"));
				bean.setRoomSort(RS.getString("ROOMSORT"));
				bean.setRoomName(RS.getString("ROOMNAME"));
				bean.setRoomCost(RS.getInt("ROOMCOST"));
				bean.setRoomMax(RS.getInt("ROOMMAX"));
				bean.setRoomText(RS.getString("ROOMTEXT"));
				bean.setRoomImg1(RS.getString("ROOMIMG1"));
				bean.setRoomImg2(RS.getString("ROOMIMG2"));
				bean.setRoomImg3(RS.getString("ROOMIMG3"));
				list.add(bean);
			}
		} catch(Exception e) {e.printStackTrace();}
		return list;
	}
	
	public List<DBbean> dbSelectRoom(int start, int end) {
		List<DBbean> list = new ArrayList<DBbean>();
		try {
			sql = "SELECT (SELECT ROWNUM RN, * FROM) "
					+ "FROM GAON_ROOM "
					+ "WHERE RN BETWEEN ? AND ?";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, start);
			PST.setInt(2, end);
			RS = PST.executeQuery();
			while(RS.next()) {
				DBbean bean = new DBbean();
				bean.setRoomNum(RS.getInt("ROOMNUM"));
				bean.setRoomID(RS.getInt("ROOMID"));
				bean.setRoomType(RS.getString("ROOMTYPE"));
				bean.setRoomSort(RS.getString("ROOMSORT"));
				bean.setRoomName(RS.getString("ROOMNAME"));
				bean.setRoomCost(RS.getInt("ROOMCOST"));
				bean.setRoomMax(RS.getInt("ROOMMAX"));
				bean.setRoomText(RS.getString("ROOMTEXT"));
				bean.setRoomImg1(RS.getString("ROOMIMG1"));
				bean.setRoomImg2(RS.getString("ROOMIMG2"));
				bean.setRoomImg3(RS.getString("ROOMIMG3"));
				list.add(bean);
			}
		} catch(Exception e) {e.printStackTrace();}
		return list;
	}
	
	public DBbean dbSelectDetail(int roomID) { //AdminRoomDetailController
		DBbean bean = new DBbean();
		try {
			sql = "SELECT * FROM GAON_ROOM "
					+ "WHERE ROOMID = ?";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, roomID);
			RS = PST.executeQuery();
			while(RS.next()) {
				bean.setRoomNum(RS.getInt("ROOMNUM"));
				bean.setRoomID(RS.getInt("ROOMID"));
				bean.setRoomType(RS.getString("ROOMTYPE"));
				bean.setRoomSort(RS.getString("ROOMSORT"));
				bean.setRoomName(RS.getString("ROOMNAME"));
				bean.setRoomCost(RS.getInt("ROOMCOST"));
				bean.setRoomMax(RS.getInt("ROOMMAX"));
				bean.setRoomText(RS.getString("ROOMTEXT"));
				bean.setRoomImg1(RS.getString("ROOMIMG1"));
				bean.setRoomImg2(RS.getString("ROOMIMG2"));
				bean.setRoomImg3(RS.getString("ROOMIMG3"));
			}
		} catch(Exception e) {e.printStackTrace();}
		return bean;
	}
	
	public List<DBbean> dbSelectRoomType() {
		List<DBbean> list = new ArrayList<DBbean>();
		try {
			sql = "SELECT DISTINCT ROOMTYPE, ROOMSORT "
					+ "FROM GAON_ROOM "
					+ "ORDER BY ROOMSORT";
			PST = CN.prepareStatement(sql);
			RS = PST.executeQuery();
			while(RS.next()) {
				DBbean bean = new DBbean();
				bean.setRoomType(RS.getString("ROOMTYPE"));
				bean.setRoomSort(RS.getString("ROOMSORT"));
				list.add(bean);
			}
		} catch(Exception e) {e.printStackTrace();}
		return list;
	}
	
	public DBbean dbSelectRoomDistinct(String roomType) {
		DBbean bean = new DBbean();
		try {
			sql = "SELECT DISTINCT ROOMTYPE, ROOMSORT, ROOMNAME, ROOMCOST, ROOMMAX, ROOMTEXT, ROOMIMG1, ROOMIMG2, ROOMIMG3 "
					+ "FROM GAON_ROOM "
					+ "WHERE ROOMTYPE = ?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, roomType);
			RS = PST.executeQuery();
			while(RS.next()) {
				bean.setRoomType(RS.getString("ROOMTYPE"));
				bean.setRoomSort(RS.getString("ROOMSORT"));
				bean.setRoomName(RS.getString("ROOMNAME"));
				bean.setRoomCost(RS.getInt("ROOMCOST"));
				bean.setRoomMax(RS.getInt("ROOMMAX"));
				bean.setRoomText(RS.getString("ROOMTEXT"));
				bean.setRoomImg1(RS.getString("ROOMIMG1"));
				bean.setRoomImg2(RS.getString("ROOMIMG2"));
				bean.setRoomImg3(RS.getString("ROOMIMG3"));
			}
		} catch(Exception e) {e.printStackTrace();}
		return bean;
	}
	
	public List<DBbean> dbSelectRoomDistinct() {
		List<DBbean> list = new ArrayList<DBbean>();
		try {
			sql = "SELECT DISTINCT ROOMTYPE, ROOMSORT, ROOMNAME, ROOMCOST, ROOMMAX, ROOMTEXT, ROOMIMG1, ROOMIMG2, ROOMIMG3 "
					+ "FROM GAON_ROOM";
			PST = CN.prepareStatement(sql);
			RS = PST.executeQuery();
			while(RS.next()) {
				DBbean bean = new DBbean();
				bean.setRoomType(RS.getString("ROOMTYPE"));
				bean.setRoomSort(RS.getString("ROOMSORT"));
				bean.setRoomName(RS.getString("ROOMNAME"));
				bean.setRoomCost(RS.getInt("ROOMCOST"));
				bean.setRoomMax(RS.getInt("ROOMMAX"));
				bean.setRoomText(RS.getString("ROOMTEXT"));
				bean.setRoomImg1(RS.getString("ROOMIMG1"));
				bean.setRoomImg2(RS.getString("ROOMIMG2"));
				bean.setRoomImg3(RS.getString("ROOMIMG3"));
				list.add(bean);
			}
		} catch(Exception e) {e.printStackTrace();}
		return list;
	}
	
	public void dbInsert(DBbean bean) { //AdminRoomInsertController
		try {
			sql = "INSERT INTO GAON_ROOM "
					+ "VALUES (GAON_ROOM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, bean.getRoomID());
			PST.setString(2, bean.getRoomType());
			PST.setString(3, bean.getRoomSort());
			PST.setString(4, bean.getRoomName());
			PST.setInt(5, bean.getRoomCost());
			PST.setInt(6, bean.getRoomMax());
			PST.setString(7, bean.getRoomText());
			PST.setString(8, bean.getRoomImg1());
			PST.setString(9, bean.getRoomImg2());
			PST.setString(10, bean.getRoomImg3());
			PST.executeUpdate();
			PST = CN.prepareStatement(sql);
		} catch(Exception e) {e.printStackTrace();}
	}
	
	public void dbUpdate(int roomID, DBbean bean) { //AdminRoomEditController
		try {
			sql = "UPDATE GAON_ROOM "
					+ "SET ROOMID = ?, ROOMTYPE = ?, ROOMNAME = ?, ROOMCOST = ?, ROOMMAX = ?, "
					+     "ROOMTEXT = ?, ROOMIMG1 = ?, ROOMIMG2 = ?, ROOMIMG3 = ? "
					+ "WHERE ROOMID = ?";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, bean.getRoomID());
			PST.setString(2, bean.getRoomType());
			PST.setString(3, bean.getRoomName());
			PST.setInt(4, bean.getRoomCost());
			PST.setInt(5, bean.getRoomMax());
			PST.setString(6, bean.getRoomText());
			PST.setString(7, bean.getRoomImg1());
			PST.setString(8, bean.getRoomImg2());
			PST.setString(9, bean.getRoomImg3());
			PST.setInt(10, roomID);
		} catch(Exception e) {e.printStackTrace();}
	}
	
	public void dbDelete(int roomID) { //AdminRoomDeleteController
		try {
			sql = "DELETE GAON_ROOM WHERE ROOMID = ?";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, roomID);
			PST.executeUpdate();
		} catch(Exception e) {e.printStackTrace();}
	}
	
	/*
	 *	예약관리 부분
	 */
	public int total(String where){
		try{
			String sql="select count(*) as cnt from gaon_reservation "+where;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		}catch(Exception ex){ }
		return total;
	}
	
	public List<ReserDBbean> dbSelectReservation(String pnum, String where){
		List<ReserDBbean> list = new ArrayList<ReserDBbean>();
		try{
			if(pnum==null) pnum="1";
			pageNUM=Integer.parseInt(pnum);

			start=((pageNUM-1)*limit)+1;
			end=pageNUM*limit;
						
			sql="select * from (select rownum rn, revid, revname, revemail, revtel, revroomid, revtotalcost, revcap,"
					+ "revin, revout, revterm, revdate from (select * from gaon_reservation " + where +" )) where rn between "+start+" and "+end;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true){
				ReserDBbean Reserbean = new ReserDBbean();
				Reserbean.setRevid(RS.getInt("REVID"));
				Reserbean.setRevname(RS.getString("REVNAME"));
				Reserbean.setRevemail(RS.getString("REVEMAIL"));
				Reserbean.setRevtel(RS.getString("REVTEL"));
				Reserbean.setRevroomid(RS.getInt("REVROOMID"));
				Reserbean.setRevtotalcost(RS.getInt("REVTOTALCOST"));
				Reserbean.setRevcap(RS.getInt("REVCAP"));
				Reserbean.setRevin(RS.getDate("REVIN"));
				Reserbean.setRevout(RS.getDate("REVOUT"));
				Reserbean.setRevterm(RS.getInt("REVTERM"));
				Reserbean.setRevdate(RS.getDate("REVDATE"));
				list.add(Reserbean);
			} //while end
		}catch(Exception ex){System.out.println("adminreservation Error : " + ex.toString());}
		return list;
	}
	
	public List<ReserDBbean> adminReserdbSelect() { //adminReservationList.do
		List<ReserDBbean> list = new ArrayList<ReserDBbean>();
		try {
			sql = "SELECT * FROM gaon_reservation";
			PST = CN.prepareStatement(sql);
			RS = PST.executeQuery();
			while(RS.next()) {
				ReserDBbean Reserbean = new ReserDBbean();
				Reserbean.setRevid(RS.getInt("REVID"));
				Reserbean.setRevname(RS.getString("REVNAME"));
				Reserbean.setRevemail(RS.getString("REVEMAIL"));
				Reserbean.setRevtel(RS.getString("REVTEL"));
				Reserbean.setRevroomid(RS.getInt("REVROOMID"));
				Reserbean.setRevtotalcost(RS.getInt("REVTOTALCOST"));
				Reserbean.setRevcap(RS.getInt("REVCAP"));
				Reserbean.setRevin(RS.getDate("REVIN"));
				Reserbean.setRevout(RS.getDate("REVOUT"));
				Reserbean.setRevterm(RS.getInt("REVTERM"));
				Reserbean.setRevdate(RS.getDate("REVDATE"));
				list.add(Reserbean);
			}
		} catch(Exception e) {e.printStackTrace();}
		return list;
	}
	
	public void adminReserdbDelete(int revid) { 
		try {
			sql = "DELETE gaon_reservation WHERE REVID = ?";
			PST = CN.prepareStatement(sql);
			PST.setInt(1, revid);
			PST.executeUpdate();
		} catch(Exception e) {e.printStackTrace();}
	}
}
