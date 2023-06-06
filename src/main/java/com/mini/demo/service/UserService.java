package com.mini.demo.service;

import java.util.List;

import com.mini.demo.vo.UserVO;

public interface UserService {

	UserVO login(UserVO uservo);

	void userRegisterPost(UserVO uservo);

	UserVO passwordck(UserVO uservo);

	void passwordch(UserVO uservo);

	List<UserVO> userConditionListGet(int sqlPostNum, int postNum);

	int userConditionCount();

	UserVO userDetail(String USER_NUM);

	void userUpdate(UserVO uservo);

	int numck(String USER_NUM);

}
