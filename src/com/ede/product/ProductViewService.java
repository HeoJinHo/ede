package com.ede.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class ProductViewService implements Action {
	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		ProductDAO productDAO = new ProductDAO();
		ProductDTO productDTO = null;
		String pro_name = request.getParameter("pro_name");
		try {
			productDTO=productDAO.view(pro_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("list", productDTO);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/product/productView.jsp");
		return actionFoward;
	}
}
