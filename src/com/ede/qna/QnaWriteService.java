package com.ede.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.qna.QnaDAO;
import com.ede.qna.QnaDTO;

public class QnaWriteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method=request.getMethod();//GET, POST
		if(method.equals("POST")) {
			QnaDAO qnaDAO = new QnaDAO();
			QnaDTO qnaDTO = new QnaDTO();
			int num=0;
			try {
				num = qnaDAO.getNum();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			qnaDTO.setNum(num);
			qnaDTO.setWriter(request.getParameter("writer"));
			qnaDTO.setContents(request.getParameter("contents"));
			qnaDTO.setTitle(request.getParameter("title"));
			int result=0;
			try {
				result=qnaDAO.insert(qnaDTO);
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
			actionFoward.setPath("../WEB-INF/view/board/boardWrite.jsp");
		}
		return actionFoward;
	}

}
