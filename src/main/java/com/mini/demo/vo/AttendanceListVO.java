package com.mini.demo.vo;

public class AttendanceListVO {
	
	private String USER_NAME;
	private String USER_GRADE;
	private String USER_DEPARTMENT;
	private String ATTENDANCE_STATUS;
	private String USER_NUM;
	private String ATTENDANCE_DATE;
	private String ATTENDANCE_TIME;
	private String DAY_OF_THE_WEEK;
	
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getUSER_GRADE() {
		return USER_GRADE;
	}
	public void setUSER_GRADE(String uSER_GRADE) {
		USER_GRADE = uSER_GRADE;
	}
	public String getUSER_DEPARTMENT() {
		return USER_DEPARTMENT;
	}
	public void setUSER_DEPARTMENT(String uSER_DEPARTMENT) {
		USER_DEPARTMENT = uSER_DEPARTMENT;
	}
	public String getATTENDANCE_STATUS() {
		return ATTENDANCE_STATUS;
	}
	public void setATTENDANCE_STATUS(String aTTENDANCE_STATUS) {
		ATTENDANCE_STATUS = aTTENDANCE_STATUS;
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
		return "AttendanceListVO [USER_NAME=" + USER_NAME + ", USER_GRADE=" + USER_GRADE + ", USER_DEPARTMENT="
				+ USER_DEPARTMENT + ", ATTENDANCE_STATUS=" + ATTENDANCE_STATUS + ", USER_NUM=" + USER_NUM
				+ ", ATTENDANCE_DATE=" + ATTENDANCE_DATE + ", ATTENDANCE_TIME=" + ATTENDANCE_TIME + ", DAY_OF_THE_WEEK="
				+ DAY_OF_THE_WEEK + "]";
	}
	
	
	
}
