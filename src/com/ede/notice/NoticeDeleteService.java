package com.ede.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class NoticeDeleteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int num=0;
		int result=0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			NoticeDAO noticeDAO = new NoticeDAO();
			result = noticeDAO.delete(num);
		}catch (Exception e) {
			// TODO: handle exception
		}
		if(result>0) {
			actionFoward.setCheck(false);
			actionFoward.setPath("./noticeList.notice");
		}else {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "./noticeList.notice");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		return actionFoward;
	}

}
