package com.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shopping.domain.OrderListVO;
import com.shopping.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;
	
	@Override
	public String loginCheck(String userid, String passwd) throws Exception {

		return dao.loginCheck(userid, passwd);
	}

	@Override
	public List<OrderListVO> selectAll() throws Exception {
		
		return dao.selectAll();
	}

	@Override
	@Transactional
	public void delete(List<String> chkArr) throws Exception {
		dao.deleteOrdDetail(chkArr);
		dao.deleteOrder(chkArr);
	}

}
