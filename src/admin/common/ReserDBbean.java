package admin.common;

import java.sql.Date;

public class ReserDBbean {
	private int revid;
	private String revname;
	private String revemail;
	private String revtel;
	private int revroomid;
	private int revtotalcost;
	private int revcap;
	private Date revin;
	private Date revout;
	private int revterm;
	public int getRevid() {
		return revid;
	}
	public void setRevid(int revid) {
		this.revid = revid;
	}
	public String getRevname() {
		return revname;
	}
	public void setRevname(String revname) {
		this.revname = revname;
	}
	public String getRevemail() {
		return revemail;
	}
	public void setRevemail(String revEmail) {
		this.revemail = revEmail;
	}
	public String getRevtel() {
		return revtel;
	}
	public void setRevtel(String revtel) {
		this.revtel = revtel;
	}
	public int getRevroomid() {
		return revroomid;
	}
	public void setRevroomid(int revroomid) {
		this.revroomid = revroomid;
	}
	public int getRevtotalcost() {
		return revtotalcost;
	}
	public void setRevtotalcost(int revtotalcost) {
		this.revtotalcost = revtotalcost;
	}
	public int getRevcap() {
		return revcap;
	}
	public void setRevcap(int revcap) {
		this.revcap = revcap;
	}
	public Date getRevin() {
		return revin;
	}
	public void setRevin(Date revin) {
		this.revin = revin;
	}
	public Date getRevout() {
		return revout;
	}
	public void setRevout(Date revout) {
		this.revout = revout;
	}
	public int getRevterm() {
		return revterm;
	}
	public void setRevterm(int revterm) {
		this.revterm = revterm;
	}
	public Date getRevdate() {
		return revdate;
	}
	public void setRevdate(Date revdate) {
		this.revdate = revdate;
	}
	private Date revdate;
	
}
