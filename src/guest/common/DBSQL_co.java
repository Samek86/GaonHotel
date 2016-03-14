package guest.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DBSQL_co {
	private Connection CN; //DB서버정보기억, 명령어 생성
	private Statement ST; //정적인 명령어 ST=CN.createStatement()
	private PreparedStatement PST; //insert, update
	private ResultSet RS; //RS=ST.executeQuery(sql)
	private String sql; //쿼리문기억
	private int total; //댓글갯수
	
	public DBSQL_co(){
		CN=DB.getConnection();
	}
	
	public int coInsert(DBbean_rep bean, String data){
		
		//DBbean_rep bean1=new DBbean_rep();
		int success=0;
		try{
			sql="insert into gaon_board_re values(gaon_board_re_seq.nextval, ?, ?, sysdate, ?)";
			PST=CN.prepareStatement(sql);
			PST.setString(1, bean.getRewriter());
			PST.setString(2, bean.getRecontent());
			//Date date = new Date();
			//SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			//PST.setString(3, sdf.format(date));
			PST.setInt(3, Integer.parseInt(data));
			
			success=PST.executeUpdate();
			if(success>0){  System.out.println("댓글DB등록 성공");}
		}catch(Exception ex){ System.out.println("댓글 등록오류 : "+ex.toString()); }
		return success;
	}//insert END
	
	public List<DBbean_rep> coSelect(String num){
		List<DBbean_rep> list=new ArrayList<DBbean_rep>();
		try{			
			sql="select renum, rewriter, rewdate, recontent from gaon_board_re where num="+num+"order by renum";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()==true){
				DBbean_rep bean=new DBbean_rep();
				bean.setRenum(RS.getInt("renum"));
				bean.setRewriter(RS.getString("rewriter"));
				bean.setRewdate(RS.getString("rewdate"));
				bean.setRecontent(RS.getString("recontent"));
				list.add(bean);
			}
		}catch(Exception ex){ System.out.println("댓글 List 오류 : "+ex.toString()); }
		return list;
	}//select() END
	
	public int cototal(int num){
		try{
			String sql2="select count(*) as cnt from gaon_board_re where num="+num;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql2);
			if(RS.next()==true){
				total=RS.getInt("cnt");
			}
		}catch(Exception ex){ }
		return total;
	}//total() END
	
	public void coDelete(String data1){
		try{
			sql="delete from gaon_board_re where renum="+data1;
			ST=CN.createStatement();
			int ok=ST.executeUpdate(sql);
			if(ok>0){	System.out.println("삭제성공");  }
		}catch(Exception ex){ System.out.println("삭제실패 :"+ex.toString()); }
	}//dbDelete() END

}//class END
