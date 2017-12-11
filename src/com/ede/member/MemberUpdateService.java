package com.ede.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class MemberUpdateService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = null;
		if(method.equals("POST")) {
			memberDTO = new MemberDTO();
			int result = 0;
			try {
				memberDTO.setId(request.getParameter("id"));
				memberDTO.setPw(request.getParameter("pw"));
				memberDTO.setBirth(request.getParameter("birth"));
				memberDTO.setGender(request.getParameter("gender"));
				memberDTO.setAddr(request.getParameter("addr"));
				memberDTO.setPhone(request.getParameter("phone"));
				memberDTO.setEmail(request.getParameter("email"));
				result=memberDAO.update(memberDTO);
			} catch (Exception e) {
				// TODO: handle exception
			}
			if(result>0) {
				actionFoward.setCheck(false);
				actionFoward.setPath("../index.jsp");
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./memberMyPage.member");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}else {
			String id = null;
			try {
				id = request.getParameter("id");			
			} catch (Exception e) {
				// TODO: handle exception
			}
			if(memberDTO != null) {
				request.setAttribute("view", memberDTO);
				actionFoward.setPath("../WEB-INF/member/memberUpdateForm.jsp");
				request.setAttribute("member", "member");
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./memberMyPage.member");
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
			actionFoward.setCheck(true);
		}
		return actionFoward;
	}

}
