package com.mini.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.demo.dao.RegisterDateDAO;
import com.mini.demo.vo.ApprovalVO;
import com.mini.demo.vo.ApprovaldateVO;
import com.mini.demo.vo.ReviewdateVO;

@Service
public class RegisterDateServiceImpl implements RegisterDateService{
	
	@Autowired
	private RegisterDateDAO registerDateDao;
	
	
	@Override
	public void reviewInsert(ApprovalVO approvalvo) {
		registerDateDao.reviewInsert(approvalvo);	
	}

	@Override
	public void approvalInsert(ApprovalVO approvalvo) {
		registerDateDao.approvalInsert(approvalvo);	
	}
	@Override
	public int selectReviewDate(int APPROVAL_PK) {
		return registerDateDao.selectReviewDate(APPROVAL_PK);
	}

	@Override
	public void reviewOk(ReviewdateVO reviewdatevo) {
		registerDateDao.reviewOk(reviewdatevo);	
	}

	@Override
	public void reviewNo(ReviewdateVO reviewdatevo) {
		registerDateDao.reviewNo(reviewdatevo);	
	}

	@Override
	public void reviewWait(ReviewdateVO reviewdatevo) {
		registerDateDao.reviewWait(reviewdatevo);
	}

	@Override
	public void approveWait(ApprovaldateVO approvaldatevo) {
		registerDateDao.approveWait(approvaldatevo);
	}

	@Override
	public void approveOk(ApprovaldateVO approvaldatevo) {
		registerDateDao.approveOk(approvaldatevo);
	}

	@Override
	public void approveNo(ApprovaldateVO approvaldatevo) {
		registerDateDao.approveNo(approvaldatevo);
	}


	
	
}
