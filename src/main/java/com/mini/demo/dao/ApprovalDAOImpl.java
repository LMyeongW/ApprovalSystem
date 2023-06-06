package com.mini.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mini.demo.vo.ApprovalVO;
import com.mini.demo.vo.UserVO;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO{
	
	@Autowired 
	private SqlSession sql;
	
	private static String namespace="approval";


	@Override
	public List<UserVO> reviewlist(String departmentSelect) {
		return sql.selectList(namespace+".reviewlist",departmentSelect);
	}

	@Override
	public List<UserVO> approvelist(String departmentSelect) {
		return sql.selectList(namespace+".approvelist",departmentSelect);
	}

	@Override
	public void approvalSubmit(ApprovalVO approvalvo) {
		sql.insert(namespace+".approvalSubmit",approvalvo);
	}

	@Override
	public List<ApprovalVO> reviewWaitListGET(int sqlPostNum, int postNum, String REVIEW_KEY) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("REVIEW_KEY", REVIEW_KEY);
		
		return sql.selectList(namespace+".reviewWaitListGET",data);
	}

	@Override
	public int reviewlistCount(String REVIEW_KEY) {
		return sql.selectOne(namespace+".reviewlistCount",REVIEW_KEY);
	}
	
	@Override
	public List<ApprovalVO> reviewCompleteListGET(int sqlPostNum, int postNum, String REVIEW_KEY) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("REVIEW_KEY", REVIEW_KEY);
		return sql.selectList(namespace+".reviewCompleteListGET",data);
	}

	@Override
	public int reviewCompleteListCount(String REVIEW_KEY) {
		return sql.selectOne(namespace+".reviewCompleteListCount",REVIEW_KEY);
	}

	@Override
	public List<ApprovalVO> approveWaitListGET(int sqlPostNum, int postNum, String APPROVER_KEY) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("APPROVER_KEY", APPROVER_KEY);
		
		return sql.selectList(namespace+".approveWaitListGET",data);
	}

	@Override
	public int approvelistCount(String APPROVER_KEY) {
		return sql.selectOne(namespace+".approvelistCount",APPROVER_KEY);
	}

	@Override
	public List<ApprovalVO> approveCompleteListGET(int sqlPostNum, int postNum, String APPROVER_KEY) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("APPROVER_KEY", APPROVER_KEY);
		
		return sql.selectList(namespace+".approveCompleteListGET",data);
	}

	@Override
	public int approveCompleteListCount(String APPROVER_KEY) {
		return sql.selectOne(namespace+".approveCompleteListCount",APPROVER_KEY);
	}

	@Override
	public ApprovalVO registerDetail(int APPROVAL_PK) {
		return sql.selectOne(namespace+".registerDetail",APPROVAL_PK);
	}

	@Override
	public void reviewStatusWrite(ApprovalVO vo) {
		sql.update(namespace+".reviewStatusWrite",vo);
	}

	@Override
	public void approveStatusWrite(ApprovalVO vo) {
		sql.update(namespace+".approveStatusWrite",vo);
		
	}

	@Override
	public int individualStatusListCount(String USER_NUM) {
		return sql.selectOne(namespace+".individualStatusListCount",USER_NUM);
	}

	@Override
	public List<ApprovalVO> individualStatusListGET(int sqlPostNum, int postNum, String USER_NUM) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		data.put("USER_NUM", USER_NUM);
		
		return sql.selectList(namespace+".individualStatusListGET",data);
	}

	@Override
	public int approvalStatusCount(String USER_NUM) {
		return sql.selectOne(namespace+".approvalStatusCount",USER_NUM);
	}

	@Override
	public ApprovalVO individualDetail(int APPROVAL_PK) {
		return sql.selectOne(namespace+".individualDetail",APPROVAL_PK);
	}







}
