package edu.study.vo;

public class ReserveVo {
	private int ridx;
	private String rcase;
	private String rhospital;
	private String rname;
	private String rdate;
	private String rtime;
	private String rbuy;
	private int midx;
	private String rstate;
	
	public String getRstate() {
		return rstate;
	}
	public void setRstate(String rstate) {
		this.rstate = rstate;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public String getRcase() {
		return rcase;
	}
	public void setRcase(String rcase) {
		this.rcase = rcase;
	}
	public String getRhospital() {
		return rhospital;
	}
	public void setRhospital(String rhospital) {
		this.rhospital = rhospital;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public String getRbuy() {
		return rbuy;
	}
	public void setRbuy(String rbuy) {
		this.rbuy = rbuy;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	@Override
	public String toString() {
		return "ReserveVo [ridx=" + ridx + ", rcase=" + rcase + ", rhospital=" + rhospital + ", rname=" + rname
				+ ", rdate=" + rdate + ", rtime=" + rtime + ", rbuy=" + rbuy + ", midx=" + midx + "]";
	}
	
	
	
	
	
}
