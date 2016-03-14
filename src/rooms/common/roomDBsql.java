package rooms.common;

import java.sql.* ;
import java.util.ArrayList;
import java.util.List;

import reservation.common.revDBbean;

public class roomDBsql {

	private Connection CN ; // 
	private Statement ST ; 
	private PreparedStatement PST ; // 
	private ResultSet RS ; 
	private String sql ;
	int pageNUM=1, start=1, end=10, pagesize=10, limit=10;
	String sqry, returnpage, skey="name", sval="%%";

	public roomDBsql() {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN = DriverManager.getConnection(url,"system","oracle");
		}catch(Exception ex){System.out.println("<h1>" + ex.toString()+"</h1>");}
	}//con

	public List<roomDBbean> roomList(){ //룸 전체 보기 4개
		List<roomDBbean> room_List = new ArrayList<roomDBbean>() ;
		
		String sql="select distinct(roomSort), roomType, roomName, roomCost, roomMax, roomText, roomImg1, roomImg2, roomImg3 from gaon_room order by roomSort";
		try{
			ST=CN.createStatement();
			RS = ST.executeQuery(sql);
			while(RS.next()==true){
				roomDBbean bean = new roomDBbean(); 
					bean.setRoomType(RS.getString("roomType")); //영문이름
					bean.setRoomName(RS.getString("roomName")); //한글이름
					bean.setRoomCost(RS.getInt("roomCost"));
					bean.setRoomMax(RS.getInt("roomMax"));
					bean.setRoomText(RS.getString("roomText"));
					bean.setRoomImg1(RS.getString("roomImg1"));
					bean.setRoomImg2(RS.getString("roomImg2"));
					bean.setRoomImg3(RS.getString("roomImg3"));
				room_List.add(bean);
			}
		}catch(Exception ex){System.out.println(ex.toString());}
		return room_List;
	}//roomList end
	
	
	public int roomCost(int hosil){ //전체 방 갯수
		int Cost=0;
		try {
			sql = "select roomCost, roomID from gaon_room where roomID = "+hosil;
			PST = CN.prepareStatement(sql);
			RS = PST.executeQuery();
			if(RS.next()==true){}
			Cost = RS.getInt("roomCost");
		} catch (Exception ex) { System.out.println("roomCount"+ex);		}
		return Cost;
	}//roomCount end
	
	public int roomCount(){ //전체 방 갯수
		int total=0;
		try {
			sql = "select count(*) as cnt from gaon_room";
			PST = CN.prepareStatement(sql);
			RS = PST.executeQuery();
			if(RS.next()==true){}
			total = RS.getInt("cnt");
		} catch (Exception ex) { System.out.println("roomCount"+ex);		}
		return total;
	}//roomCount end
	
	public List<roomDBbean> remindRoom (String In, String Out){ //빈방 검색(중복제외)
		List<roomDBbean> remindroom = new ArrayList<roomDBbean>();
		String sql = "select distinct(roomSort), roomType, roomName, roomMax, roomText, roomCost, ";
				  sql += "roomImg1, roomImg2, roomImg3  from ( ";
				  sql += "select * from gaon_room where roomID not in( ";
				  sql += "select revRoomID from gaon_reservation where  ";
				  sql += "(('"+In+"' >= revIn and '"+In+"' < revOut) ";
		  		sql += " or ('"+In+"' > revIn and '"+Out+"' < revOut)  ";
  				sql += "or ('"+In+"' <= revIn and '"+Out+"' >= revOut) ";
					sql += "or ('"+Out+"' > revIn and '"+Out+"' <= revOut)))) order by roomSort"; 
			 	 
		try {
			ST=CN.createStatement();
			RS = ST.executeQuery(sql);
			while(RS.next()==true){
				roomDBbean bean = new roomDBbean(); 
				bean.setRoomType(RS.getString("roomType"));
				bean.setRoomName(RS.getString("roomName"));
				bean.setRoomMax(RS.getInt("roomMax"));
				bean.setRoomCost(RS.getInt("roomCost"));
				bean.setRoomText(RS.getString("roomText"));
				bean.setRoomImg1(RS.getString("roomImg1"));
				bean.setRoomImg2(RS.getString("roomImg2"));
				bean.setRoomImg3(RS.getString("roomImg3"));
				remindroom.add(bean); 
			}//while
		} catch (SQLException e) {
			System.out.println("빈방 오류"+e);
		}
		return remindroom;
	}//remindRoom end
	
	public List<roomDBbean> bookedRoom (String In, String Out){ //예약된 방 검색(중복제외)
		List<roomDBbean> bookedRoom = new ArrayList<roomDBbean>();
		String sql = "select distinct(roomSort), roomType, roomName, roomMax, roomText, roomImg1, roomCost ";
				 sql +="from gaon_room where roomSort not in ( ";
				 sql +="select distinct(roomSort) from ( ";
				 sql += "select * from gaon_room where roomID not in( ";
			    sql += "select revRoomID from gaon_reservation where  ";
			    sql += "(('"+In+"' >= revIn and '"+In+"' < revOut) ";
		  		 sql += " or ('"+In+"' > revIn and '"+Out+"' < revOut)  ";
  			    sql += "or ('"+In+"' <= revIn and '"+Out+"' >= revOut) ";
				 sql += "or ('"+Out+"' > revIn and '"+Out+"' <= revOut))))) order by roomSort"; 
			 
		try {
			ST=CN.createStatement();
			RS = ST.executeQuery(sql);
			while(RS.next()==true){
				roomDBbean bean = new roomDBbean(); 
				bean.setRoomType(RS.getString("roomType"));
				bean.setRoomName(RS.getString("roomName"));
				bean.setRoomMax(RS.getInt("roomMax"));
				bean.setRoomText(RS.getString("roomText"));
				bean.setRoomImg1(RS.getString("roomImg1"));
				bean.setRoomCost(RS.getInt("roomCost"));
				bookedRoom.add(bean); 
			}//while
		} catch (SQLException e) {
			System.out.println("예약된방 오류"+e);
		}
		return bookedRoom;
	}//remindRoom end
	
	
	
	/*
public List<roomDBbean> roomListPage(String pnum, String psize, String skey, String sval){//TODO 룸 리스트보는거 수정
		
		List<roomDBbean> list = new ArrayList<roomDBbean>();
		try {

			sqry = " where " + skey +" like '%" + sval+"%'";

			if(psize==null||psize.equals("")){}
			else{pagesize=Integer.parseInt(psize);}
			
			if(pnum==null||pnum.equals("")){pageNUM=1;}
			else{pageNUM=Integer.parseInt(pnum);}
			
			if(skey==null||skey.equals("")){skey="title";}else{this.skey=skey;}
			if(sval==null||sval.equals("")){sval="";}else{this.sval=sval;}
			
			int total = revCountSearch(skey, sval);
			
			start = total-((pageNUM-1)*pagesize);
			end = total-pageNUM*pagesize+1;
			if(end<1){end=1;}//마이너스일 경우 1로 바꿈
			
			sqry = " where " + skey +" like '%" +sval +"%'";			
			
			sql = "select * from (select rownum rn, revID, revEmail, ";
			sql += "revRoomID, revTotalCost, revCap, revIn, revOut, revTerm, revDate from ";
			sql += "(select * from gaon_reservation " + sqry + " ) ";
			sql += ") where rn between "+ end +" and "+ start;
			
			ST=CN.createStatement();
			RS = ST.executeQuery(sql);
			while(RS.next()==true){
				revDBbean bean = new revDBbean(); 
					bean.setRownum(RS.getInt("rn"));
					bean.setRevEmail(RS.getString("revEmail"));
					bean.setRevRoomID(RS.getInt("revRoomID"));
					bean.setRevTotalCost(RS.getInt("revTotalCost"));
					bean.setRevCap(RS.getInt("revCap"));
					bean.setRevIn(RS.getString("revIn"));
					bean.setRevOut(RS.getString("revOut"));
					bean.setRevTerm(RS.getInt("revTerm"));
					bean.setRevDate(RS.getDate("revDate"));
				list.add(bean);
			}
		} catch (Exception ex) {	System.out.println("list"+ex);	}
		return list;
	}//revAdminList(4) end
	
	
	public int revDelete(String Email){	 //TODO 룸 삭제
		int Delok = 0; 
		String sql = "delete from gaon_reservation where revEmail = "+ Email ;
		try{
			ST = CN.createStatement() ;
			Delok = ST.executeUpdate(sql);
			Delok =1;
		}catch(Exception ex){System.out.println("revDelete : "+ex.toString());}
		return Delok ;
	}
	
	
	public int revCountSearch(String skey, String sval){ //특정 검색시 예약 갯수
		int total=0;
		try {
			if(skey==null||skey.equals("")){skey="name";}else{this.skey=skey;}
			if(sval==null||sval.equals("")){sval="";}else{this.sval=sval;}
			sqry = " where " + skey +" like '%" +sval +"%'";
			sql = "select count(*) cnt from gaon_reservation" + sqry;
			PST = CN.prepareStatement(sql);
			RS = PST.executeQuery();
			if(RS.next()==true){}
			total = RS.getInt("cnt");
		} catch (Exception ex) { System.out.println("revCount"+ex);		}
		return total;
	}//dbCount end
	
	*/
}//class
