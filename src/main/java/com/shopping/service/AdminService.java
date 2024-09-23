package com.shopping.service;

import java.util.List;

import com.shopping.domain.OrderListVO;

public interface AdminService {
	public String loginCheck(String userid, String passwd) throws Exception;
	
	public List<OrderListVO> selectAll() throws Exception;
	
	public void delete(List<String> chkArr) throws Exception;
}
