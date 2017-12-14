package com.ede.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.board.BoardDTO;
import com.ede.member.MemberDTO;
import com.ede.qna.QnaDAO;
import com.ede.util.MakePage;
import com.ede.util.MakeRow;
import com.ede.util.Pageing;

public class QnaListService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
		if(memberDTO!=null) {
		int curPage=1;
		try {
			curPage= Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
			// TODO: handle exception
		}
		MakeRow makeRow = new MakeRow();
		makeRow.setKind(request.getParameter("kind"));
		makeRow.setSearch(request.getParameter("search"));
		
		QnaDAO noticeDAO = new QnaDAO();
		int totalCount;
		try {
			totalCount = noticeDAO.getTotalCount(makeRow);
			MakePage makePage = new MakePage(curPage, totalCount);
			makeRow=makePage.getMakeRow(makeRow);
			List<BoardDTO> ar=noticeDAO.selectList(makeRow);
			Pageing pageing = makePage.pageing();
			
			request.setAttribute("board", "qna");
			request.setAttribute("list", ar);
			request.setAttribute("page", pageing);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/board/boardList.jsp");
		}else {
			request.setAttribute("message", "로그인하렴");
			request.setAttribute("path", "../index.jsp");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		return actionFoward;
	}

}
