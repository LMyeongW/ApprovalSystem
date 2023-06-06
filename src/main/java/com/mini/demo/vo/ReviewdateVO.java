package com.mini.demo.vo;

import java.util.Date;

public class ReviewdateVO {
	private int REVIEW_PK;
	private int APPROVAL_PK;
	private String REVIEWER;
	private Date REVIEW_DATE;
	private Date REVIEW_REFUSAL_DATE;
	private String REVIEW_STATUS;
	
	public int getREVIEW_PK() {
		return REVIEW_PK;
	}
	public void setREVIEW_PK(int rEVIEW_PK) {
		REVIEW_PK = rEVIEW_PK;
	}
	public int getAPPROVAL_PK() {
		return APPROVAL_PK;
	}
	public void setAPPROVAL_PK(int aPPROVAL_PK) {
		APPROVAL_PK = aPPROVAL_PK;
	}
	public String getREVIEWER() {
		return REVIEWER;
	}
	public void setREVIEWER(String rEVIEWER) {
		REVIEWER = rEVIEWER;
	}
	public Date getREVIEW_DATE() {
		return REVIEW_DATE;
	}
	public void setREVIEW_DATE(Date rEVIEW_DATE) {
		REVIEW_DATE = rEVIEW_DATE;
	}
	public Date getREVIEW_REFUSAL_DATE() {
		return REVIEW_REFUSAL_DATE;
	}
	public void setREVIEW_REFUSAL_DATE(Date rEVIEW_REFUSAL_DATE) {
		REVIEW_REFUSAL_DATE = rEVIEW_REFUSAL_DATE;
	}
	public String getREVIEW_STATUS() {
		return REVIEW_STATUS;
	}
	public void setREVIEW_STATUS(String rEVIEW_STATUS) {
		REVIEW_STATUS = rEVIEW_STATUS;
	}
	
	@Override
	public String toString() {
		return "ReviewdateVO [REVIEW_PK=" + REVIEW_PK + ", APPROVAL_PK=" + APPROVAL_PK + ", REVIEWER=" + REVIEWER
				+ ", REVIEW_DATE=" + REVIEW_DATE + ", REVIEW_REFUSAL_DATE=" + REVIEW_REFUSAL_DATE + ", REVIEW_STATUS="
				+ REVIEW_STATUS + "]";
	}
	


	
	
	

}
