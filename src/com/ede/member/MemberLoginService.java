package com.ede.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.member.MemberDAO;
import com.ede.member.MemberDTO;

public class MemberLoginService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		
		ActionFoward actionFoward= new ActionFoward();
		String method=request.getMethod();
		if(method.equals("POST")) {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(request.getParameter("id"));
			memberDTO.setPw(request.getParameter("pw"));
			//job
			MemberDAO memberDAO = new MemberDAO();
			try {
				memberDTO = memberDAO.login(memberDTO);
			} catch (Exception e) {
				memberDTO=null;
				e.printStackTrace();
			}
			if(memberDTO != null ) {
				System.out.println(memberDTO.getId());
				request.getSession().setAttribute("member", memberDTO);
				actionFoward.setCheck(false);
				actionFoward.setPath("../index.jsp");
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./memberLogin.member");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}else {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberLoginForm.jsp");
		}
		
		
		return actionFoward;
	}
}
