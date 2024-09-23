package com.shopping.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shopping.domain.ProductVO;
import com.shopping.util.SearchCriteria;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.shopping.mapper.AdmProductMapper";
	
	@Override
	public void insert(ProductVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public ProductVO select(int pro_code) throws Exception {
		
		return session.selectOne(namespace + ".select", pro_code);
	}
	
	@Override
	public void modify(ProductVO vo) throws Exception {
		session.update(namespace + ".modify", vo);
	}
	
	@Override
	public void delete(int pro_code) throws Exception {
		session.delete(namespace + ".delete", pro_code);
	}

	@Override
	public List<ProductVO> productListAll(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace + ".productListAll", cri);
	}

	@Override
	public int productListCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace + ".productListCount", cri);
	}

}
