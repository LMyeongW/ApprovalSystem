package com.mini.demo.service;

import java.util.List;

import com.mini.demo.vo.AttendanceListVO;
import com.mini.demo.vo.AttendanceVO;

public interface AttendanceService {

	int attendanceCheck(AttendanceVO attendancevo);

	void attendacePost(AttendanceVO attendancevo);

	int totalcount(String uSER_NUM);

	List<AttendanceListVO> attendanceListGet(int sqlPostNum, int postNum, String USER_NUM);

	int allTotalcount(String searchKeyword, String dapartment, String grade);

	List<AttendanceListVO> attendanceAllListGet(int sqlPostNum, int postNum, String searchKeyword, String dapartment, String grade);

}
