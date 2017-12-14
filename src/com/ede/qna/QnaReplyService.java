package com.ede.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.board.BoardDTO;

public class QnaReplyService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		if(method.equals("POST")) {
			QnaDTO qnaDTO = new QnaDTO();
			qnaDTO.setNum(Integer.parseInt(request.getParameter("num")));
			qnaDTO.setTitle(request.getParameter("title"));
			qnaDTO.setContents(request.getParameter("contents"));
			qnaDTO.setWriter(request.getParameter("writer"));
			System.out.println(qnaDTO);
			QnaDAO qnaDAO = new QnaDAO();
			QnaDTO parent;
			int result =0;
			try {
				parent = (QnaDTO) qnaDAO.selectOne(qnaDTO.getNum());
				qnaDAO.replyUpdate(parent);
				result = qnaDAO.replyInsert(qnaDTO, parent);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
			request.setAttribute("board", "qna");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/board/boardReply.jsp");
						
		}
		
		
		
		return actionFoward;
	}

}
