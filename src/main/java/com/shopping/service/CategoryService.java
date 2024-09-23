package com.shopping.service;

import java.util.List;

import com.shopping.domain.CategoryVO;

public interface CategoryService {
	 public List<CategoryVO> categoryListAll() throws Exception;
	 
	 public List<CategoryVO> subCategoryListAll(String cate_prtcode) throws Exception;
}
