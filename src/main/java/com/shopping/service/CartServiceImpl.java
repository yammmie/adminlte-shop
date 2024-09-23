package com.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shopping.domain.CartListVO;
import com.shopping.domain.CartVO;
import com.shopping.persistence.CartDAO;

@Service
public class CartServiceImpl implements CartService {
	@Inject
	private CartDAO dao;

	@Override
	public List<CartListVO> selectAll(String member_id) throws Exception {
		
		return dao.selectAll(member_id);
	}
	
	@Override
	public void insert(CartVO vo) throws Exception {
		dao.insert(vo);
	}

	@Override
	public void update(int cart_code, int cart_amount) throws Exception {
		dao.update(cart_code, cart_amount);
	}

	@Override
	public void delete(int cart_code) throws Exception {
		dao.delete(cart_code);
	}

	@Override
	public void deleteAll() throws Exception {
		dao.deleteAll();
	}

}
