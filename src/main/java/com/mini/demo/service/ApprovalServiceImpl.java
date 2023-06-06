package com.mini.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.demo.dao.ApprovalDAO;
import com.mini.demo.vo.ApprovalVO;
import com.mini.demo.vo.UserVO;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	
	@Autowired
	private ApprovalDAO approvalDao;

	@Override
	public List<UserVO> reviewlist(String departmentSelect) {
		return approvalDao.reviewlist(departmentSelect);
	}

	@Override
	public List<UserVO> approvelist(String departmentSelect) {
		return approvalDao.approvelist(departmentSelect);
	}

	@Override
	public void approvalSubmit(ApprovalVO approvalvo) {
		approvalDao.approvalSubmit(approvalvo);
	}
	
	@Override
	public List<ApprovalVO> reviewWaitListGET(int sqlPostNum, int postNum, String REVIEW_KEY) {
		return approvalDao.reviewWaitListGET(sqlPostNum, postNum, REVIEW_KEY);
	}
	
	@Override
	public int reviewlistCount(String REVIEW_KEY) {
		return approvalDao.reviewlistCount(REVIEW_KEY);
	}
	
	@Override
	public List<ApprovalVO> reviewCompleteListGET(int sqlPostNum, int postNum, String REVIEW_KEY) {
		return approvalDao.reviewCompleteListGET(sqlPostNum, postNum, REVIEW_KEY);
	}

	@Override
	public int reviewCompleteListCount(String REVIEW_KEY) {
		return approvalDao.reviewCompleteListCount(REVIEW_KEY);
	}

	@Override
	public List<ApprovalVO> approveWaitListGET(int sqlPostNum, int postNum, String APPROVER_KEY) {
		return approvalDao.approveWaitListGET(sqlPostNum, postNum, APPROVER_KEY);
	}

	@Override
	public int approvelistCount(String APPROVER_KEY) {
		return approvalDao.approvelistCount(APPROVER_KEY);
	}

	@Override
	public List<ApprovalVO> approveCompleteListGET(int sqlPostNum, int postNum, String APPROVER_KEY) {
		return approvalDao.approveCompleteListGET(sqlPostNum, postNum, APPROVER_KEY);
	}

	@Override
	public int approveCompleteListCount(String APPROVER_KEY) {
		return approvalDao.approveCompleteListCount(APPROVER_KEY);
	}

	@Override
	public ApprovalVO registerDetail(int APPROVAL_PK) {
		return approvalDao.registerDetail(APPROVAL_PK);
	}

	@Override
	public void reviewStatusWrite(ApprovalVO vo) {
		approvalDao.reviewStatusWrite(vo);
	}

	@Override
	public void approveStatusWrite(ApprovalVO vo) {
		approvalDao.approveStatusWrite(vo);
	}

	@Override
	public int individualStatusListCount(String USER_NUM) {
		return approvalDao.individualStatusListCount(USER_NUM);
	}

	@Override
	public List<ApprovalVO> individualStatusListGET(int sqlPostNum, int postNum, String USER_NUM) {
		return approvalDao.individualStatusListGET(sqlPostNum, postNum, USER_NUM);
	}

	@Override
	public int approvalStatusCount(String USER_NUM) {
		return approvalDao.approvalStatusCount(USER_NUM);
	}

	@Override
	public ApprovalVO individualDetail(int APPROVAL_PK) {
		return approvalDao.individualDetail(APPROVAL_PK);
	}









}
