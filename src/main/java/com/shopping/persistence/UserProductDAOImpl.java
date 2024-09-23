package com.shopping.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shopping.domain.CategoryVO;
import com.shopping.domain.ProductVO;

@Repository
public class UserProductDAOImpl implements UserProductDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.shopping.mapper.UserProductMapper";

	@Override
	public List<CategoryVO> categoryListAll() throws Exception {
		
		return session.selectList(namespace + ".categoryListAll");
	}

	@Override
	public List<CategoryVO> subCategoryListAll(String cate_prtcode) throws Exception {
		
		return session.selectList(namespace + ".subCategoryListAll", cate_prtcode);
	}

	@Override
	public List<ProductVO> productList(String cate_code) throws Exception {
		
		return session.selectList(namespace + ".productList", cate_code);
	}

	@Override
	public ProductVO productDetail(int pro_code) throws Exception {
		
		return session.selectOne(namespace + ".productDetail", pro_code);
	}
	
}
