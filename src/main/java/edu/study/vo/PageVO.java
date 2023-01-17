package edu.study.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class PageVO {
	 private int totalCount;
	 private int startPage;
	 private int endPage;
	 private boolean prev;
	 private boolean next;

	 private int displayPageNum = 10;

	 private SearchCriteria scri;
	 
	 public void setTotalCount(int totalCount) {
		  this.totalCount = totalCount;
		  calcData();
		 }

		 public int getTotalCount() {
		  return totalCount;
		 }

		 public int getStartPage() {
		  return startPage;
		 }

		 public int getEndPage() {
		  return endPage;
		 }

		 public boolean isPrev() {
		  return prev;
		 }

		 public boolean isNext() {
		  return next;
		 }

		 public int getDisplayPageNum() {
		  return displayPageNum;
		 }

		 
		 
		 public SearchCriteria getScri() {
			return scri;
		}

		public void setScri(SearchCriteria scri) {
			this.scri = scri;
		}

		private void calcData() {
		  endPage = (int) (Math.ceil(scri.getPage() / (double)displayPageNum) * displayPageNum);
		  startPage = (endPage - displayPageNum) + 1;
		  
		  int tempEndPage = (int) (Math.ceil(totalCount / (double)scri.getPerPageNum()));
		  if (endPage > tempEndPage)
		  {
		   endPage = tempEndPage;
		  }
		  prev = startPage == 1 ? false : true;
		  next = endPage * scri.getPerPageNum() >= totalCount ? false : true;
		 }
		 
		public String encoding(String keyword) {
			String str = "";
			
			try {
				str = URLEncoder.encode(keyword,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				
				e.printStackTrace();
			}
			
			return str;
		}
}
