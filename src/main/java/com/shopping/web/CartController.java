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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shopping.domain.CartListVO;
import com.shopping.domain.CartVO;
import com.shopping.service.CartService;
import com.shopping.service.CategoryService;

@Controller
@RequestMapping("/cart")
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Inject
	private CartService cartService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void cartList(HttpSession session, Model model) throws Exception {
		
		List<CartListVO> cartList = cartService.selectAll((String)session.getAttribute("member_id"));
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("size", cartList.size());
		
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String cartInsert(CartVO vo, HttpSession session) throws Exception {
		vo.setMember_id((String)session.getAttribute("member_id"));
		
		cartService.insert(vo);
		
		return "redirect:/cart/list";
	}
	
	// 수정1 버튼 (장바구니 목록을 ajax로 다시 뿌려줌)
	@ResponseBody
	@RequestMapping(value = "/{cart_code}/{cart_amount}", method = RequestMethod.GET /*{RequestMethod.PUT, RequestMethod.PATCH}*/)
	public ResponseEntity<List<CartListVO>> cartUpdate(@PathVariable("cart_code") Integer cart_code, 
			@PathVariable("cart_amount") Integer cart_amount, HttpSession session) { // Integer, int 상관 X
		ResponseEntity<List<CartListVO>> entity = null;
		List<CartListVO> cartList = null;
		
		try {
			cartService.update(cart_code, cart_amount);
			
			cartList = cartService.selectAll(session.getAttribute("member_id").toString());	
//			cartList = cartService.selectAll("hong");
			entity = new ResponseEntity<List<CartListVO>>(cartList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			entity = new ResponseEntity<List<CartListVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}	
	
	// 수정2 버튼 (수정한 행만)
	@ResponseBody
	@RequestMapping(value = "/", method = RequestMethod.GET /*{RequestMethod.PUT, RequestMethod.PATCH}*/)
	public ResponseEntity<String> cartUpdate(@RequestParam("cart_code") Integer cart_code, 
			@RequestParam("cart_amount") Integer cart_amount) { // Integer, int 상관 X
		ResponseEntity<String> entity = null;
		
		try {
			cartService.update(cart_code, cart_amount);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}	
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ResponseEntity<String> cartDelete(@RequestParam("cart_code") Integer cart_code) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			cartService.delete(cart_code);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/deleteAll", method = RequestMethod.GET)
	public String deleteAllCart(RedirectAttributes rttr) throws Exception {
		cartService.deleteAll();
		
		rttr.addFlashAttribute("msg", "empty");
		
		return "redirect:/cart/list";
	}
}
