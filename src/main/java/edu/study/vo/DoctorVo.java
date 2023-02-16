package edu.study.vo;

public class DoctorVo {

	private int didx;
	private String ddoctor;
	
	public int getDidx() {
		return didx;
	}
	public void setDidx(int didx) {
		this.didx = didx;
	}
	public String getDdoctor() {
		return ddoctor;
	}
	public void setDdoctor(String ddoctor) {
		this.ddoctor = ddoctor;
	}
	@Override
	public String toString() {
		return "DoctorVo [didx=" + didx + ", ddoctor=" + ddoctor + "]";
	}
	
	
	
}
