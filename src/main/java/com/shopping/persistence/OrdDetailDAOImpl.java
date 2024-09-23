package com.shopping.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class OrdDetailDAOImpl implements OrdDetailDAO {
	
	private final static String namespace="com.shopping.mapper.OrderMapper"; 
	
	@Inject
	private SqlSession session;

	@Override
	public void insert(int ord_code, String member_id) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("ord_code", ord_code);
		param.put("member_id", member_id);
		
		session.insert(namespace+".insertOrdDetail", param);
	}
	
}
