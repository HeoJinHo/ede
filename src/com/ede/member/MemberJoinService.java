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
			memberDTO.setAddr(request.getParameter("addr2"));
			memberDTO.setPhone(request.getParameter("phone"));
			memberDTO.setNickname(request.getParameter("nickname"));
			memberDTO.setName(request.getParameter("name"));
			memberDTO.setBirth(request.getParameter("birth"));
			memberDTO.setGender(request.getParameter("gender"));
			memberDTO.setEmail(request.getParameter("email"));
			memberDTO.setSkin(request.getParameter("skin"));
		/*	memberDTO.setPic_name(request.getParameter("pic_name"));
			memberDTO.setPic_path(request.getParameter("pic_path"));*/
			MemberDAO memberDAO = new MemberDAO();
			int result=0;
			try {
				result = memberDAO.join(memberDTO);
			} catch (Exception e) {
				// TODO: handle exception
			}
			if(result>0) {
			actionFoward.setCheck(false);
			actionFoward.setPath("../index.jsp");	
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./memberJoin.member");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}else {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberJoinForm.jsp");
		}
		return actionFoward;
	}

}
