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
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		if(method.equals("POST")) {
			memberDTO = (MemberDTO)request.getSession().getAttribute("member");
			memberDTO.setPw(request.getParameter("pw"));
			memberDTO.setName(request.getParameter("name"));
			memberDTO.setNickname(request.getParameter("nickname"));
			memberDTO.setBirth(request.getParameter("birth"));
			memberDTO.setGender(request.getParameter("gender"));
			memberDTO.setAddr(request.getParameter("addr"));
			memberDTO.setPhone(request.getParameter("phone"));
			memberDTO.setEmail(request.getParameter("email"));
			int result = 0;
			try {
				result=memberDAO.update(memberDTO);
			} catch (Exception e) {
				// TODO: handle exception
			}
			if(result>0) {
				actionFoward.setCheck(false);
				actionFoward.setPath("../index.jsp");
			}else{
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./memberMyPage.member");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}else {		
				request.setAttribute("member2", "member");
				actionFoward.setPath("../WEB-INF/view/member/memberUpdateForm.jsp");
			if(memberDTO==null) {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./memberMyPage.member");
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
			actionFoward.setCheck(true);
		
		}
		return actionFoward;
	}
}


