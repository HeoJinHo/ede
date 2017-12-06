package com.ede.meet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.util.MakePage;
import com.ede.util.MakeRow;
import com.ede.util.Pageing;

public class MeetService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		//curPage null
		int curPage=1;
		try {
			curPage= Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
			// TODO: handle exception
		}
		MakeRow makeRow = new MakeRow();
		makeRow.setKind(request.getParameter("kind"));
		makeRow.setSearch(request.getParameter("search"));
		
		
		MeetDAO meetDAO = new MeetDAO();
		int totalCount;
		try {
			//페이징 처리
			totalCount = meetDAO.getTotalCount(makeRow);
			MakePage makePage = new MakePage(curPage, totalCount);
			makeRow=makePage.getMakeRow(makeRow);
			Pageing pageing = makePage.pageing();

			List<MeetDTO> ar=meetDAO.selectList(makeRow);
			request.setAttribute("board", "notice");
			request.setAttribute("list", ar);
			request.setAttribute("page", pageing);
			request.setAttribute("make", makeRow);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//전송
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/meet/meetList.jsp");
		
		
		
		return actionFoward;
	}

}
