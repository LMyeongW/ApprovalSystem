package com.mini.demo.dao;

import java.util.List;

import com.mini.demo.vo.AttendanceListVO;
import com.mini.demo.vo.AttendanceVO;

public interface AttendanceDAO {

	int attendanceCheck(AttendanceVO attendancevo);

	void attendacePost(AttendanceVO attendancevo);

	int totalcount(String USER_NUM);

	List<AttendanceListVO> attendanceListGet(int sqlPostNum, int postNum, String USER_NUM);

	int allTotalcount(String searchKeyword,  String dapartment, String grade);

	List<AttendanceListVO> attendanceAllListGet(int sqlPostNum, int postNum, String searchKeyword, String dapartment, String grade);

}
