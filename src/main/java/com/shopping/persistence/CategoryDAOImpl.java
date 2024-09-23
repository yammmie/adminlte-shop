package com.shopping.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shopping.domain.CategoryVO;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.shopping.mapper.AdmProductMapper";
	
	@Override
	public List<CategoryVO> categoryListAll() throws Exception {
		
		return session.selectList(namespace + ".categoryListAll");
	}

	@Override
	public List<CategoryVO> subCategoryListAll(String cate_prtcode) throws Exception {
		
		return session.selectList(namespace + ".subCategoryListAll", cate_prtcode);
	}

}
