package com.shopping.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shopping.domain.OrderListVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "com.shopping.mapper.AdminMapper";

	@Override
	public String loginCheck(String userid, String passwd) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("userid", userid);
		paramMap.put("passwd", passwd);

		return session.selectOne(namespace+".loginCheck", paramMap);
	}

	@Override
	public List<OrderListVO> selectAll() throws Exception {

		return session.selectList(namespace+".selectAll");
	}

	@Override
	public void deleteOrder(List<String> chkArr) throws Exception {

		session.delete(namespace+".deleteOrder", chkArr);
	}

	@Override
	public void deleteOrdDetail(List<String> chkArr) throws Exception {
		
		session.delete(namespace+".deleteOrdDetail", chkArr);
	}

}
