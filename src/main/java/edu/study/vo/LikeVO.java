package edu.study.vo;

public class LikeVO {
	
	@Override
	public String toString() {
		return "LikeVO [likeno=" + likeno + ", pidx=" + pidx + ", midx=" + midx + ", like_check=" + like_check + "]";
	}
	public int getLikeno() {
		return likeno;
	}
	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}
	public int getPidx() {
		return pidx;
	}
	public void setPidx(int pidx) {
		this.pidx = pidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	private int likeno;
	private int pidx;
	private int midx;
	private int like_check;
	

}
