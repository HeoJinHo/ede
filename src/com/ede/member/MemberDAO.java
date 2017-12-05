package com.ede.member;

public interface MemberDAO {

	//회원가입
	public int join(MemberDTO memberDTO) throws Exception;
	
	//로그인
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	
	//수정 
	public int update(MemberDTO memberDTO) throws Exception;
	
	//탈퇴
	public int delete(String id) throws Exception;
	
	
	
	
	
	
	
}
