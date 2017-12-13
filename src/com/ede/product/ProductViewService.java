package com.ede.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

import oracle.net.aso.r;

public class ProductViewService implements Action {
	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		ProductDAO productDAO = new ProductDAO();
		ProductDTO productDTO = null;
		List<ReplyDTO> ar = null;
		int pro_num=Integer.parseInt(request.getParameter("pro_num"));
		try {
			productDTO=productDAO.view(pro_num);
			ar=productDAO.reviewList(pro_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("replyList", ar);
		request.setAttribute("list", productDTO);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/product/productView.jsp");
		return actionFoward;
	}
}
