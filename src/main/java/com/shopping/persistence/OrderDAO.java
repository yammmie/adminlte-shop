package com.shopping.persistence;

import java.util.List;

import com.shopping.domain.OrderListVO;
import com.shopping.domain.OrderVO;

public interface OrderDAO {
	public int insert(OrderVO vo) throws Exception;
	
	public List<OrderListVO> selectAll(String member_id) throws Exception;
}
