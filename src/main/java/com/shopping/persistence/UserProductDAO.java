package com.shopping.persistence;

import java.util.List;

import com.shopping.domain.CategoryVO;
import com.shopping.domain.ProductVO;

public interface UserProductDAO {
	public List<CategoryVO> categoryListAll() throws Exception;
	
	public List<CategoryVO> subCategoryListAll(String cate_prtcode) throws Exception;
	
	public List<ProductVO> productList(String cate_code) throws Exception;
	
	public ProductVO productDetail(int pro_code) throws Exception;
}
