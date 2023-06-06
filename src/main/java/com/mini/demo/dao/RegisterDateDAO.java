package com.mini.demo.dao;

import com.mini.demo.vo.ApprovalVO;
import com.mini.demo.vo.ApprovaldateVO;
import com.mini.demo.vo.ReviewdateVO;

public interface RegisterDateDAO {
	
	void reviewInsert(ApprovalVO approvalvo);

	void approvalInsert(ApprovalVO approvalvo);

	int selectReviewDate(int APPROVAL_PK);

	void reviewOk(ReviewdateVO reviewdatevo);

	void reviewNo(ReviewdateVO reviewdatevo);

	void reviewWait(ReviewdateVO reviewdatevo);

	void approveWait(ApprovaldateVO approvaldatevo);

	void approveOk(ApprovaldateVO approvaldatevo);

	void approveNo(ApprovaldateVO approvaldatevo);



}
