package com.ede.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class QnaDeleteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int num=0;
		int result=0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			QnaDAO qnaDAO = new QnaDAO();
			result = qnaDAO.delete(num);
		}catch (Exception e) {
			// TODO: handle exception
		}
		if(result>0) {
			actionFoward.setCheck(false);
			actionFoward.setPath("./qnaList.qna");
		}else {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "./qnaList.qna");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		return actionFoward;
	}

}
