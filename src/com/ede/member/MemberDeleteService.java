package com.ede.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class MemberDeleteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		int result = 0;
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		if (method.equals("POST")) {
			memberDTO.setId(request.getParameter("id"));
		}
		try {
			result = memberDAO.delete(method);
			String id = request.getParameter("id");
			memberDAO = new MemberDAO();
			result = memberDAO.delete(id);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (result>0) {
			actionFoward.setCheck(false);
			actionFoward.setPath("../index.jsp");
		}else {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "../index.jsp");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		return actionFoward;
	}

}
