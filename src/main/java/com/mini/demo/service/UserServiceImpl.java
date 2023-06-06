package com.mini.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.demo.dao.UserDAO;
import com.mini.demo.vo.UserVO;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired 
	private UserDAO userDao;

	@Override
	public UserVO login(UserVO uservo) {
		return userDao.login(uservo);
	}

	@Override
	public void userRegisterPost(UserVO uservo) {
		userDao.userRegisterPost(uservo);
		
	}

	@Override
	public UserVO passwordck(UserVO uservo) {
		return userDao.passwordck(uservo);
	}

	@Override
	public void passwordch(UserVO uservo) {
		userDao.passwordch(uservo);
	}

	@Override
	public List<UserVO> userConditionListGet(int sqlPostNum, int postNum) {
		return userDao.userConditionListGet(sqlPostNum, postNum);
	}

	@Override
	public int userConditionCount() {
		return userDao.userConditionCount();
	}

	@Override
	public UserVO userDetail(String USER_NUM) {
		return userDao.userDetail(USER_NUM);
	}

	@Override
	public void userUpdate(UserVO uservo) {
		userDao.userUpdate(uservo);
		
	}

	@Override
	public int numck(String USER_NUM) {
		return userDao.numck(USER_NUM);
	}


}
