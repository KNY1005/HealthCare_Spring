package edu.study.vo;

public class ShotVo {

	private int cd;
	private String cdNm;
	private String cdDate;
	private int cdCount;
	private String cdFC;
	private String cdCharge;
	
	
	public int getCd() {
		return cd;
	}
	public void setCd(int cd) {
		this.cd = cd;
	}
	public String getCdNm() {
		return cdNm;
	}
	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}
	public String getCdDate() {
		return cdDate;
	}
	public void setCdDate(String cdDate) {
		this.cdDate = cdDate;
	}
	public int getCdCount() {
		return cdCount;
	}
	public void setCdCount(int cdCount) {
		this.cdCount = cdCount;
	}
	public String getCdFC() {
		return cdFC;
	}
	public void setCdFC(String cdFC) {
		this.cdFC = cdFC;
	}
	public String getCdCharge() {
		return cdCharge;
	}
	public void setCdCharge(String cdCharge) {
		this.cdCharge = cdCharge;
	}
	
	@Override
	public String toString() {
		return "ShotVo [cd=" + cd + ", cdNm=" + cdNm + ", cdDate=" + cdDate + ", cdCount=" + cdCount + ", cdFC=" + cdFC
				+ ", cdCharge=" + cdCharge + "]";
	}
	
	
	
}
