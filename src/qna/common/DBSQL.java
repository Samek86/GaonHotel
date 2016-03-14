package qna.common;

import member.common.DBbean;

import java.sql.*;
import java.util.*;//List 인터페이스
import java.io.*;

public class DBSQL {
	private Connection CN; //DB서버정보기억, 명령어 생성
	private Statement ST; //정적인 명령어 ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.executeQuery(sql)
	private String sql; //쿼리문기억
	private int total; //레코드갯수

	private int limit=10; //1~10개 단위
	private String pnum; //request.getParameter("pageNUM")
   	private int pageNUM;
	private int pageCount; //총페이지수 900/10=>90
	private int start; //시작행번호
	private int end; //끝행번호
	private int temp; 
	private int startPage; //시작페이지
	private String returnPage;
	
	public DBSQL(){ //생성자에서 DB연결
		try{
			CN= DB.getConnection();
		}catch(Exception ex){}
	} //end

	//==회원리스트
	public List<DBbean> dbSelect(String pnum, String sql3){//ListController.java연결
		List<DBbean> LT = new ArrayList<DBbean>();
		try{
			//String subsql=" where "+skey+" like '%"+sval+"%'";	
			if(pnum==null) pnum="1";
			pageNUM=Integer.parseInt(pnum);
			
			start=((pageNUM-1)*limit)+1;
			end=pageNUM*limit;
						
			sql="select * from (select rownum rn, id, pw, name, gender, birth, mem from (select * from login "+sql3+")) where rn between "+start+" and "+end;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
	
			while(RS.next()==true){
				DBbean bean = new DBbean();
				bean.setId(RS.getString("id"));
				bean.setPw(RS.getString("pw"));
				bean.setName(RS.getString("name"));
		//		bean.setGender(RS.getString("gender"));
			//	bean.setBirth(RS.getString("birth").substring(0,10));
			//	bean.setMem(RS.getString("mem"));
				LT.add(bean);
			} //while end
		}catch(Exception ex){System.out.println("회원리스트 DBSQL Error : " + ex.toString());}
		return LT;
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
				//bean.setGender(RS.getString("gender"));
				//bean.setBirth(RS.getString("birth").substring(0,10));
				//bean.setMem(RS.getString("mem"));
				LT.add(bean);
			} //while end
		}catch(Exception ex){System.out.println("회원리스트 DBSQL Error : " + ex.toString());}
		return LT;
	} //dbSelect()2 end
	
	public int total(String sql3){
		try{
			String sql2="select count(*) as cnt from login "+sql3;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql2);
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		}catch(Exception ex){ }
		return total;
	}//total() END
	
/*	public DBbean memberDetail(String data){//DetailController.java연결
		DBbean bean = new DBbean();
		try{
			sql="select * from login where id='"+data+"'";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
				
			while(RS.next()==true){		
				bean.setId(RS.getString("id"));
				bean.setPw(RS.getString("pw"));
				bean.setName(RS.getString("name"));
				//bean.setGender(RS.getString("gender"));
				//bean.setBirth(RS.getString("birth"));
				bean.setAddr(RS.getString("addr"));
				bean.setEmail(RS.getString("email"));
				bean.setTel(RS.getString("tel"));
			//	bean.setMem(RS.getString("mem"));
			} //while end
		}catch(Exception ex){}
		return bean;
	} //dbDetail() end
*/	/*
	public DBbean memberEditPre(String data){//EditProController.java연결
		DBbean bean = new DBbean();
		try{
			sql="select * from login where id="+data;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			if(RS.next()==true){
				PST.setString(1, bean.getId());
				PST.setString(2, bean.getPw());
				PST.setString(3, bean.getName());
				PST.setString(4, bean.getGender());
				PST.setString(5, bean.getBirth());
				PST.setString(6, bean.getAddr());
				PST.setString(7, bean.getEmail());
				PST.setString(8, bean.getTel());
				PST.setString(9, bean.getMem());
			}
		}catch(Exception ex){System.out.println(ex.toString());}
		return bean;
	} //dbEditPro() end	
	*/
/*	public int memberEdit(DBbean bean, String id){//EditController.java연결
		int ok=0;
		try{
			sql="update login set addr=?, email=?, tel=?, mem=? where id='"+id+"'";
			System.out.println(sql);
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getAddr());
			PST.setString(2, bean.getEmail());
			PST.setString(3, bean.getTel());
			//PST.setString(4, bean.getMem());
			//PST.setString(5, bean.getId());
			
			ok=PST.executeUpdate();
			System.out.println(ok);
		}catch(Exception ex){ System.out.println("수정실패 :" + ex.toString());  }
		return ok;
	}//edit() END
*/	
	public void dbDelete(String data){//DetailController.java연결
		try{
			sql="delete from login where id='" + data+"'";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
				
			System.out.println("\n"+data+"삭제성공");
			
		}catch(Exception ex){System.out.println(ex.toString());}
	} //dbDelete() end	
	
} //class END
