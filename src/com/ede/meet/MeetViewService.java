package com.ede.meet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class MeetViewService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int m_seq = 0;
		try {
			m_seq = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		MeetDAO meetDAO = new MeetDAO();
		MeetDTO meetDTO = null;
		try {
			meetDTO = meetDAO.selectOne(m_seq);
			System.out.println("===================================");
			System.out.println(meetDTO.getM_addr()); 
			System.out.println("===================================");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(meetDTO != null) {
			actionFoward.setPath("../WEB-INF/view/meet/meetView.jsp");
			request.setAttribute("view", meetDTO);
		}else {
			request.setAttribute("message", "viewfail");
			request.setAttribute("path", "./meetList.meet");
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		actionFoward.setCheck(true);
		return actionFoward;
	}

}
