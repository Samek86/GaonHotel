package reservation.common;

import java.sql.* ;
import java.util.ArrayList;
import java.util.List;

import reservation.common.revDBbean;

public class revDBsql {

	private Connection CN ; // 
	private Statement ST ; 
	private PreparedStatement PST ; // 
	private ResultSet RS ; 
	private String sql ;
	int pageNUM=1, start=1, end=10, pagesize=10, limit=10;
	String sqry, returnpage, skey="name", sval="%%";

	public revDBsql() {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN = DriverManager.getConnection(url,"system","oracle");
		}catch(Exception ex){System.out.println("<h1>" + ex.toString()+"</h1>");}
	}//con

	public int revInsert(revDBbean revdbbean){ //예약 추가
		int ok=0;
		try {
			sql="insert into gaon_reservation values(revID.nextval,?, ?, ?, ? ,?, ?, ?, ?, ?, sysdate)";
			PST = CN.prepareStatement(sql);
			PST.setString(1, revdbbean.getRevName());
			PST.setString(2, revdbbean.getRevEmail());	
			PST.setString(3, revdbbean.getRevTel());	
			PST.setInt(4, revdbbean.getRevRoomID());	
			PST.setInt(5, revdbbean.getRevTotalCost());			
			PST.setInt(6, revdbbean.getRevCap());
		   PST.setString(7, revdbbean.getRevIn());
		   PST.setString(8, revdbbean.getRevOut());
			PST.setInt(9, revdbbean.getRevTerm());
			ok = PST.executeUpdate();
			ok=1;
		} catch (Exception ex) {System.out.println("revInsert: "+ex.toString());}
		return ok;
	}// end revInsert

	public List<revDBbean> revcheck (String revIn, String revOut){ //빈방 모두 검색
		List<revDBbean> revcheck = new ArrayList<revDBbean>();
		String sql = "select roomID ri, roomType rt from gaon_room";
				 sql += " where roomID not in( ";
				 sql += "select revRoomID from gaon_reservation where ";
				 sql += "(('"+revIn+"') >= revIn and ('"+revIn+"') < revOut) ";
				 sql += "or (('"+revIn+"') > revIn and ('"+revOut+"') < revOut) ";
				 sql += "or (('"+revIn+"') <= revIn and ('"+revOut+"') >= revOut) ";
			 	 sql += "or (('"+revOut+"') > revIn and ('"+revOut+"') <= revOut)) "; 
		try {
			ST=CN.createStatement();
			RS = ST.executeQuery(sql);
			while(RS.next()==true){
				revDBbean bean = new revDBbean(); 
				bean.setRoomID(RS.getInt("ri"));
				bean.setRoomType(RS.getString("rt"));
				revcheck.add(bean); 
			}//while
		} catch (SQLException e) {
			System.out.println("예약체크 오류"+e);
		}
		return revcheck;
	}//revcheck end
	
	public List<revDBbean> revUserList(String revEmail){ //개인 예약정보 보기 원래는 페이징 해야되지만 하나만 출력....
		List<revDBbean> List = new ArrayList<revDBbean>() ;
		
		String sql="select * from gaon_reservation where revEmail='"+revEmail+"'";
		try{
			ST=CN.createStatement();
			RS = ST.executeQuery(sql);
			while(RS.next()==true){
				revDBbean bean = new revDBbean(); 
					bean.setRevId(RS.getInt("revID"));
					bean.setRevName(RS.getString("revName"));
					bean.setRevEmail(RS.getString("revEmail"));
					bean.setRevTel(RS.getString("revTel"));
					bean.setRevRoomID(RS.getInt("revRoomID"));
					bean.setRevTotalCost(RS.getInt("revTotalCost"));
					bean.setRevCap(RS.getInt("revCap"));
					bean.setRevIn(RS.getString("revIn"));
					bean.setRevOut(RS.getString("revOut"));
					bean.setRevTerm(RS.getInt("revTerm"));
					bean.setRevDate(RS.getString("revDate"));
					List.add(bean);
			}
		}catch(Exception ex){List=null;}
		return List;
	}//revList end
	
	public List<revDBbean> revAdminList(String pnum, String psize, String skey, String sval){//관리자 예약정보 보기
		
		List<revDBbean> list = new ArrayList<revDBbean>();
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
					bean.setRevDate(RS.getString("revDate"));
				list.add(bean);
			}
		} catch (Exception ex) {	System.out.println("list"+ex);	}
		return list;
	}//revAdminList(4) end
	
	public int revCount(){ //전체 예약 갯수
		int total=0;
		try {
			sql = "select count(*) as cnt from gaon_reservation";
			PST = CN.prepareStatement(sql);
			RS = PST.executeQuery();
			if(RS.next()==true){}
			total = RS.getInt("cnt");
		} catch (Exception ex) { System.out.println("revCount"+ex);		}
		return total;
	}//dbCount end
	
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
	
	public int revDelete(String Email){	
		int Delok = 0; 
		String sql = "delete from gaon_reservation where revEmail = "+ Email ;
		try{
			ST = CN.createStatement() ;
			Delok = ST.executeUpdate(sql);
			Delok =1;
		}catch(Exception ex){System.out.println("revDelete : "+ex.toString());}
		return Delok ;
	}
	
}//class
