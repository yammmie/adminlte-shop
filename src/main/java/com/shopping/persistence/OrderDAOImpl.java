package com.shopping.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shopping.domain.OrderListVO;
import com.shopping.domain.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	private final static String namespace="com.shopping.mapper.OrderMapper"; 
	
	@Inject
	private SqlSession session;

	@Override
	public int insert(OrderVO vo) throws Exception {

		return session.insert(namespace+".insertOrder", vo);
	}

	@Override
	public List<OrderListVO> selectAll(String member_id) throws Exception {
		
		return session.selectList(namespace+".selectAll", member_id);
	}


}
