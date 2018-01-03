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
		MemberDeleteDTO memberDeleteDTO = new MemberDeleteDTO();
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		if (method.equals("POST")) {
			
			int result = 0;
			int result2 = 0;
			memberDeleteDTO.setDeletereason(request.getParameter("delete"));
			memberDeleteDTO.setReason(request.getParameter("delete2"));
				try {
					result = memberDAO.delete(memberDTO.getId());
					result2 = memberDAO.userdelete(memberDeleteDTO, memberDTO);
					request.getSession().invalidate();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				request.setAttribute("message", "탈퇴완료!!");
				request.setAttribute("path", "../index.jsp");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			
		}else{
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "./memberMyPage.member");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/member/memberDeleteForm.jsp");
		}


		return actionFoward;
	}

}
