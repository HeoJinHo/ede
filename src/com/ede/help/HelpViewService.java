package com.ede.help;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.board.BoardDTO;

public class HelpViewService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int num=0;
		HelpDAO helpDAO = new HelpDAO();
		BoardDTO boardDTO = null;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			helpDAO.hit(num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			boardDTO = helpDAO.selectOne(num);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if(boardDTO != null) {
			request.setAttribute("board", "help");
			request.setAttribute("view", boardDTO);
			actionFoward.setPath("../WEB-INF/view/board/boardView.jsp");
		}else {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "./helpList.help");
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		actionFoward.setCheck(true);
		
		return actionFoward;
	}

}
