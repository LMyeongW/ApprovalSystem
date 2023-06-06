package com.mini.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mini.demo.vo.AttendanceListVO;
import com.mini.demo.vo.AttendanceVO;

@Repository
public class AttendanceDAOImpl implements AttendanceDAO{
	
	@Autowired 
	private SqlSession sql;
	
	private static String namespace="attendance";

	@Override
	public int attendanceCheck(AttendanceVO attendancevo) {
		
		return sql.selectOne(namespace + ".attendanceCheck", attendancevo);
	}

	@Override
	public void attendacePost(AttendanceVO attendancevo) {
		sql.insert(namespace + ".attendacePost", attendancevo);
		
	}

	@Override
	public int totalcount(String USER_NUM) {	
		return sql.selectOne(namespace + ".totalcount", USER_NUM);
	}

	@Override
	public List<AttendanceListVO> attendanceListGet(int sqlPostNum, int postNum, String USER_NUM) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("USER_NUM", USER_NUM);
		
		return sql.selectList(namespace + ".attendanceListGet", data);
	}

	@Override
	public int allTotalcount(String searchKeyword, String dapartment, String grade) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("searchKeyword", searchKeyword);
		data.put("dapartment", dapartment);
		data.put("grade", grade);
		
		return sql.selectOne(namespace + ".allTotalcount", data);
	}

	@Override
	public List<AttendanceListVO> attendanceAllListGet(int sqlPostNum, int postNum, String searchKeyword, String dapartment, String grade) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("searchKeyword", searchKeyword);
		data.put("dapartment", dapartment);
		data.put("grade", grade);
		
		return sql.selectList(namespace + ".attendanceAllListGet", data);
	}
}
