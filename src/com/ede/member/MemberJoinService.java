package com.ede.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class MemberJoinService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		if(request.getMethod().equals("POST")) {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(request.getParameter("id"));
			memberDTO.setPw(request.getParameter("pw"));
			memberDTO.setAddr(request.getParameter("addr"));
			memberDTO.setPhone(request.getParameter("phone"));
			memberDTO.setNickname(request.getParameter("nickname"));
			memberDTO.setName(request.getParameter("name"));
			memberDTO.setBirth(request.getParameter("birth"));
			memberDTO.setGender(request.getParameter("gender"));
			memberDTO.setPoint(Integer.parseInt(request.getParameter("point")));
			memberDTO.setPic_name(request.getParameter("pic_name"));
			memberDTO.setPic_path(request.getParameter("pic_path"));
			memberDTO.setLev(Integer.parseInt(request.getParameter("lev")));
			MemberDAO memberDAO = new MemberDAO();
			int result=0;
			try {
				result = memberDAO.join(memberDTO);
			} catch (Exception e) {
				// TODO: handle exception
			}
			actionFoward.setCheck(false);
			actionFoward.setPath("../index.jsp");	
			
		}else {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberJoinForm.jsp");
		}
		return actionFoward;
	}

}
