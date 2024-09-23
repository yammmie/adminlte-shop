package com.shopping.persistence;

import java.util.List;

import com.shopping.domain.CartListVO;
import com.shopping.domain.CartVO;

public interface CartDAO {
	public List<CartListVO> selectAll(String member_id) throws Exception;
	
	public void insert(CartVO vo) throws Exception;
	
	public void update(int cart_code, int cart_amount) throws Exception;
	
	public void delete(int cart_code) throws Exception;
	
	public void deleteAll() throws Exception;
}
