package com.ede.help;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class HelpDeleteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int num=0;
		int result=0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			HelpDAO helpDAO = new HelpDAO();
			result = helpDAO.delete(num);
		}catch (Exception e) {
			// TODO: handle exception
		}
		if(result>0) {
			actionFoward.setCheck(false);
			actionFoward.setPath("./helpList.help");
		}else {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "./helpList.help");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		return actionFoward;
	}

}
