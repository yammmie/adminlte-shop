package com.shopping.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopping.domain.OrderVO;
import com.shopping.service.CartService;
import com.shopping.service.CategoryService;
import com.shopping.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Inject
	private OrderService ordService;
	
	@Inject
	private CartService cartService;
	
	// 주문 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void orderList(Model model, HttpSession session) throws Exception {
		model.addAttribute("orderList", ordService.selectAll(session.getAttribute("member_id").toString()));
	}
	
	// 주문 페이지 요청
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertOrderGET(Model model, HttpSession session) throws Exception {
		model.addAttribute("cartList", cartService.selectAll((String)session.getAttribute("member_id")));
	}
	
	// DB 삽입
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertOrder(OrderVO vo, HttpSession session) throws Exception {
		vo.setMember_id(session.getAttribute("member_id").toString());
		
		ordService.insert(vo);
		
		return "redirect:/";
	}
}
