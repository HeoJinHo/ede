package com.ede.meet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class MeetWriteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		if(method.equals("POST")) {
			MeetDTO meetDTO = new MeetDTO();
			MeetDAO meetDAO = new MeetDAO();
			
			int num = 0;
			try {
				num=meetDAO.getNum();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			meetDTO.setM_num(num);
			meetDTO.setId(request.getParameter("id"));
			meetDTO.setM_name(request.getParameter("m_name"));
			meetDTO.setM_title(request.getParameter("m_title"));
			meetDTO.setM_contents(request.getParameter("m_contents"));
			meetDTO.setStart_date(request.getParameter("start_date"));
			meetDTO.setLast_date(request.getParameter("last_date"));
			meetDTO.setStart_apply(request.getParameter("start_apply"));
			meetDTO.setLast_apply(request.getParameter("last_apply"));
			meetDTO.setM_addr(request.getParameter("m_addr"));
			meetDTO.setM_detail_addr(request.getParameter("m_detail_addr"));
			meetDTO.setM_price(Integer.parseInt(request.getParameter("m_price")));
			meetDTO.setM_ref(Integer.parseInt(request.getParameter("m_ref")));
			meetDTO.setM_step(Integer.parseInt(request.getParameter("m_step")));
			meetDTO.setM_depth(Integer.parseInt(request.getParameter("m_depth")));
			meetDTO.setM_phone(request.getParameter("m_phone"));
			meetDTO.setM_email(request.getParameter("m_email"));
			meetDTO.setM_hit(Integer.parseInt(request.getParameter("m_hit")));
			meetDTO.setTotal_seats(Integer.parseInt(request.getParameter("total_seats")));
			int result = 0; 
			try {
				result = meetDAO.insert(meetDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(result>0) {
				actionFoward.setCheck(false);
				actionFoward.setPath("./meetView.meet?num="+num);
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./meetList.meet");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
				
			}
			
		}else {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/meet/meetWrite.jsp");
		}
		return actionFoward;
	}

}
