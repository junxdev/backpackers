package com.bit.backpackers.member.model;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private static final String NAMESPACE = "com.bit.backpackers.mapper.memberMapper";

	private final SqlSession sqlSession;

	@Inject
	public MemberDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;

	}
	//회원가입
	@Override
	public void register(MemberVo memberVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".register", memberVo);
	}
	//로그인
	@Override
	public MemberVo login(LoginDTO loginDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".login", loginDTO);
	}

	/*
	 * @Override public MemberVo idCheck(String user_id) throws Exception { return
	 * sqlSession.selectOne(NAMESPACE + ".idCheck",user_id ); }
	 */
	//아이디 중복체크
	@Override
	public MemberVo idCheck(MemberVo memberVo) throws Exception {
		MemberVo bean = sqlSession.selectOne(NAMESPACE + ".idCheck", memberVo);
		return bean;
	}

	// 아이디 찾기
	public MemberVo findId(Map<String, Object> memberMap) {

		return sqlSession.selectOne(NAMESPACE + ".findId", memberMap);

	}

	// 비밀번호 찾기
	public MemberVo findPw(Map<String, Object> memberMap) {

		return sqlSession.selectOne(NAMESPACE + ".findPw", memberMap);

	}

	// 비밀번호 변경
	public int modifyPw(MemberVo memberVo) {
		return sqlSession.update(NAMESPACE + ".modifyPw", memberVo);
	}

	@Override
	public void delete(MemberVo memberVo) throws Exception {
		// MemberVO�� ��� ������ �����ݴϴ�.
		// �׷� xml���� memberMapper.memberDelete�� ���ø�
		// #{userId}, #{userPass}�� �Ķ���Ͱ��� ��Ī
		sqlSession.delete("memberMapper.delete", memberVo);

	}

}
