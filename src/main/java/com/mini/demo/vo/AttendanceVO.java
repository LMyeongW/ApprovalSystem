package com.mini.demo.vo;

import java.util.Date;

public class AttendanceVO {
	
	private int ATTENDANCE_PK;
	private String ATTENDANCE_STATUS;
	private String USER_NAME;
	private String USER_NUM;
	private String ATTENDANCE_DATE;
	private String ATTENDANCE_TIME;
	private String DAY_OF_THE_WEEK;
	
	public int getATTENDANCE_PK() {
		return ATTENDANCE_PK;
	}
	public void setATTENDANCE_PK(int aTTENDANCE_PK) {
		ATTENDANCE_PK = aTTENDANCE_PK;
	}
	public String getATTENDANCE_STATUS() {
		return ATTENDANCE_STATUS;
	}
	public void setATTENDANCE_STATUS(String aTTENDANCE_STATUS) {
		ATTENDANCE_STATUS = aTTENDANCE_STATUS;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getUSER_NUM() {
		return USER_NUM;
	}
	public void setUSER_NUM(String uSER_NUM) {
		USER_NUM = uSER_NUM;
	}
	public String getATTENDANCE_DATE() {
		return ATTENDANCE_DATE;
	}
	public void setATTENDANCE_DATE(String aTTENDANCE_DATE) {
		ATTENDANCE_DATE = aTTENDANCE_DATE;
	}
	public String getATTENDANCE_TIME() {
		return ATTENDANCE_TIME;
	}
	public void setATTENDANCE_TIME(String aTTENDANCE_TIME) {
		ATTENDANCE_TIME = aTTENDANCE_TIME;
	}
	public String getDAY_OF_THE_WEEK() {
		return DAY_OF_THE_WEEK;
	}
	public void setDAY_OF_THE_WEEK(String dAY_OF_THE_WEEK) {
		DAY_OF_THE_WEEK = dAY_OF_THE_WEEK;
	}
	
	@Override
	public String toString() {
		return "AttendanceVO [ATTENDANCE_PK=" + ATTENDANCE_PK + ", ATTENDANCE_STATUS=" + ATTENDANCE_STATUS
				+ ", USER_NAME=" + USER_NAME + ", USER_NUM=" + USER_NUM + ", ATTENDANCE_DATE=" + ATTENDANCE_DATE
				+ ", ATTENDANCE_TIME=" + ATTENDANCE_TIME + ", DAY_OF_THE_WEEK=" + DAY_OF_THE_WEEK + "]";
	}
	
	
	
	
	

}
