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
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		if (method.equals("POST")) {
			int result = 0;
			try {
				result = memberDAO.delete(memberDTO.getId());

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			if(result>0) {
				request.getSession().invalidate();
				actionFoward.setCheck(false);
				actionFoward.setPath("../index.jsp");
			}else{
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./memberUpdate.member");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}else{
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "./memberMyPage.member");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}


		return actionFoward;
	}

}
