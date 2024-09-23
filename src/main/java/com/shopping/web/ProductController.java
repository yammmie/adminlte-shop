package com.shopping.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopping.service.UserProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private UserProductService proService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String productDetail(String cate_prtcode, int pro_code, Model model) throws Exception {
		model.addAttribute("productVO", proService.productDetail(pro_code));
		model.addAttribute("userSubCategoryList", proService.subCategoryListAll(cate_prtcode));
		
		return "/product/select";
	}
}
