package com.shopping.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopping.service.UserProductService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private UserProductService service;

	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	
	 * @RequestMapping(value = "/register", method = RequestMethod.GET) public void
	 * register() {
	 * 
	 * }
	 */

	// 상위 카테고리 목록 출력
	// ?cate_prtcode=
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(String cate_prtcode, @ModelAttribute("cate_code") String cate_code, Model model) throws Exception {
		// 기본값 설정
		if(cate_prtcode == null) cate_prtcode = "1"; // TOP
//		if(cate_code == null) cate_code = "10"; // 후드
		
		if(cate_code == null) {
			switch(cate_prtcode) {
			case "1":
				cate_code = "8";
				break;
			case "2":
				cate_code = "14";
				break;
			case "3":
				cate_code = "19";
				break;
			case "4":
				cate_code = "24";
				break;
			case "5":
				cate_code = "31";
				break;
			case "6":
				cate_code = "35";
				break;
			case "7":
				cate_code = "39";
				break;
			}
		}
		
		model.addAttribute("userSubCategoryList", service.subCategoryListAll(cate_prtcode));
		model.addAttribute("userProductList", service.productList(cate_code));

		return "home";
	}
}
