package com.ede.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.member.MemberDTO;


public class MemberMypageService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
		
		
		request.setAttribute("member", memberDTO);
		ActionFoward actionFoward = new ActionFoward();
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/member/memberMyPageForm.jsp");
		
		return actionFoward;
	}

}
