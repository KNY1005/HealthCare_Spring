package edu.study.vo;

public class BoardVo {
	private int bidx;
	private int boriginbidx;
	private int bdepth;
	private int blvl;
	private String blist;
	private String bcategory;
	private String btitle;
	private String bwriter;
	private String bcontent;
	private String bwdate;
	private String brewdate;
	private String bstate;
	private String bmdate;
	private String bdelete;
	private String bsecret;
	private Integer bhit;
	private String mname;
	private int midx;
	
	
	
	
	public Integer getBhit() {
		return bhit;
	}
	public void setBhit(Integer bhit) {
		this.bhit = bhit;
	}
	
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public int getBoriginbidx() {
		return boriginbidx;
	}
	public void setBoriginbidx(int boriginbidx) {
		this.boriginbidx = boriginbidx;
	}
	public int getBdepth() {
		return bdepth;
	}
	public void setBdepth(int bdepth) {
		this.bdepth = bdepth;
	}
	public int getBlvl() {
		return blvl;
	}
	public void setBlvl(int blvl) {
		this.blvl = blvl;
	}
	public String getBlist() {
		return blist;
	}
	public void setBlist(String blist) {
		this.blist = blist;
	}
	public String getBcategory() {
		return bcategory;
	}
	public void setBcategory(String bcategory) {
		this.bcategory = bcategory;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBwdate() {
		return bwdate;
	}
	public void setBwdate(String bwdate) {
		this.bwdate = bwdate;
	}
	public String getBrewdate() {
		return brewdate;
	}
	public void setBrewdate(String brewdate) {
		this.brewdate = brewdate;
	}
	public String getBstate() {
		return bstate;
	}
	public void setBstate(String bstate) {
		this.bstate = bstate;
	}
	public String getBmdate() {
		return bmdate;
	}
	public void setBmdate(String bmdate) {
		this.bmdate = bmdate;
	}
	public String getBdelete() {
		return bdelete;
	}
	public void setBdelete(String bdelete) {
		this.bdelete = bdelete;
	}
	public String getBsecret() {
		return bsecret;
	}
	public void setBsecret(String bsecret) {
		this.bsecret = bsecret;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	
	@Override
	public String toString() {
		return "BoardVo [bidx=" + bidx + ", boriginbidx=" + boriginbidx + ", bdepth=" + bdepth + ", blvl=" + blvl
				+ ", blist=" + blist + ", bcategory=" + bcategory + ", btitle=" + btitle + ", bcontent=" + bcontent
				+ ", bwdate=" + bwdate + ", brewdate=" + brewdate + ", bstate=" + bstate + ", bmdate=" + bmdate
				+ ", bdelete=" + bdelete + ", bsecret=" + bsecret + ", midx=" + midx + "]";
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	
	
}
