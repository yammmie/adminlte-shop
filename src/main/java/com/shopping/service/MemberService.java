package com.shopping.service;

import com.shopping.domain.LoginDTO;
import com.shopping.domain.MemberVO;

public interface MemberService {
	public String idCheck(String member_id) throws Exception;
	
	public void insert(MemberVO vo) throws Exception;
	
	public MemberVO select(LoginDTO login) throws Exception;
	
	public void update(MemberVO vo) throws Exception;
	
	public void delete(String member_id) throws Exception;
}
