package com.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shopping.domain.CategoryVO;
import com.shopping.persistence.CategoryDAO;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Inject
	private CategoryDAO dao;

	@Override
	public List<CategoryVO> categoryListAll() throws Exception {

		return dao.categoryListAll();
	}

	@Override
	public List<CategoryVO> subCategoryListAll(String cate_prtcode) throws Exception {
		
		return dao.subCategoryListAll(cate_prtcode);
	}

}
