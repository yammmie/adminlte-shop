package com.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shopping.domain.OrderListVO;
import com.shopping.domain.OrderVO;
import com.shopping.persistence.CartDAO;
import com.shopping.persistence.OrdDetailDAO;
import com.shopping.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	private OrderDAO ordDAO;
	
	@Inject
	private OrdDetailDAO ordDetailDAO;
	
	@Inject
	private CartDAO cartDAO;

	@Override
	@Transactional  // 트랜잭션 처리
	public void insert(OrderVO vo) throws Exception {
		// 3개의 DAO 메소드 호출
		// 1. 주문 테이블 삽입 메소드
		// 2. 주문 상세 테이블 삽입 메소드
		// 3. 장바구니 삭제 메소드
		ordDAO.insert(vo); // 시퀀스값이 자동으로 vo의 ord_code에 들어감
		ordDetailDAO.insert(vo.getOrd_code(), vo.getMember_id());
		cartDAO.deleteAll();
	}

	@Override
	public List<OrderListVO> selectAll(String member_id) throws Exception {
		
		return ordDAO.selectAll(member_id);
	}

}
