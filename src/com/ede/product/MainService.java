package com.ede.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class MainService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		ProductDAO categoryDAO = new ProductDAO();
		String del = request.getParameter("del");

		try {
			List<ProductDTO> ar = categoryDAO.categoryList(del);
			request.setAttribute("list", ar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/product/mainList.jsp");

		return actionFoward;
	}

}
