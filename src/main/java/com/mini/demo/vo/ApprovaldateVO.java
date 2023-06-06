package com.mini.demo.vo;

import java.util.Date;

public class ApprovaldateVO {
	private int APPROVER_PK;
	private int APPROVAL_PK;
	private String APPROVER;
	private Date APPROVE_DATE;
	private Date APPROVE_REFUSAL_DATE;
	private String APPROVE_STATUS;
	
	public int getAPPROVER_PK() {
		return APPROVER_PK;
	}
	public void setAPPROVER_PK(int aPPROVER_PK) {
		APPROVER_PK = aPPROVER_PK;
	}
	public int getAPPROVAL_PK() {
		return APPROVAL_PK;
	}
	public void setAPPROVAL_PK(int aPPROVAL_PK) {
		APPROVAL_PK = aPPROVAL_PK;
	}
	public String getAPPROVER() {
		return APPROVER;
	}
	public void setAPPROVER(String aPPROVER) {
		APPROVER = aPPROVER;
	}
	public Date getAPPROVE_DATE() {
		return APPROVE_DATE;
	}
	public void setAPPROVE_DATE(Date aPPROVE_DATE) {
		APPROVE_DATE = aPPROVE_DATE;
	}
	public Date getAPPROVE_REFUSAL_DATE() {
		return APPROVE_REFUSAL_DATE;
	}
	public void setAPPROVE_REFUSAL_DATE(Date aPPROVE_REFUSAL_DATE) {
		APPROVE_REFUSAL_DATE = aPPROVE_REFUSAL_DATE;
	}
	public String getAPPROVE_STATUS() {
		return APPROVE_STATUS;
	}
	public void setAPPROVE_STATUS(String aPPROVE_STATUS) {
		APPROVE_STATUS = aPPROVE_STATUS;
	}
	
	@Override
	public String toString() {
		return "ApprovaldateVO [APPROVER_PK=" + APPROVER_PK + ", APPROVAL_PK=" + APPROVAL_PK + ", APPROVER=" + APPROVER
				+ ", APPROVE_DATE=" + APPROVE_DATE + ", APPROVE_REFUSAL_DATE=" + APPROVE_REFUSAL_DATE
				+ ", APPROVE_STATUS=" + APPROVE_STATUS + "]";
	}
	

	
	
	
	
	
	
}
