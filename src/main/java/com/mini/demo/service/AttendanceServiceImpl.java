package com.mini.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.demo.dao.AttendanceDAO;
import com.mini.demo.vo.AttendanceListVO;
import com.mini.demo.vo.AttendanceVO;

@Service
public class AttendanceServiceImpl implements AttendanceService{
	
	@Autowired
	private AttendanceDAO attendanceDao;
	
	
	@Override
	public int attendanceCheck(AttendanceVO attendancevo) {
		return attendanceDao.attendanceCheck(attendancevo);
	}


	@Override
	public void attendacePost(AttendanceVO attendancevo) {
		attendanceDao.attendacePost(attendancevo);
	}


	@Override
	public int totalcount(String USER_NUM) {
		return attendanceDao.totalcount(USER_NUM);
	}


	@Override
	public List<AttendanceListVO> attendanceListGet(int sqlPostNum, int postNum, String USER_NUM) {
		return attendanceDao.attendanceListGet(sqlPostNum, postNum, USER_NUM);
	}


	@Override
	public int allTotalcount(String searchKeyword, String dapartment, String grade) {
		return attendanceDao.allTotalcount(searchKeyword, dapartment, grade);
	}


	@Override
	public List<AttendanceListVO> attendanceAllListGet(int sqlPostNum, int postNum, String searchKeyword, String dapartment, String grade) {
		return attendanceDao.attendanceAllListGet(sqlPostNum, postNum, searchKeyword, dapartment, grade);
	}

}
