package com.mini.demo.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mini.demo.service.ApprovalService;
import com.mini.demo.service.RegisterDateService;
import com.mini.demo.vo.ApprovalVO;
import com.mini.demo.vo.ApprovaldateVO;
import com.mini.demo.vo.Page;
import com.mini.demo.vo.ReviewdateVO;
import com.mini.demo.vo.UserVO;

@Controller
@RequestMapping("/mtsystem")
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;
	
	@Autowired
	private RegisterDateService registerDateService;
	
	/*결재신청페이지*/
	@GetMapping("approvalWrite")
	public ModelAndView approvalWrite() {
		return new ModelAndView("/approvalPage/approvalWrite");
	}
	
	
	/*검토/승인자 체크리스트*/
	@GetMapping("/selectList")
	public ModelAndView selectList(
			@ModelAttribute("departmentSelect")String departmentSelect
			) {
		ModelAndView mav = new ModelAndView();
		
		List<UserVO> reviewlist = approvalService.reviewlist(departmentSelect);
		List<UserVO> approvelist = approvalService.approvelist(departmentSelect);
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("reviewlist", reviewlist);
		data.put("approvelist", approvelist);
		
		mav.addObject("data", data);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*결재신청*/
	@RequestMapping(value ="approvalSubmit", method = RequestMethod.POST)
	public ModelAndView approvalSubmit(ApprovalVO approvalvo) {
		ModelAndView mav = new ModelAndView();
		
		approvalService.approvalSubmit(approvalvo);

		//검토날 insert
		registerDateService.reviewInsert(approvalvo);
		
		//승인날 insert
		registerDateService.approvalInsert(approvalvo);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*검토 대기현황 리스트*/
	@GetMapping("reviewWaitList")
	public ModelAndView reviewWaitList() {
		
		return new ModelAndView("/approvalPage/reviewWaitList");
	}
	
	/*검토 대기현황 리스트*/
	@GetMapping("/reviewWaitList.do")
	public ModelAndView reviewWaitListGET(@ModelAttribute("USER_NUM")String USER_NUM,
			@RequestParam(value="num", defaultValue = "1")int num
			) {
		ModelAndView mav = new ModelAndView();
			
		ApprovalVO approvo = new ApprovalVO();
		
		approvo.setREVIEW_KEY(USER_NUM);
		
		String REVIEW_KEY = approvo.getREVIEW_KEY();
		
		int reviewlistCount = approvalService.reviewlistCount(REVIEW_KEY);
		Page page = new Page();
		
		int postNum = 5;
		page.setPostNum(postNum);
		page.setPageNum_cnt(postNum);
		page.setNum(num);
		page.setTotalCount(approvalService.reviewlistCount(REVIEW_KEY));
		
		
		List<ApprovalVO> reviewlist = approvalService.reviewWaitListGET(page.getSqlPostNum(), page.getPostNum(),REVIEW_KEY);
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("reviewlist", reviewlist);
		data.put("reviewlistCount", reviewlistCount);
		data.put("page", page);
		data.put("select", num);
		
		mav.addObject("data", data);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*검토 대기완료 리스트 페이지*/
	@GetMapping("reviewCompleteList")
	public ModelAndView reviewCompleteList() {
		
		return new ModelAndView("/approvalPage/reviewCompleteList");
	}
	
	/*검토 대기완료 리스트*/
	@GetMapping("/reviewCompleteList.do")
	public ModelAndView reviewCompleteListGET(@ModelAttribute("USER_NUM")String USER_NUM,
			@RequestParam(value="num", defaultValue = "1")int num
			) {
		ModelAndView mav = new ModelAndView();

		ApprovalVO approvo = new ApprovalVO();
		
		approvo.setREVIEW_KEY(USER_NUM);
		
		String REVIEW_KEY = approvo.getREVIEW_KEY();
		
		int reviewCompleteListCount = approvalService.reviewCompleteListCount(REVIEW_KEY);
		Page page = new Page();
		
		int postNum = 5;
		page.setPostNum(postNum);
		page.setPageNum_cnt(postNum);
		page.setNum(num);
		page.setTotalCount(approvalService.reviewCompleteListCount(REVIEW_KEY));
		
		
		List<ApprovalVO> reviewCompleteList = approvalService.reviewCompleteListGET(page.getSqlPostNum(), page.getPostNum(),REVIEW_KEY);
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("reviewCompleteList", reviewCompleteList);
		data.put("reviewCompleteListCount", reviewCompleteListCount);
		data.put("page", page);
		data.put("select", num);
		
		mav.addObject("data", data);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*승인 대기현황 리스트 페이지*/
	@GetMapping("approveWaitList")
	public ModelAndView approveWaitList() {
		
		return new ModelAndView("/approvalPage/approveWaitList");
	}
	

	/*승인 대기현황 리스트*/
	@GetMapping("/approveWaitList.do")
	public ModelAndView approveWaitListGET(@ModelAttribute("USER_NUM")String USER_NUM,
			@RequestParam(value="num", defaultValue = "1")int num
			) {
		ModelAndView mav = new ModelAndView();
		
		ApprovalVO approvo = new ApprovalVO();
		
		approvo.setAPPROVER_KEY(USER_NUM);
		
		String APPROVER_KEY = approvo.getAPPROVER_KEY();
		
		int approvelistCount = approvalService.approvelistCount(APPROVER_KEY);
		Page page = new Page();
		
		int postNum = 5;
		page.setPostNum(postNum);
		page.setPageNum_cnt(postNum);
		page.setNum(num);
		page.setTotalCount(approvalService.approvelistCount(APPROVER_KEY));
		
		List<ApprovalVO> approvelist = approvalService.approveWaitListGET(page.getSqlPostNum(), page.getPostNum(), APPROVER_KEY);
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("approvelist", approvelist);
		data.put("approvelistCount", approvelistCount);
		data.put("page", page);
		data.put("select", num);
		
		mav.addObject("data", data);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*승인 완료 리스트*/
	@GetMapping("approveCompleteList")
	public ModelAndView approveCompleteList() {
		
		return new ModelAndView("/approvalPage/approveCompleteList");
	}
	
	/*승인 완료 리스트*/
	@GetMapping("/approveCompleteList.do")
	public ModelAndView approveCompleteListGET(@ModelAttribute("USER_NUM")String USER_NUM,
			@RequestParam(value="num", defaultValue = "1")int num
			) {
		ModelAndView mav = new ModelAndView();
		
		ApprovalVO approvo = new ApprovalVO();
		
		approvo.setAPPROVER_KEY(USER_NUM);
		
		String APPROVER_KEY = approvo.getAPPROVER_KEY();
		
		int approveCompleteListCount = approvalService.approveCompleteListCount(APPROVER_KEY);
		Page page = new Page();
		
		int postNum = 5;
		page.setPostNum(postNum);
		page.setPageNum_cnt(postNum);
		page.setNum(num);
		page.setTotalCount(approveCompleteListCount);
		List<ApprovalVO> approveCompleteList = approvalService.approveCompleteListGET(page.getSqlPostNum(), page.getPostNum(), APPROVER_KEY);
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("approveCompleteList", approveCompleteList);
		data.put("approveCompleteListCount", approveCompleteListCount);
		data.put("page", page);
		data.put("select", num);
		
		mav.addObject("data", data);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*결재 검토 디테일*/
	@GetMapping("/private/reviewRegister")
	public ModelAndView reviewRegister(@RequestParam int APPROVAL_PK) throws ParseException {
		ModelAndView mav = new ModelAndView();
		ApprovalVO approvalvo = approvalService.registerDetail(APPROVAL_PK);
		
		String regdate = approvalvo.getAPPROVE_REGDATE();
		
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat year = new SimpleDateFormat("yyyy");
		SimpleDateFormat month = new SimpleDateFormat("MM");
		SimpleDateFormat date = new SimpleDateFormat("dd");

		// String 타입을 Date 타입으로 변환
		Date formatDate = dtFormat.parse(regdate);
		
		// Date타입의 변수를 새롭게 지정한 포맷으로 변환
		String yyyy = year.format(formatDate);
		String MM = month.format(formatDate);
		String dd = date.format(formatDate);
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("USER_YY", yyyy);
		data.put("USER_MM", MM);
		data.put("USER_DD", dd);
		data.put("approvalvo", approvalvo);
		
		mav.addObject("data", data);
		
		
		mav.setViewName("/approvalPage/reviewRegister");

		return mav;
	}
	
	/*결재 상태 등록*/
	@RequestMapping(value ="reviewRegister.do", method = RequestMethod.POST)
	public ModelAndView reviewRegisterPOST(@RequestParam int APPROVAL_PK, String REVIEW_STATUS, String REVIEW_CONTENT, String REVIEWER) {
		ModelAndView mav = new ModelAndView();
		
		ApprovalVO vo = new ApprovalVO();
		
		vo.setAPPROVAL_PK(APPROVAL_PK);
		vo.setREVIEW_STATUS(REVIEW_STATUS);
		vo.setREVIEW_CONTENT(REVIEW_CONTENT);
		vo.setREVIEWER(REVIEWER);
		
		
		approvalService.reviewStatusWrite(vo);
		
		mav.addObject("data", vo);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*결재 검토 날짜 등록*/
	@RequestMapping(value ="reviewDate.do", method = RequestMethod.POST)
	public ModelAndView reviewDate(ReviewdateVO reviewdatevo) {
		ModelAndView mav = new ModelAndView();
		
		String statusCk = reviewdatevo.getREVIEW_STATUS();
		
		int APPROVAL_PK = reviewdatevo.getAPPROVAL_PK();
		
		int count = registerDateService.selectReviewDate(APPROVAL_PK);
		
		
		if(count != 0) {
			//APPROVAL_PK로 결재신청서 존재여부 확인 후 있다면 update
			registerDateService.reviewWait(reviewdatevo);
		} else {
			
			if(statusCk.equals("검토 완료")) {
				//statusCk가 검토 완료일 경우 검토날 체크
				registerDateService.reviewOk(reviewdatevo);
				
				//statusCk가 반려일 경우 반려날 체크
			} else if(statusCk.equals("반려")) {
				registerDateService.reviewNo(reviewdatevo);
			} 
		}
	
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*결재 승인 디테일 페이지*/
	@GetMapping("/private/approveRegister")
	public ModelAndView approveRegister(@RequestParam int APPROVAL_PK) throws ParseException {
		ModelAndView mav = new ModelAndView();
		
		ApprovalVO approvalvo = approvalService.registerDetail(APPROVAL_PK);
		
		String regdate = approvalvo.getAPPROVE_REGDATE();
		
		// 결재 신청일 나눠서 view단에 출력
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat year = new SimpleDateFormat("yyyy");
		SimpleDateFormat month = new SimpleDateFormat("MM");
		SimpleDateFormat date = new SimpleDateFormat("dd");

		// String 타입을 Date 타입으로 변환
		Date formatDate = dtFormat.parse(regdate);
		
		// Date타입의 변수를 새롭게 지정한 포맷으로 변환
		String yyyy = year.format(formatDate);
		String MM = month.format(formatDate);
		String dd = date.format(formatDate);
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("USER_YY", yyyy);
		data.put("USER_MM", MM);
		data.put("USER_DD", dd);
		data.put("approvalvo", approvalvo);
		
		mav.addObject("data", data);
			
		mav.setViewName("/approvalPage/approveRegister");

		return mav;
	}
	
	/*결재 승인상태 등록*/
	@RequestMapping(value ="approvalRegister.do", method = RequestMethod.POST)
	public ModelAndView approvalRegisterPost(@RequestParam int APPROVAL_PK, String APPROVE_STATUS, String APPROVE_CONTENT, String APPROVER) {
		ModelAndView mav = new ModelAndView();

		ApprovalVO vo = new ApprovalVO();
		
		//각 저장할 데이터 받아와서 setter로 담음
		vo.setAPPROVAL_PK(APPROVAL_PK);
		vo.setAPPROVE_STATUS(APPROVE_STATUS);
		vo.setAPPROVE_CONTENT(APPROVE_CONTENT);
		vo.setAPPROVER(APPROVER);
		
		//저장후 
		approvalService.approveStatusWrite(vo);
		
		//뷰단에서 ajax success로 필요한 데이터를 불러오기 위해 addObject해서 내보냄
 		mav.addObject("data", vo);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*결재 승인상태 날짜 등록*/
	@RequestMapping(value ="approvalDate.do", method = RequestMethod.POST)
	public ModelAndView approvalDate(ApprovaldateVO approvaldatevo) {
		ModelAndView mav = new ModelAndView();
		
		String statusCk = approvaldatevo.getAPPROVE_STATUS();
		
		int APPROVAL_PK = approvaldatevo.getAPPROVAL_PK();
		
		int count = registerDateService.selectReviewDate(APPROVAL_PK);
		
		
		if(count != 0) {
			//APPROVAL_PK로 결재신청서 존재여부 확인 후 있다면 update
			registerDateService.approveWait(approvaldatevo);
		} else {
			
			
			//statusCk가 승인 완료일 경우 승인날 체크 
			if(statusCk.equals("승인 완료")) {
				registerDateService.approveOk(approvaldatevo);
				
				//statusCk가 반려일 경우 반려날 체크
			} else if(statusCk.equals("반려")) {
				registerDateService.approveNo(approvaldatevo);
			} 
		}
	
		mav.setViewName("jsonView");
		return mav;
	}


	/*개인 현황 페이지 출력*/
	@GetMapping("individualStatusList")
	public ModelAndView allStatusList() {
		
		return new ModelAndView("/approvalPage/individualStatusList");
	}
	
	/*개인 현황 리스트*/
	@GetMapping("/individualStatusList.do")
	public ModelAndView individualStatusListGET(@ModelAttribute("USER_NUM")String USER_NUM,
			@RequestParam(value="num", defaultValue = "1")int num
			) {
		ModelAndView mav = new ModelAndView();
		
		ApprovalVO approvo = new ApprovalVO();
		
		approvo.setAPPROVER_KEY(USER_NUM);
		approvo.setREVIEW_KEY(USER_NUM);
		
		String REVIEW_KEY = approvo.getREVIEW_KEY();
		String APPROVER_KEY = approvo.getAPPROVER_KEY();
	
		//검토 대기자
		int reviewlistCount = approvalService.reviewlistCount(REVIEW_KEY);
		
		//승인대기자
		int approvelistCount = approvalService.approvelistCount(APPROVER_KEY);
		
		//개인결재 총갯수
		int individualStatusListCount = approvalService.individualStatusListCount(USER_NUM);
		
		//개인결재 검토/승인대기 수
		int approvalStatusCount = approvalService.approvalStatusCount(USER_NUM);
		
		Page page = new Page();
		
		int postNum = 5;
		page.setPostNum(postNum);
		page.setPageNum_cnt(postNum);
		page.setNum(num);
		page.setTotalCount(approvalService.individualStatusListCount(USER_NUM));
		
		
		List<ApprovalVO> individualStatusList = approvalService.individualStatusListGET(page.getSqlPostNum(), page.getPostNum(),USER_NUM);
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("individualStatusList", individualStatusList);
		data.put("approvalStatusCount", approvalStatusCount);
		data.put("individualStatusListCount", individualStatusListCount);
		data.put("reviewlistCount", reviewlistCount);
		data.put("approvelistCount", approvelistCount);
		data.put("page", page);
		data.put("select", num);
		
		mav.addObject("data", data);
		
		mav.setViewName("jsonView");
		return mav;
	}
	

	/*개인 현황 상세페이지*/
	@GetMapping("/individualDetail")
	public ModelAndView individualDetail(@RequestParam int APPROVAL_PK) throws ParseException {
		ModelAndView mav = new ModelAndView();
		
		ApprovalVO approvalvo = approvalService.individualDetail(APPROVAL_PK);
		
		String regdate = approvalvo.getAPPROVE_REGDATE();
		
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat year = new SimpleDateFormat("yyyy");
		SimpleDateFormat month = new SimpleDateFormat("MM");
		SimpleDateFormat date = new SimpleDateFormat("dd");

		// String 타입을 Date 타입으로 변환
		Date formatDate = dtFormat.parse(regdate);
		
		// Date타입의 변수를 새롭게 지정한 포맷으로 변환
		String yyyy = year.format(formatDate);
		String MM = month.format(formatDate);
		String dd = date.format(formatDate);

		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("USER_YY", yyyy);
		data.put("USER_MM", MM);
		data.put("USER_DD", dd);
		data.put("approvalvo", approvalvo);
		
		mav.addObject("data", data);
		
		mav.setViewName("/approvalPage/individualDetail");

		return mav;
	}
	
	
	

}
