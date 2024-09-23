package com.shopping.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shopping.domain.LoginDTO;
import com.shopping.domain.MemberVO;
import com.shopping.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;
	
	@Override
	public String idCheck(String member_id) throws Exception {
		
		return dao.idCheck(member_id);
	}

	@Override
	public void insert(MemberVO vo) throws Exception {
		dao.insert(vo);
	}

	@Override
	public MemberVO select(LoginDTO login) throws Exception {
		
		return dao.select(login);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(String member_id) throws Exception {
		dao.delete(member_id);
	}
}
