package com.ede.meet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class MeetApplyService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		if(request.getMethod().equals("POST")) {
			
		}else {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/meet/meetApply.jsp");
		}
		
		
		return actionFoward;
	}

}
