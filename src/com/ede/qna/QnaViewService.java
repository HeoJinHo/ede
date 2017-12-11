package com.ede.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.board.BoardDTO;

public class QnaViewService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int num=0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		QnaDAO qnaDAO = new QnaDAO();
		BoardDTO boardDTO = null;
		try {
			boardDTO = qnaDAO.selectOne(num);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if(boardDTO != null) {
			request.setAttribute("board", "qna");
			request.setAttribute("view", boardDTO);
			actionFoward.setPath("../WEB-INF/view/board/boardView.jsp");
		}else {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "./qnaList.qna");
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		actionFoward.setCheck(true);
		
		return actionFoward;
	}

}
