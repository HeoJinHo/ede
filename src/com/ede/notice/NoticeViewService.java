package com.ede.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.board.BoardDTO;

public class NoticeViewService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int num=0;
		NoticeDAO noticeDAO = new NoticeDAO();
		BoardDTO boardDTO=null;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			noticeDAO.hit(num);
		}catch (Exception e) {
			// TODO: handle exception
		}
		try {
			boardDTO = noticeDAO.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(boardDTO != null) {

			request.setAttribute("board", "notice");
			request.setAttribute("view", boardDTO);
			actionFoward.setPath("../WEB-INF/view/board/boardView.jsp");
		}else {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "./noticeList.notice");
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		actionFoward.setCheck(true);


		return actionFoward;
	}

}
