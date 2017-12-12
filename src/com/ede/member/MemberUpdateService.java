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
		System.out.println(method);
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		if(method.equals("POST")) {
			memberDTO = (MemberDTO)request.getSession().getAttribute("member");
			int result = 0;
			try {
				result=memberDAO.update(memberDTO);
			} catch (Exception e) {
				// TODO: handle exception
			}
			System.out.println(1);
			if(result>0) {
				System.out.println(2);
				actionFoward.setCheck(false);
				System.out.println(3);
				actionFoward.setPath("../index.jsp");
				System.out.println(4);
			}else{
				System.out.println(5);
				request.setAttribute("message", "Fail");
				System.out.println(6);
				request.setAttribute("path", "./memberMyPage.member");
				System.out.println(7);
				actionFoward.setCheck(true);
				System.out.println(8);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
				System.out.println(9);
			}
		}else {		
				System.out.println(10);
				
				System.out.println(11);
				request.setAttribute("member2", "member");
				System.out.println(12);
				actionFoward.setPath("../WEB-INF/view/member/memberUpdateForm.jsp");
			if(memberDTO==null) {
				System.out.println(13);
				request.setAttribute("message", "Fail");
				System.out.println(14);
				request.setAttribute("path", "./memberMyPage.member");
				System.out.println(15);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
				System.out.println(16);
			}
			actionFoward.setCheck(true);
		
		}
		return actionFoward;
	}
}


