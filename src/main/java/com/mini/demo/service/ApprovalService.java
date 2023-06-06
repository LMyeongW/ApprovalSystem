package com.mini.demo.service;

import java.util.List;

import com.mini.demo.vo.ApprovalVO;
import com.mini.demo.vo.UserVO;

public interface ApprovalService {

	List<UserVO> reviewlist(String departmentSelect);

	List<UserVO> approvelist(String departmentSelect);

	void approvalSubmit(ApprovalVO approvalvo);

	List<ApprovalVO> reviewWaitListGET(int sqlPostNum, int postNum, String REVIEW_KEY);

	int reviewlistCount(String REVIEW_KEY);
	
	List<ApprovalVO> reviewCompleteListGET(int sqlPostNum, int postNum, String REVIEW_KEY);
	
	int reviewCompleteListCount(String REVIEW_KEY);

	List<ApprovalVO> approveWaitListGET(int sqlPostNum, int postNum, String APPROVER_KEY);

	int approvelistCount(String APPROVER_KEY);
	
	List<ApprovalVO> approveCompleteListGET(int sqlPostNum, int postNum, String APPROVER_KEY);

	int approveCompleteListCount(String APPROVER_KEY);

	ApprovalVO registerDetail(int APPROVAL_PK);

	void reviewStatusWrite(ApprovalVO vo);

	void approveStatusWrite(ApprovalVO vo);

	int individualStatusListCount(String USER_NUM);

	List<ApprovalVO> individualStatusListGET(int sqlPostNum, int postNum, String USER_NUM);

	int approvalStatusCount(String USER_NUM);

	ApprovalVO individualDetail(int APPROVAL_PK);












}
