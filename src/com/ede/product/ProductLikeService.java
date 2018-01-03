package com.ede.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class ProductLikeService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int num = Integer.parseInt(request.getParameter("num"));
		int pro_num  = Integer.parseInt(request.getParameter("pro_num"));
		System.out.println("service 에 num : "+num);
		ProductDAO productDAO = null;
		try {
			productDAO = new ProductDAO();
			productDAO.updateThumsup(num);
			List<ReplyDTO> ar = productDAO.reviewList(pro_num);
			request.setAttribute("replyList", ar);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/product/productReply.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return actionFoward;
	}

}
