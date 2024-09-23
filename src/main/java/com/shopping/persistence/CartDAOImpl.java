package com.shopping.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shopping.domain.CartListVO;
import com.shopping.domain.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {
	private static final String namespace = "com.shopping.mapper.CartMapper";
	
	@Inject
	private SqlSession session;

	@Override
	public List<CartListVO> selectAll(String member_id) throws Exception {
		
		return session.selectList(namespace+".selectAll", member_id);
	}

	@Override
	public void insert(CartVO vo) throws Exception {
		session.insert(namespace+".insert", vo);
	}

	@Override
	public void update(int cart_code, int cart_amount) throws Exception {
		Map<String, Integer> param = new HashMap<String, Integer>();
		
		param.put("cart_code", cart_code);
		param.put("cart_amount", cart_amount);
		
		session.update(namespace+".update", param);
	}

	@Override
	public void delete(int cart_code) throws Exception {
		
		session.delete(namespace+".delete", cart_code);
	}

	@Override
	public void deleteAll() throws Exception {
		session.delete(namespace+".deleteAll");
	}
	
}
