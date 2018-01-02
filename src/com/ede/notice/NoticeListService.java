package com.ede.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.board.BoardDTO;
import com.ede.member.MemberDTO;
import com.ede.util.MakePage;
import com.ede.util.MakeRow;
import com.ede.util.Pageing;

public class NoticeListService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward= new ActionFoward();
		MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
	

			int curPage=1;
			try {
				curPage= Integer.parseInt(request.getParameter("curPage"));
			} catch (Exception e) {
				// TODO: handle exception
			}
			MakeRow makeRow = new MakeRow();
			String kind=request.getParameter("kind");
			makeRow.setKind(kind);
			makeRow.setSearch(request.getParameter("search"));
			NoticeDAO noticeDAO = new NoticeDAO();
			int totalCount=0;
			try {
				totalCount = noticeDAO.getTotalCount(makeRow);
				MakePage makepage = new MakePage(curPage, totalCount);
				makeRow=makepage.getMakeRow(makeRow);
				List<BoardDTO> ar = noticeDAO.selectList(makeRow);
 
				Pageing pageing = makepage.pageing();
				
				request.setAttribute("title", "공지사항");
				request.setAttribute("board", "notice");
				request.setAttribute("list", ar);
				request.setAttribute("page", pageing);
				request.setAttribute("make", makeRow);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/board/boardList.jsp");
		
		return actionFoward;
	}

}
