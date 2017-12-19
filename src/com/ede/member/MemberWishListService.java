package com.ede.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class MemberWishListService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		MemberDAO memberDAO = new MemberDAO();
		return null;
	}

}
 