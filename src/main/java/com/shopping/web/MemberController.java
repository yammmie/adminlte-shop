package com.shopping.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.domain.LoginDTO;
import com.shopping.domain.MemberVO;
import com.shopping.service.MemberService;
import com.shopping.service.UserProductService;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService service;
	
	@Inject
	private UserProductService proService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public void productDetail(String cate_prtcode, Model model) throws Exception {
		model.addAttribute("userSubCategoryList", proService.subCategoryListAll(cate_prtcode));
	}
	
	// 가입 페이지 요청
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void memberInsert() {}
	
	// DB 삽입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String memberInsert(MemberVO vo) throws Exception {
		service.insert(vo);
		
		return "redirect:/member/login";
	}
	
	// ID 중복 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public  String memberIdCheck(@RequestParam("member_id") String member_id) throws Exception {
		String msg = "";
		
		if(service.idCheck(member_id) != null) {
			msg = "no";
		} else {
			msg = "yes";
		}
		
		return msg;
	}
	
	// 로그인 페이지 요청
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void memberLogin() {}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String memberLogin(LoginDTO login, HttpSession session) throws Exception {
		String msg = "";
		MemberVO vo = service.select(login);
		
		if(vo != null) {
			msg = "success";
			
			session.setAttribute("member_id", vo.getMember_id());
			session.setAttribute("member_pw", vo.getMember_pw());
		} else {
			msg = "fail";
		}
		
		return msg;
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.GET)
	public void loginCheck() {}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원 정보 수정 페이지 요청
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void memberModify(HttpSession session, Model model) throws Exception {
		if(session.getAttribute("member_id") == null)
			return;
		
		LoginDTO login = new LoginDTO();
		
		login.setMember_id((String)session.getAttribute("member_id"));
		login.setMember_pw((String)session.getAttribute("member_pw"));
		
		model.addAttribute("vo", service.select(login));
	}
	
	// DB 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String memberModify(MemberVO vo, HttpSession session) throws Exception {
		logger.info(vo.toString());
		
		service.update(vo);
		
		session.setAttribute("member_id", vo.getMember_id());
		session.setAttribute("member_pw", vo.getMember_pw());
		
		return "redirect:/";
	}
	
	// 회원 탈퇴
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String memberDelete(HttpSession session) throws Exception {
		if(session.getAttribute("member_id") == null)
			return "";
		
		String member_id = (String)session.getAttribute("member_id");
		
		service.delete(member_id);

		session.invalidate();
		
		return "redirect:/";
	}
}
