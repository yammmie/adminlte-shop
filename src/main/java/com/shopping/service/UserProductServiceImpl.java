package com.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shopping.domain.CategoryVO;
import com.shopping.domain.ProductVO;
import com.shopping.persistence.UserProductDAO;

@Service
public class UserProductServiceImpl implements UserProductService {

	@Inject
	private UserProductDAO dao;
	
	@Override
	public List<CategoryVO> categoryListAll() throws Exception {
		
		return dao.categoryListAll();
	}

	@Override
	public List<CategoryVO> subCategoryListAll(String cate_prtcode) throws Exception {
		
		return dao.subCategoryListAll(cate_prtcode);
	}

	@Override
	public List<ProductVO> productList(String cate_code) throws Exception {
		
		return dao.productList(cate_code);
	}

	@Override
	public ProductVO productDetail(int pro_code) throws Exception {
		
		return dao.productDetail(pro_code);
	}

}
