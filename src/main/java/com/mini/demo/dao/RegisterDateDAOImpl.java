package com.mini.demo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mini.demo.vo.ApprovalVO;
import com.mini.demo.vo.ApprovaldateVO;
import com.mini.demo.vo.ReviewdateVO;

@Repository
public class RegisterDateDAOImpl implements RegisterDateDAO{
	
	@Autowired 
	private SqlSession sql;
	
	private static String namespace="registerdate";
	
	@Override
	public void reviewInsert(ApprovalVO approvalvo) {
		sql.insert(namespace + ".reviewInsert", approvalvo);
	}

	@Override
	public void approvalInsert(ApprovalVO approvalvo) {
		sql.insert(namespace + ".approvalInsert", approvalvo);
	}

	@Override
	public int selectReviewDate(int APPROVAL_PK) {
		
		return sql.selectOne(namespace + ".selectReviewDate", APPROVAL_PK);
	}


	@Override
	public void reviewOk(ReviewdateVO reviewdatevo) {
		sql.insert(namespace + ".reviewOk", reviewdatevo);
		
	}

	@Override
	public void reviewNo(ReviewdateVO reviewdatevo) {
		sql.insert(namespace + ".reviewNo", reviewdatevo);
		
	}

	@Override
	public void reviewWait(ReviewdateVO reviewdatevo) {
		sql.update(namespace + ".reviewWait", reviewdatevo);
		
	}

	@Override
	public void approveWait(ApprovaldateVO approvaldatevo) {
		sql.update(namespace + ".approveWait", approvaldatevo);
	}


	@Override
	public void approveOk(ApprovaldateVO approvaldatevo) {
		sql.insert(namespace + ".approveOk", approvaldatevo);
	}


	@Override
	public void approveNo(ApprovaldateVO approvaldatevo) {
		sql.insert(namespace + ".approveNo", approvaldatevo);
	}



}
