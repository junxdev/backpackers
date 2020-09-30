package com.bit.backpackers.member.model;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	 


	@Override
	public MemberVo idCheck(String user_id) throws Exception {		
		return sqlSession.selectOne(NAMESPACE + ".idCheck",user_id );
	}
	}

	
	

