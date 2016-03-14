package reservation.common;

import java.util.Date;

public class revDBbean {
	
	private int rownum;
	private int revId ;
	private String revName;
	private String revEmail;
	private String revTel;
	private int revRoomID ;
	private int revTotalCost ;
	private int revCap ;
	private String revIn ;
	private String revOut ;
	private int revTerm ;
	private String revDate ;
	private String revRoomName;
	
	
	private int roomID;
	private String roomType;
	private int roomCost;
	
	
public int getRevId() {
	return revId;
}
public void setRevId(int revId) {
	this.revId = revId;
}

public int getRevRoomID() {
	return revRoomID;
}
public void setRevRoomID(int revRoomID) {
	this.revRoomID = revRoomID;
}

public int getRevCap() {
	return revCap;
}
public void setRevCap(int revCap) {
	this.revCap = revCap;
}
public String getRevIn() {
	return revIn;
}
public void setRevIn(String revIn) {
	this.revIn = revIn;
}
public String getRevOut() {
	return revOut;
}
public void setRevOut(String revOut) {
	this.revOut = revOut;
}
public int getRevTerm() {
	return revTerm;
}
public void setRevTerm(int revTerm) {
	this.revTerm = revTerm;
}
public String getRevDate() {
	return revDate;
}
public void setRevDate(String revDate) {
	this.revDate = revDate;
}
public String getRevEmail() {
	return revEmail;
}
public void setRevEmail(String revEmail) {
	this.revEmail = revEmail;
}
public int getRevTotalCost() {
	return revTotalCost;
}
public void setRevTotalCost(int revTotalCost) {
	this.revTotalCost = revTotalCost;
}
public int getRownum() {
	return rownum;
}
public void setRownum(int rownum) {
	this.rownum = rownum;
}
public int getRoomID() {
	return roomID;
}
public void setRoomID(int roomID) {
	this.roomID = roomID;
}
public String getRoomType() {
	return roomType;
}
public void setRoomType(String roomType) {
	this.roomType = roomType;
}
public int getRoomCost() {
	return roomCost;
}
public void setRoomCost(int roomCost) {
	this.roomCost = roomCost;
}
public String getRevName() {
	return revName;
}
public void setRevName(String revName) {
	this.revName = revName;
}
public String getRevTel() {
	return revTel;
}
public void setRevTel(String revTel) {
	this.revTel = revTel;
}
public String getRevRoomName() {
	return revRoomName;
}
public void setRevRoomName(String revRoomName) {
	this.revRoomName = revRoomName;
}


}//class
