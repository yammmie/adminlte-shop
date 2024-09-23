package com.shopping.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shopping.domain.LoginDTO;
import com.shopping.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	private static final String namespace = "com.shopping.mapper.MemberMapper";
	
	@Inject
	private SqlSession session;

	@Override
	public String idCheck(String member_id) throws Exception {
		
		return session.selectOne(namespace + ".idCheck", member_id);
	}

	@Override
	public void insert(MemberVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public MemberVO select(LoginDTO login) throws Exception {
		
		return session.selectOne(namespace + ".select", login);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(String member_id) throws Exception {
		session.delete(namespace + ".delete", member_id);
	}
	
}
