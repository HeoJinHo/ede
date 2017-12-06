package com.ede.member;

public interface MemberDAO {

	//ȸ������
	public int join(MemberDTO memberDTO) throws Exception;
	
	//�α���
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	
	//����
	public int update(MemberDTO memberDTO) throws Exception;
	
	//Ż��
	public int delete(String id) throws Exception;
	
	
	
	
	
	
	
}
