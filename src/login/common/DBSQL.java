package login.common;

import java.sql.*;
import java.util.*;//List 인터페이스
import java.io.*;

//밑에 3개가 세트로 구성됨.
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import login.common.DBbean;

public class DBSQL {
	private Connection CN; //DB서버정보기억, 명령어 생성
	private Statement ST; //정적인 명령어 ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.executeQuery(sql)
	private String sql; //쿼리문기억
	private int total; //레코드갯수

	public DBSQL(){ //생성자에서 DB연결
		//CN=DB.getConnection();
		//META-INF/context.xml문서 리소스 name서비스
		try{
			CN= DB.getConnection();
		}catch(Exception ex){}
	} //end
	
	public int dbInsert(DBbean bean){//InsertController.java연결
		int success=0;
		try {
			sql = "INSERT INTO GAON_LOGIN "
					+ "VALUES (GAON_LOGIN_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PST = CN.prepareStatement(sql);
			PST.setString(1, bean.getId());
			PST.setString(2, bean.getPw());
			PST.setString(3, bean.getName());
			PST.setDate(4, bean.getBirth());
			PST.setString(5, bean.getZipcode());
			PST.setString(6, bean.getAddr1());
			PST.setString(7, bean.getAddr2());
			PST.setString(8, bean.getEmail());
			PST.setString(9, bean.getTel());
			success = PST.executeUpdate();//진짜저장처리메소드 =>단독처리 에러발생
			if(success>0) { System.out.print("dbInsert(DBbean)저장성공!!!"); }
		} catch(Exception ex) { System.out.print("dbInsert(DBbean)저장실패!!!"); }
		return success;
	} 
	
	public int dbSearch(String ID, String PW){
		int count = 0;
		try{
			String sql = "select * from gaon_login where ID='"+ID+"'";
			ST= CN.createStatement();
			RS= ST.executeQuery(sql);
			if(RS.next()==true) {
				if(RS.getString("ID").equals(ID) && !RS.getString("PW").equals(PW)){
					count=1;
				}
				else if(RS.getString("ID").equals(ID) && RS.getString("PW").equals(PW)){ 
					count=2;}
			}
		}catch(Exception ex){ex.toString();}
		return count;
	}//dbSerch(int ID) end
	
	public int checkID(String id){
		int ok=0;
		try{
			sql="select count(*) as cnt from Gaon_login where id='" +id+"'";
			System.out.println(sql);
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true){
				ok=RS.getInt("cnt");			
			}
		}catch(Exception e){ System.out.println("아이디중복sql error: "+e.toString()); }		
		return ok;
	}

	public String dbSelectNowName(String id) {
		String name = null;
		try {
			sql = "SELECT NAME FROM GAON_LOGIN WHERE ID = ?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, id);
			RS = PST.executeQuery();
			while(RS.next()) {
				name = RS.getString("NAME");
			}
		} catch(Exception e) {e.printStackTrace();}
		return name;
	}
	
	public List<DBbean> revInfo(String id){ //예약 저장때 사용
		List<DBbean> revInfo = new ArrayList<DBbean>();
		try{
			sql="select name, email, tel from Gaon_login where id='"+id+"'";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true){
				DBbean bean = new DBbean();
				bean.setName(RS.getString("name"));
				bean.setEmail(RS.getString("email"));
				bean.setTel(RS.getString("tel"));
				revInfo.add(bean);
			}
		}catch(Exception e){ System.out.println(" rev Info error: "+e.toString()); }		
		return revInfo;
	}
	
	public List<DBbean> checkrev(String id){ //예약 저장때 사용
		List<DBbean> checkrev = new ArrayList<DBbean>();
		try{
			sql="select * from Gaon_login where id='"+id+"'";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true){
				DBbean bean = new DBbean();
				bean.setName(RS.getString("name"));
				bean.setEmail(RS.getString("email"));
				bean.setTel(RS.getString("tel"));
				checkrev.add(bean);
			}
		}catch(Exception e){ System.out.println(" rev Info error: "+e.toString()); }		
		return checkrev;
	}
	
	public String IdToEmail(String id) {
		String email = null;
		try {
			sql = "SELECT email FROM GAON_LOGIN WHERE ID = ?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, id);
			RS = PST.executeQuery();
			while(RS.next()) {
				email = RS.getString("email");
			}
		} catch(Exception e) {e.printStackTrace();}
		return email;
	}
	
} //class END
