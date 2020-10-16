package com.bit.backpackers.model;

import java.util.Date;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.javassist.compiler.ast.Member;

import com.bit.backpackers.model.entity.LoginDTO;
import com.bit.backpackers.model.entity.MemberVo;



public interface MemberDAO {

	// ?šŒ?›ê°??… ì²˜ë¦¬
    void register(MemberVo memberVo) throws Exception;
    
    // ë¡œê·¸?¸ ì²˜ë¦¬
    MemberVo login(LoginDTO loginDTO) throws Exception;
    
  //?•„?´?”” ì¤‘ë³µì²´í¬ 
    MemberVo idCheck(MemberVo memberVo) throws Exception;

        // ?šŒ?› ?•„?´?”” ì°¾ê¸°
    MemberVo findId(Map<String, Object> memberMap)throws Exception;
        // ?šŒ?› ë¹„ë?ë²ˆí˜¸ ì°¾ê¸°
    MemberVo findPw(Map<String, Object> memberMap)throws Exception;
    // ?šŒ?› ë¹„ë?ë²ˆí˜¸ ë³?ê²?
    int modifyPw(MemberVo memberVo)throws Exception;

    
    //?šŒ?›?ƒˆ?‡´
 	public void delete(MemberVo memberVo)throws Exception;



    
}
