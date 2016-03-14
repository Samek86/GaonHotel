package member.common;

import member.common.DBbean;

import java.sql.*;
import java.util.*;//List 인터페이스
import java.io.*;

public class DBSQL {
	private Connection CN; //DB서버정보기억, 명령어 생성
	private Statement ST;
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.executeQuery(sql)
	private String sql; //쿼리문기억
	private int total; //레코드갯수

	private int limit=10; //1~10개 단위
	private String pnum; //request.getParameter("pageNUM")
  private int pageNUM;
	private int pagecount; //총페이지수
	private int start; //시작행번호
	private int end; //끝행번호
	private int temp; 
	private int startpage; //시작페이지
	private String returnpage;
	
	public DBSQL(){ //DB연결
		try{
			CN= DB.getConnection();
		}catch(Exception ex){}
	} //end

	//==회원리스트
	public List<DBbean> dbSelect(String pnum, String where){
		List<DBbean> member = new ArrayList<DBbean>();
		try{
			if(pnum==null) pnum="1";
			pageNUM=Integer.parseInt(pnum);

			start=((pageNUM-1)*limit)+1;
			end=pageNUM*limit;
						
			sql="select * from (select rownum rn, id, pw, name, email, tel from (select * from gaon_login " + where +" )) where rn between "+start+" and "+end;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
	
			while(RS.next()==true){
				DBbean bean = new DBbean();
				bean.setId(RS.getString("id"));
				bean.setPw(RS.getString("pw"));
				bean.setName(RS.getString("name"));
				bean.setEmail(RS.getString("email"));
				bean.setTel(RS.getString("tel"));
				member.add(bean);
			} //while end
		}catch(Exception ex){System.out.println("회원리스트 DBSQL Error : " + ex.toString());}
		return member;
	} //dbSelect() end
	
	public List<DBbean> dbSelect(){
		List<DBbean> LT = new ArrayList<DBbean>();
		try{
			sql="select * from login";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
	
			while(RS.next()==true){
				DBbean bean = new DBbean();
				bean.setId(RS.getString("id"));
				bean.setPw(RS.getString("pw"));
				bean.setName(RS.getString("name"));
				LT.add(bean);
			} //while end
		}catch(Exception ex){System.out.println("회원리스트 DBSQL Error : " + ex.toString());}
		return LT;
	} //dbSelect()2 end
	
	public int total(String where){
		try{
			String sql="select count(*) as cnt from gaon_login "+where;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		}catch(Exception ex){ }
		return total;
	}//total() END
	
	public DBbean dbSelectDetail(String id) {
		DBbean bean = new DBbean();
		try {
			sql = "SELECT * FROM GAON_LOGIN WHERE ID = ?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, id);
			RS = PST.executeQuery();
			while(RS.next()) {
				bean.setId(RS.getString("ID"));
				bean.setPw(RS.getString("PW"));
				bean.setName(RS.getString("NAME"));
				bean.setBirth(RS.getDate("BIRTH"));
				bean.setZipcode(RS.getString("ZIPCODE"));
				bean.setAddr1(RS.getString("ADDR1"));
				bean.setAddr2(RS.getString("ADDR2"));
				bean.setEmail(RS.getString("EMAIL"));
				bean.setTel(RS.getString("TEL"));
			}
		} catch(Exception e) { e.printStackTrace(); }
		return bean;
	}
	
	public void dbUpdate(String id, DBbean bean) {
		try {
			sql = "UPDATE GAON_LOGIN "
					+ "SET PW = ?, NAME = ?,  ZIPCODE = ?, ADDR1 = ?, ADDR2 = ?, EMAIL = ?, TEL = ? "
					+ "WHERE ID = ?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, bean.getPw());
			PST.setString(2, bean.getName());
			PST.setString(3, bean.getZipcode());
			PST.setString(4, bean.getAddr1());
			PST.setString(5, bean.getAddr2());
			PST.setString(6, bean.getEmail());
			PST.setString(7, bean.getTel());
			PST.setString(8, id);
			PST.executeUpdate();
		} catch(Exception e) { e.printStackTrace(); }
	}
	
	public void dbDelete(String id) {
		try {
			sql = "DELETE GAON_LOGIN WHERE ID = ?";
			PST = CN.prepareStatement(sql);
			PST.setString(1, id);
			PST.executeUpdate();
		} catch(Exception e) { e.printStackTrace(); }
	}
} //class END
