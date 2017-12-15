package com.ede.help;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.board.BoardDTO;

public class HelpReplyService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		if(method.equals("POST")) {
			HelpDTO helpDTO = new HelpDTO();
			helpDTO.setNum(Integer.parseInt(request.getParameter("num")));
			helpDTO.setTitle(request.getParameter("title"));
			helpDTO.setContents(request.getParameter("contents"));
			helpDTO.setWriter(request.getParameter("writer"));
			HelpDAO helpDAO = new HelpDAO();
			HelpDTO parent;
			int result =0;
			try {
				parent = (HelpDTO) helpDAO.selectOne(helpDTO.getNum());
				helpDAO.replyUpdate(parent);
				result = helpDAO.replyInsert(helpDTO, parent);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(result>0) {
				actionFoward.setCheck(false);
				actionFoward.setPath("./helpList.help");
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./helpList.help");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
				
			}
			
			
		}else {
			request.setAttribute("board", "help");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/board/boardReply.jsp");
						
		}
		
		
		
		return actionFoward;
	}

}
