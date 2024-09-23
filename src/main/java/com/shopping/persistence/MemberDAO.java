package com.shopping.persistence;

import com.shopping.domain.LoginDTO;
import com.shopping.domain.MemberVO;

public interface MemberDAO {
	public String idCheck(String member_id) throws Exception;
	
	public void insert(MemberVO vo) throws Exception;
	
	public MemberVO select(LoginDTO login) throws Exception;
	
	public void update(MemberVO vo) throws Exception;
	
	public void delete(String member_id) throws Exception;
}
