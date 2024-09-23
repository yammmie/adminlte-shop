package com.shopping.persistence;

import java.util.List;

import com.shopping.domain.OrderListVO;

public interface AdminDAO {
	public String loginCheck(String userid, String passwd) throws Exception;
	
	public List<OrderListVO> selectAll() throws Exception;
	
	public void deleteOrder(List<String> chkArr) throws Exception;

	public void deleteOrdDetail(List<String> chkArr) throws Exception;
}
