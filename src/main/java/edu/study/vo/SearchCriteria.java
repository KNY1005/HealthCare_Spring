package edu.study.vo;

public class SearchCriteria extends CriteriaVO {
	private String searchType = "";
	private String keyWord = "";
	private String blist = "";
	public String getBlist() {
		return blist;
	}
	public void setBlist(String blist) {		
		this.blist = blist;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyWord=" + keyWord + "]";
	}
	
}
