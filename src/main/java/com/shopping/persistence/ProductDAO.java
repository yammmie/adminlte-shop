package com.shopping.persistence;

import java.util.List;

import com.shopping.domain.ProductVO;
import com.shopping.util.SearchCriteria;

public interface ProductDAO {
	public void insert(ProductVO vo) throws Exception;
	
	public ProductVO select(int pro_code) throws Exception;
	
	public void modify(ProductVO vo) throws Exception;
	
	public void delete(int pro_code) throws Exception;
	
	// 페이징 목록
	public List<ProductVO> productListAll(SearchCriteria cri) throws Exception;
	  
	public int productListCount(SearchCriteria cri) throws Exception;
}
