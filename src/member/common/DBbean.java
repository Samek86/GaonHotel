package member.common;

import java.sql.Date;

public class DBbean {
	private String id;
	private String pw;
	private String name;
	private Date birth;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String email;
	private String tel;
	
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getPw() {return pw;}
	public void setPw(String pw) {this.pw = pw;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public Date getBirth() {return birth;}
	public void setBirth(Date birth) {this.birth = birth;}
	public String getZipcode() {return zipcode;}
	public void setZipcode(String zipcode) {this.zipcode = zipcode;}
	public String getAddr1() {return addr1;}
	public void setAddr1(String addr1) {this.addr1 = addr1;}
	public String getAddr2() {return addr2;}
	public void setAddr2(String addr2) {this.addr2 = addr2;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public String getTel() {return tel;}
	public void setTel(String tel) {this.tel = tel;}
}
