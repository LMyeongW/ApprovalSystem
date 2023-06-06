package com.mini.demo.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mini.demo.service.UserService;
import com.mini.demo.vo.Page;
import com.mini.demo.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
    @Autowired
    private BCryptPasswordEncoder pwEncoder;
	
	/*사원등록 페이지*/
	@GetMapping(value="/mtsystem/authority/userRegister")
	public ModelAndView userRegister(){
		return new ModelAndView("/account/userRegister");
	}
	
	/*사번중복체크*/
	@GetMapping("/mtsystem/authority/idck")
	public ModelAndView idck(String USER_NUM)throws Exception {	
		ModelAndView mav = new ModelAndView();
		
		int count = userService.numck(USER_NUM);
		
		mav.addObject("data", count);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*사원등록.POST*/
	@PostMapping(value="/mtsystem/authority/userRegister.do")
	public ModelAndView userRegisterPost(UserVO uservo) {
		ModelAndView mav = new ModelAndView();
		
		String userpw = uservo.getUSER_NUM() + "1!";

		/*encoding*/
		String encodePw ="";
		encodePw = pwEncoder.encode(userpw);

		uservo.setUSER_PW(encodePw);
		
		userService.userRegisterPost(uservo);
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	/*로그인 페이지*/
	@GetMapping(value ="/login")
	public ModelAndView loginGET() {
		
		System.out.println("@@@@@@@@@@@@@@@@@login : loginPage 진입");
		
		return new ModelAndView("/account/login");
	}
	
	/*로그일실행*/
	@PostMapping(value ="/login.do")
	public ModelAndView loginPOST(HttpServletRequest request, UserVO uservo, RedirectAttributes rttr) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String rawPw ="";
		String encodePw ="";
		
		System.out.println("@@@@@@@@@@@@@@@@@login : login실행");
		
		UserVO Login = userService.login(uservo);
		
		if(Login != null) {
			rawPw = uservo.getUSER_PW();
			encodePw = Login.getUSER_PW();
			
			if(true == pwEncoder.matches(rawPw, encodePw)) {
				
				Login.setUSER_PW("");                
				session.setAttribute("member", Login);
				
				mav.setViewName("redirect:/mtsystem/individualStatusList");
			}else {
				rttr.addFlashAttribute("msg", "사원번호나 비밀번호를 확인해주세요.");
				mav.setViewName("redirect:/login");
			}
			
		}else {
			rttr.addFlashAttribute("msg", "존재하지 않는 사원번호입니다.");
			mav.setViewName("redirect:/login");
		}
		
		
		return mav;
	
	}
	
    /* 로그아웃 */
    @RequestMapping(value="/logout.do", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "redirect:/login";        
        
    }
	
    /*마이페이지 출력*/
	@GetMapping("/mtsystem/mypage")
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/account/mypage");
		return mav;
	}
	
	
	/*마이페이지  비밀번호변경전 pw 확인*/
	@GetMapping("/mtsystem/passwordck")
	public ModelAndView passwordck(UserVO uservo) {
		ModelAndView mav = new ModelAndView();
		
		UserVO userInfo = userService.passwordck(uservo);
		
		String rawPw = "";
		String encodePw = "";
		
		rawPw = uservo.getUSER_PW();       
		encodePw = userInfo.getUSER_PW();  
		
		boolean endata = pwEncoder.matches(rawPw, encodePw);
		
		mav.addObject("data", endata);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	/*마이페이지  비밀번호변경전 pw 변경*/
	@RequestMapping(value ="/mtsystem/passwordch", method = RequestMethod.POST)
	public ModelAndView passwordch(UserVO uservo) {
		ModelAndView mav = new ModelAndView();
		
		String rawPw = "";
		String encodePw = "";
		
		rawPw = uservo.getUSER_PW();
		encodePw = pwEncoder.encode(rawPw);
		uservo.setUSER_PW(encodePw);
		
		userService.passwordch(uservo);
    	
    	mav.setViewName("jsonView");
		return mav;
	}
	
	/*사용자 현황 페이지 출력*/
	@GetMapping("/mtsystem/authority/userConditionList")
	public ModelAndView userConditionList() {
		return new ModelAndView("/account/userConditionList");
	}
	
	/*사용자 현황 페이지 list*/
	@GetMapping("/mtsystem/authority/userConditionList.do")
	public ModelAndView userConditionListGet(@RequestParam(value="num", defaultValue = "1")int num) {
		ModelAndView mav = new ModelAndView();
		
		int userConditionlistCount = userService.userConditionCount();
		
		Page page = new Page();
		
		int postNum = 5;
		page.setPostNum(postNum);
		page.setPageNum_cnt(postNum);
		page.setNum(num);
		page.setTotalCount(userConditionlistCount);
		
		List<UserVO> userConditionList = userService.userConditionListGet(page.getSqlPostNum(), page.getPostNum());
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("userConditionList", userConditionList);
		data.put("page", page);
		data.put("select", num);
		data.put("userConditionlistCount", userConditionlistCount);
		
		mav.addObject("data", data);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*사용자 현황 상세페이지*/
	@GetMapping("/mtsystem/authority/userDetail")
	public ModelAndView userDetail(@RequestParam String USER_NUM) throws ParseException {
		
		ModelAndView mav = new ModelAndView();
		
		UserVO uservo = userService.userDetail(USER_NUM);
		
		String birth = uservo.getUSER_BIRTHDAY();
		
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat year = new SimpleDateFormat("yyyy");
		SimpleDateFormat month = new SimpleDateFormat("MM");
		SimpleDateFormat date = new SimpleDateFormat("dd");

		// String 타입을 Date 타입으로 변환
		Date formatDate = dtFormat.parse(uservo.getUSER_BIRTHDAY());
		
		
		// Date타입의 변수를 새롭게 지정한 포맷으로 변환
		String yyyy = year.format(formatDate);
		String MM = month.format(formatDate);
		String dd = date.format(formatDate);

		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("USER_YY", yyyy);
		data.put("USER_MM", MM);
		data.put("USER_DD", dd);
		data.put("uservo", uservo);
		

		mav.addObject("data", data);
		
		mav.setViewName("/account/userDetail");
		
		return mav;
	}
	
	@RequestMapping(value ="/mtsystem/authority/userUpdate", method = RequestMethod.POST)
	public ModelAndView userUpdate(UserVO uservo) {
		ModelAndView mav = new ModelAndView();
		
		userService.userUpdate(uservo);
		
		mav.setViewName("jsonView");
		return mav;
	}
	

}
