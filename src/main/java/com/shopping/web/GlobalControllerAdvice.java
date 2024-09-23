package com.shopping.web;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.shopping.service.CategoryService;

// 컨트롤러에서 공통적으로 참조하는 코드 부분을 작업
// "com.shopping.web"에 존재하는 컨트롤러가 요청을 받으면 이 컨트롤러도 요청됨
@ControllerAdvice(basePackages = {"com.shopping.web"})
public class GlobalControllerAdvice {

	@Inject
	private CategoryService cateService;
	
	@ModelAttribute
	public void categoryList(Model model) throws Exception {
		model.addAttribute("userCategoryList", cateService.categoryListAll()); // left - 상위 카테고리 목록 출력
	}
}
