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
			//파라미터로 넘어온 값을 받아서 db에 저장해준다.
			//게시글의 신청인원수를 줄여준다. applyCount 메서드 사용
			//개설자에게 이메일을 보내준다.?? no need
			ApplyDTO applyDTO = new ApplyDTO();
			MeetDAO meetDAO = new MeetDAO();
			int num = 0;
			//applyDTO.setId(request.getParameter("id")); 세션에서 꺼내기
			applyDTO.setId("testapply");
			applyDTO.setM_num(Integer.parseInt(request.getParameter("m_num")));
			System.out.println(request.getParameter("m_num"));
			applyDTO.setA_name(request.getParameter("a_name"));
			applyDTO.setA_gender(request.getParameter("a_gender"));
			applyDTO.setA_age(Integer.parseInt(request.getParameter("a_age")));
			applyDTO.setA_phone(request.getParameter("a_phone"));
			applyDTO.setA_email(request.getParameter("a_email"));
			
			try {
				num=meetDAO.applyInsert(applyDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			request.setAttribute("message", "you are applied");
			request.setAttribute("path", "../meet/meetList.meet");
			
			
		}else {
			int a = Integer.parseInt(request.getParameter("m_num"));
			request.setAttribute("m_num", a);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/meet/meetApply.jsp");
		}
		
		
		return actionFoward;
	}

}
