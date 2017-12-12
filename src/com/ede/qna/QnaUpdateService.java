package com.ede.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.board.BoardDTO;

public class QnaUpdateService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		QnaDAO qnaDAO = new QnaDAO();
		BoardDTO boardDTO = null;
		if(method.equals("POST")) {
			boardDTO = new BoardDTO();
			int result = 0;
			try {
				boardDTO.setNum(Integer.parseInt(request.getParameter("num")));
				boardDTO.setTitle(request.getParameter("title"));
				boardDTO.setContents(request.getParameter("contents"));
				result=qnaDAO.update(boardDTO);
			} catch (Exception e) {
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
			
		}else {
			int num=0;
			try {
			num = (Integer.parseInt(request.getParameter("num")));
			boardDTO=qnaDAO.selectOne(num);
			}catch (Exception e) {
				// TODO: handle exception
			}
			if(boardDTO != null) {
				request.setAttribute("view", boardDTO);
				actionFoward.setPath("../WEB-INF/view/board/boardUpdate.jsp");
				request.setAttribute("board", "qna");
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./qnaList.qna");
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
			actionFoward.setCheck(true);
		}
		
		return actionFoward;
	}

}
