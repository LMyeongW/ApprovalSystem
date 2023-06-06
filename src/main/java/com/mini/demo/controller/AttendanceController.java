package com.mini.demo.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mini.demo.service.AttendanceService;
import com.mini.demo.vo.AttendanceListVO;
import com.mini.demo.vo.AttendanceVO;
import com.mini.demo.vo.Page;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	@RequestMapping(value="/mtsystem/attendance", method = RequestMethod.GET)
	public ModelAndView attendace() {
		ModelAndView mav = new ModelAndView();
		
		double lat; 
		double log;
		//임시 현재위치(고정)
		lat = 35.524933;
		log = 129.314815;
		
		System.out.println("lat : "+ lat + " log : " + log);
		
		double la = 35.524933;
		double lo = 129.314815;
		
		/*약 반지름 10m*/
		double r = 0.000173;
		

		
		if (Math.pow(r, 2) > (Math.pow(la - lat, 2) + Math.pow(lo - log, 2))) {
			
			System.out.println("반경내에 있습니다.");
			String atrue ="atrue";
			mav.addObject("data", atrue);
		} else {
			System.out.println("반경내에 없습니다.");
			String afalse ="afalse";
			mav.addObject("data", afalse);
		}

	
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/mtsystem/attendance.do", method = RequestMethod.POST)
	public ModelAndView attendacePost(AttendanceVO attendancevo, RedirectAttributes rttr) {
		ModelAndView mav = new ModelAndView();
		
		
		//출석체크했는지 확인
		int countck = attendanceService.attendanceCheck(attendancevo);

		
		if(countck != 0) {
			String exist = "exist";
			mav.addObject("data", exist);
			
			
		}else {
			attendanceService.attendacePost(attendancevo);
			
			String register = "register";
			mav.addObject("data", register);
		
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	@GetMapping("/mtsystem/attendanceList")
	public ModelAndView attendanceList() {
		return new ModelAndView("/attendance/attendanceList");
	}
	
	@GetMapping("/mtsystem/attendanceList.do")
	public ModelAndView attendanceListGet(@ModelAttribute("USER_NUM")String USER_NUM,
			@RequestParam(value="num", defaultValue = "1")int num) {
		ModelAndView mav = new ModelAndView();
		
		
		int totalcount =  attendanceService.totalcount(USER_NUM);
		
		Page page = new Page();
		int postNum = 5;
		page.setPostNum(postNum);
		page.setPageNum_cnt(postNum);
		page.setNum(num);
		page.setTotalCount(totalcount);
		

		List<AttendanceListVO> list = attendanceService.attendanceListGet(page.getSqlPostNum(), page.getPostNum(), USER_NUM);
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("list", list);
		data.put("totalcount", totalcount);
		data.put("page", page);
		data.put("select", num);
		
		mav.addObject("data", data);
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@GetMapping("/mtsystem/authority/attendanceAllList")
	public ModelAndView attendanceAllList() {
		return new ModelAndView("/attendance/attendanceAllList");
	}
	
	@GetMapping("/mtsystem/authority/attendanceAllList.do")
	public ModelAndView attendanceAllListGet(@ModelAttribute("searchKeyword")String searchKeyword,
			@ModelAttribute("dapartment")String dapartment,
			@ModelAttribute("grade")String grade,
			@RequestParam(value="num", defaultValue = "1")int num) {
		ModelAndView mav = new ModelAndView();
		
		int allTotalcount =  attendanceService.allTotalcount(searchKeyword, dapartment, grade);
		
		Page page = new Page();
		int postNum = 5;
		page.setPostNum(postNum);
		page.setPageNum_cnt(postNum);
		page.setNum(num);
		page.setTotalCount(allTotalcount);
		

		List<AttendanceListVO> list = attendanceService.attendanceAllListGet(page.getSqlPostNum(), page.getPostNum(), searchKeyword, dapartment, grade);
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("list", list);
		data.put("allTotalcount", allTotalcount);
		data.put("page", page);
		data.put("select", num);
		
		mav.addObject("data", data);
		
		mav.setViewName("jsonView");
		
		return mav;
	}
}
