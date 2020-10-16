package com.bit.backpackers.model;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.backpackers.model.entity.LoginDTO;
import com.bit.backpackers.model.entity.MemberVo;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private static final String NAMESPACE = "com.bit.backpackers.mapper.memberMapper";

	private final SqlSession sqlSession;

	@Inject
	public MemberDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;

	}
	//?šŒ?›ê°??…
	@Override
	public void register(MemberVo memberVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".register", memberVo);
	}
	//ë¡œê·¸?¸
	@Override
	public MemberVo login(LoginDTO loginDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".login", loginDTO);
	}

	/*
	 * @Override public MemberVo idCheck(String user_id) throws Exception { return
	 * sqlSession.selectOne(NAMESPACE + ".idCheck",user_id ); }
	 */
	//?•„?´?”” ì¤‘ë³µì²´í¬
	@Override
	public MemberVo idCheck(MemberVo memberVo) throws Exception {
		MemberVo bean = sqlSession.selectOne(NAMESPACE + ".idCheck", memberVo);
		return bean;
	}

	// ?•„?´?”” ì°¾ê¸°
	public MemberVo findId(Map<String, Object> memberMap) {

		return sqlSession.selectOne(NAMESPACE + ".findId", memberMap);

	}

	// ë¹„ë?ë²ˆí˜¸ ì°¾ê¸°
	public MemberVo findPw(Map<String, Object> memberMap) {

		return sqlSession.selectOne(NAMESPACE + ".findPw", memberMap);

	}

	// ë¹„ë?ë²ˆí˜¸ ë³?ê²?
	public int modifyPw(MemberVo memberVo) {
		return sqlSession.update(NAMESPACE + ".modifyPw", memberVo);
	}

	@Override
	public void delete(MemberVo memberVo) throws Exception {
		// MemberVOï¿½ï¿½ ï¿½ï¿½ï¿? ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½İ´Ï´ï¿½.
		// ï¿½×·ï¿½ xmlï¿½ï¿½ï¿½ï¿½ memberMapper.memberDeleteï¿½ï¿½ ï¿½ï¿½ï¿½Ã¸ï¿½
		// #{userId}, #{userPass}ï¿½ï¿½ ï¿½Ä¶ï¿½ï¿½ï¿½Í°ï¿½ï¿½ï¿? ï¿½ï¿½Äª
		sqlSession.delete("memberMapper.delete", memberVo);

	}

}
