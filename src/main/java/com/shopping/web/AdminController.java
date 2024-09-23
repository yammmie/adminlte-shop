package com.shopping.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService service;

	// 관리자 로그인 페이지 요청
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {
		logger.info("adminlogin called...");
	}
	
	// 로그인 체크
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(String userid, String passwd, HttpSession session, ModelAndView mav) throws Exception {
		String name = service.loginCheck(userid, passwd);
		
		if(name != null) {
			session.setAttribute("member_id", userid);
			session.setAttribute("member_pw", passwd);
			
			return "redirect:/admin/";
		} else {
			return "redirect:/admin/login";
		}
	}

	/*
	 * public ModelAndView loginCheck(String userid, String passwd, HttpSession
	 * session, ModelAndView mav) throws Exception { String name =
	 * service.loginCheck(userid, passwd);
	 * 
	 * if(name != null) { // 로그인 O session.setAttribute("member_id", userid);
	 * session.setAttribute("member_pw", passwd);
	 * 
	 * mav.setViewName("/admin/home"); // 관리자 메인 페이지 이동 (주소는 /loginCheck로 유지)
	 * mav.addObject("msg", "success"); } else { // 로그인 X
	 * mav.setViewName("/admin/login"); // 다시 로그인 페이지로 이동 mav.addObject("msg",
	 * "failure"); }
	 * 
	 * return mav; }
	 */	
	// 관리자 메인 페이지 요청
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "/admin/home";
	}
	
	// 모든 주문 조회
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void orderList(Model model) throws Exception {
		model.addAttribute("orderList", service.selectAll());
	}

	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<String> delete(@RequestParam("chkArr[]") List<String> chkArr) {
		ResponseEntity<String> entity = null;
		
		try {
			service.delete(chkArr);
			
//			for(int i=0; i<chkArr.size(); i++) {
//				System.out.println(chkArr.get(i));
//			}
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
