package edu.study.vo;

public class MemberVo {
	private int midx;
	private String mid;
	private String mname;
	private String mpwd;
	private int mphone;
	private String mlvl;
	private String mgrade;
	private String mdelyn;
	private String menter;
	private String mmdate;
	private String mbreakdate;
	private int mcnt;
	private String mip;
	private String memail;
	
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}

	public int getMphone() {
		return mphone;
	}
	public void setMphone(int mphone) {
		this.mphone = mphone;
	}
	public String getMlvl() {
		return mlvl;
	}
	public void setMlvl(String mlvl) {
		this.mlvl = mlvl;
	}
	public String getMgrade() {
		return mgrade;
	}
	public void setMgrade(String mgrade) {
		this.mgrade = mgrade;
	}
	public String getMdelyn() {
		return mdelyn;
	}
	public void setMdelyn(String mdelyn) {
		this.mdelyn = mdelyn;
	}
	public String getMenter() {
		return menter;
	}
	public void setMenter(String menter) {
		this.menter = menter;
	}
	public String getMmdate() {
		return mmdate;
	}
	public void setMmdate(String mmdate) {
		this.mmdate = mmdate;
	}
	public String getMbreakdate() {
		return mbreakdate;
	}
	public void setMbreakdate(String mbreakdate) {
		this.mbreakdate = mbreakdate;
	}
	public int getMcnt() {
		return mcnt;
	}
	public void setMcnt(int mcnt) {
		this.mcnt = mcnt;
	}
	public String getMip() {
		return mip;
	}
	public void setMip(String mip) {
		this.mip = mip;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	
	@Override
	public String toString() {
		return "MemberVo [midx=" + midx + ", mid=" + mid + ", mname=" + mname + ", mpwd=" + mpwd + ", mphone=" + mphone
				+ ", mlvl=" + mlvl + ", mgrade=" + mgrade + ", mdelyn=" + mdelyn + ", menter=" + menter + ", mmdate="
				+ mmdate + ", mbreakdate=" + mbreakdate + ", mcnt=" + mcnt + ", mip=" + mip + ", memail=" + memail
				+ "]";
	}
	
	
}
	