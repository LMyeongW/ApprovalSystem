package com.mini.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mini.demo.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired 
	private SqlSession sql;
	
	private static String namespace="user";

	@Override
	public UserVO login(UserVO uservo) {
		return sql.selectOne(namespace+".login", uservo);
	}

	@Override
	public void userRegisterPost(UserVO uservo) {
		sql.insert(namespace+".userRegisterPost", uservo);
		
	}

	@Override
	public UserVO passwordck(UserVO uservo) {
		return sql.selectOne(namespace+".passwordck", uservo);
	}

	@Override
	public void passwordch(UserVO uservo) {
		sql.update(namespace+".passwordch", uservo);
	}

	@Override
	public List<UserVO> userConditionListGet(int sqlPostNum, int postNum) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace+".userConditionListGet",data);
	}

	@Override
	public int userConditionCount() {
		return sql.selectOne(namespace+".userConditionCount");
	}

	@Override
	public UserVO userDetail(String USER_NUM) {
		return sql.selectOne(namespace+".userDetail", USER_NUM);
	}

	@Override
	public void userUpdate(UserVO uservo) {
		sql.update(namespace+".userUpdate", uservo);
	}


	@Override
	public int numck(String USER_NUM) {
		return sql.selectOne(namespace+".numck", USER_NUM);
	}
}
