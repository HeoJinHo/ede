package com.ede.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class MemberDeleteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int result = 0;
		try {
			String id = request.getParameter("id");
			MemberDAO memberDAO = new MemberDAO();
			result = memberDAO.delte(id);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
