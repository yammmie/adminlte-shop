package com.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shopping.domain.ProductVO;
import com.shopping.persistence.ProductDAO;
import com.shopping.util.SearchCriteria;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO dao;
	
	@Override
	public void insert(ProductVO vo) throws Exception {
		dao.insert(vo);
	}

	@Override
	public ProductVO select(int pro_code) throws Exception {
		
		return dao.select(pro_code);
	}
	
	@Override
	public void modify(ProductVO vo) throws Exception {
		dao.modify(vo);
	}
	
	@Override
	public void delete(int pro_code) throws Exception {
		dao.delete(pro_code);
	}

	@Override
	public List<ProductVO> productListAll(SearchCriteria cri) throws Exception {
		
		return dao.productListAll(cri);
	}

	@Override
	public int productListCount(SearchCriteria cri) throws Exception {
		
		return dao.productListCount(cri);
	}

}
