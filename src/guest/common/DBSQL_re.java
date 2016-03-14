package guest.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBSQL_re {
	private Connection CN; //DB서버정보기억, 명령어 생성
	private Statement ST; //정적인 명령어 ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.executeQuery(sql)
	private String sql, sqry; //쿼리문기억
	private int total, sub; //레코드갯수
	
	private int limit=10; //1~10개 단위
	private String pnum; //request.getParameter("pageNUM")
  private int pageNUM;
	private int pageCount; //총페이지수 900/10=>90
	private int start; //시작행번호
	private int end; //끝행번호
	private int temp; 
	private int startPage; //시작페이지
	private String returnPage;
	
	public DBSQL_re(){
		CN=DB.getConnection();
	}
	
	public int boardInsert(DBbean_bo bean){
		int ok=0;
		
		try{
			sql="insert into gaon_board values(gaon_board_seq.nextval, ?, ?, ?, ?, ?, sysdate, 0, ?)";
			PST=CN.prepareStatement(sql);
			
			PST.setString(1, bean.getType());
			PST.setString(2, bean.getWriter());
			PST.setString(3, bean.getPwd());
			PST.setString(4, bean.getTitle());
			PST.setString(5, bean.getContent());
			PST.setInt(6, bean.getRate());
			
			ok=PST.executeUpdate();
		}catch(Exception ex){ System.out.println("guest.common/DBSQL_re.java 이용후기등록오류 : "+ex.toString()); }
		return ok;
	}//insert END
	
	public List<DBbean_bo> boardSelect(String pnum,String keyf,String keyw,String keyt){ //DBbean_bo => gaon_board
		List<DBbean_bo> list=new ArrayList<DBbean_bo>();
		try{
			if(pnum==null) {pnum="1";}
			if(keyt==null || keyt=="" || keyt.equals("all")) keyt="";
			int sub = subtotal(keyt,keyf,keyw);
			pageNUM=Integer.parseInt(pnum);
			start=sub-(pageNUM-1)*limit;
			end=start-(limit-1);
			
			sqry="type like '%"+keyt+"%' and "+ keyf+" like '%"+keyw+"%' ";
			sql="select * from (";
			sql+="select a.*, rownum rn from";
			sql+="(select * from gaon_board where "+sqry+") a order by rn desc)";
		  sql+=" where rn between "+end+" and "+start;
		  
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true){
				DBbean_bo bean=new DBbean_bo();
				bean.setNum(RS.getInt("num"));
				bean.setType(RS.getString("type"));
				bean.setWriter(RS.getString("writer"));
				bean.setPwd(RS.getString("pwd"));
				bean.setTitle(RS.getString("title"));
				bean.setContent(RS.getString("content"));
				bean.setWdate(RS.getDate("wdate"));
				bean.setCount(RS.getInt("count"));
				bean.setRate(RS.getInt("rate"));
				bean.setRn(RS.getInt("rn"));
				list.add(bean);
			}
		}catch(Exception ex){ System.out.println("guest.common/DBSQL_re.java 이용후기 List 오류~~~ : "+ex.toString()); }
		return list;
	}//select() END
	
	public List<DBbean_bo> boardNoticeSelect(){ //DBbean_bo => gaon_board
		List<DBbean_bo> Noticelist=new ArrayList<DBbean_bo>();
		
		try{
		  sql="select * from notice order by wdate desc";
		  
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true){
				DBbean_bo bean=new DBbean_bo();
				bean.setNum(RS.getInt("num"));
				bean.setType(RS.getString("type"));
				bean.setWriter(RS.getString("writer"));
				bean.setTitle(RS.getString("title"));
				bean.setContent(RS.getString("content"));
				bean.setWdate(RS.getDate("wdate"));
				Noticelist.add(bean);
			}
		}catch(Exception ex){ System.out.println("guest.common/DBSQL_re.java 이용후기 List 오류~~~ : "+ex.toString()); }
		return Noticelist;
	}//select() END
	
	public int total(){
		try{
			sql="select count(*) as cnt from gaon_board";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		}catch(Exception ex){ }
		return total;
	}//total() END
	
	public int subtotal(String keyt,String keyf,String keyw){
		try{
			if(keyt==null || keyt=="" || keyt.equals("all")) keyt="";
			sqry="type like '%"+keyt+"%' and "+ keyf+" like '%"+keyw+"%' ";
			sql="select count(*) as cnt from gaon_board where "+sqry;
			
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()==true){
				sub=RS.getInt("cnt");
			}
		}catch(Exception ex){ }
		return sub;
	}//subtotal() END
	
	public DBbean_bo boardDetail(String nn){
		DBbean_bo bean=new DBbean_bo();
		readCount(nn);
		
		try{
			sql="select * from gaon_board where num="+nn;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			if(RS.next()==true){
				bean.setNum(RS.getInt("num"));
				bean.setType(RS.getString("type"));
				bean.setTitle(RS.getString("title"));
				bean.setContent(RS.getString("content"));
				bean.setCount(RS.getInt("count"));
				bean.setWriter(RS.getString("writer"));
				bean.setWdate(RS.getDate("wdate"));
				bean.setRate(RS.getInt("rate"));
			}
		}catch(Exception ex){ System.out.println("이용후기 boardDetail(1) 오류 : "+ex.toString());  }
		return bean;
	}//detail() END
	
	public DBbean_bo boardNoticeDetail(String nn2){
		DBbean_bo bean=new DBbean_bo();
		
		try{
			int nn = Integer.parseInt(nn2);
			sql="select * from notice where num="+nn;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			if(RS.next()==true){
				bean.setNum(nn);
				bean.setType(RS.getString("type"));
				bean.setTitle(RS.getString("title"));
				bean.setContent(RS.getString("content"));
				bean.setWdate(RS.getDate("wdate"));
				bean.setWriter(RS.getString("writer"));
				
			}
		}catch(Exception ex){ System.out.println("boardNoticeDetail 오류 : "+ex.toString());  }
		return bean;
	}//detail() END
	
	
	

	
	public int dbEdit(DBbean_bo bean){
		int ok=0;
		try{
			sql="update gaon_board set title=?, content=? where num="+bean.getNum()+" and pwd="+bean.getPwd();
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getTitle());
			PST.setString(2, bean.getContent());
			
			ok=PST.executeUpdate();
		}catch(Exception ex){ System.out.println("수정실패 :" + ex.toString());  }
		return ok;
	}//eddit() END
	
		
	public void dbDelete(String data1, String data2){
		try{
			sql="delete from gaon_board where num="+data1+" and pwd="+data2;
			ST=CN.createStatement();
			int ok=ST.executeUpdate(sql);
			if(ok>0){ }
		}catch(Exception ex){ System.out.println("삭제실패 :"+ex.toString()); }
	}//dbDelete() END
	
	public void dbDelete(String num){
		try{
			sql="delete from gaon_board where num="+num;
			ST=CN.createStatement();
			int ok=ST.executeUpdate(sql);
			if(ok>0){	System.out.println("삭제성공");  }
			
		}catch(Exception ex){ System.out.println("삭제실패 :"+ex.toString()); }
	}//dbDelete() END
	
	public void readCount(String num){
		String sql = "update gaon_board set count = count + 1 where num=?";
		int n=Integer.parseInt(num);
			
		try{
			PST = CN.prepareStatement(sql);
			PST.setInt(1, n);
			int res = PST.executeUpdate();
		}catch(Exception e){  System.out.println("조회수 오류 : "+e.toString());  }
		
	}//readCount() END

	public int boardNotcieInsert(DBbean_bo bean) {
		int ok=0;
		
		try{
			sql="insert into notice values(notice_seq.nextval, ?, ?, ?, sysdate, ?)";
			PST=CN.prepareStatement(sql);
			
			PST.setString(1, bean.getType());
			PST.setString(2, bean.getTitle());
			PST.setString(3, bean.getContent());
			PST.setString(4, bean.getWriter());
			
			ok=PST.executeUpdate();
			if(ok>0){  System.out.println("게시판DB등록 성공");}
		}catch(Exception ex){ System.out.println("guest.common/DBSQL_re.java 이용후기등록오류 : "+ex.toString()); }
		return ok;
	}

	public int dbNoticeEdit(DBbean_bo bean) {
		int ok=0;
		try{
			sql="update notice set title=?, content=? where num="+bean.getNum();
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getTitle());
			PST.setString(2, bean.getContent());
			
			ok=PST.executeUpdate();
		}catch(Exception ex){ System.out.println("수정실패 :" + ex.toString());  }
		return ok;
	}

	public void dbNoticeDelete(String num) {
		try{
			sql="delete from notice where num="+num;
			ST=CN.createStatement();
			int ok=ST.executeUpdate(sql);
			if(ok>0){	System.out.println("삭제성공");  }
			
		}catch(Exception ex){ System.out.println("삭제실패 :"+ex.toString()); }
	}

}//class END
