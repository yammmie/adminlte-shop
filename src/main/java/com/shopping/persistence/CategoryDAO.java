package com.shopping.persistence;

import java.util.List;

import com.shopping.domain.CategoryVO;

public interface CategoryDAO {
	 public List<CategoryVO> categoryListAll() throws Exception;
	 
	 public List<CategoryVO> subCategoryListAll(String cate_prtcode) throws Exception;
}
