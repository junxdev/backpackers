package com.bit.backpackers.member.model;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;



@Repository
public class MemberDAOImpl implements MemberDAO{

	
    private static final String NAMESPACE = "com.bit.backpackers.mapper.memberMapper";

    private final SqlSession sqlSession;
    
    @Inject
    public MemberDAOImpl(SqlSession sqlSession) {
    	this.sqlSession = sqlSession;
    	
	}
    
    
    
	@Override
	public void register(MemberVo memberVo) throws Exception {
		 sqlSession.insert(NAMESPACE + ".register", memberVo);
		
	}



	
	 @Override 
	 public MemberVo login(LoginDTO loginDTO) throws Exception { 
		 return sqlSession.selectOne(NAMESPACE + ".login", loginDTO); 
		}
	 


		/*
		 * @Override public MemberVo idCheck(String user_id) throws Exception { return
		 * sqlSession.selectOne(NAMESPACE + ".idCheck",user_id ); }
		 */



	@Override
	public int idCheck(MemberVo memberVo) throws Exception {
		int result= sqlSession.selectOne("memberMapper.idCheck",memberVo);
		return result;
	}



	@Override
	public int pwCheck(MemberVo memberVo) throws Exception {
		int result= sqlSession.selectOne("memberMapper.pwCheck",memberVo);
		return result;
	}



	@Override
	public void delete(MemberVo memberVo) throws Exception {
		// MemberVO�� ��� ������ �����ݴϴ�.
				// �׷� xml���� memberMapper.memberDelete�� ���ø�
				//  #{userId}, #{userPass}�� �Ķ���Ͱ��� ��Ī
	sqlSession.delete("memberMapper.delete",memberVo);
		
	}
	
	
	
	@Override
	public void createAuthKey(String userEmail, String authKey) throws Exception { // ����Ű DB�� �ֱ�
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("userEmail", userEmail);
		map.put("authKey", authKey);

		sqlSession.selectOne(NAMESPACE + ".createAuthKey", map);
	}

	@Override
	public void userAuth(String userEmail) throws Exception { // ����Ű ��ġ�� DBĮ��(��������) false->true �� ����
		sqlSession.update(NAMESPACE + ".userAuth", userEmail);
	}



	@Override
	public void create(MemberVo memberVo) {
		// TODO Auto-generated method stub
		
	}






	}

	
	

