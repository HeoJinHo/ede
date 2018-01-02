package com.ede.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class ProductLikeService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("service 에 num : "+num);
		ProductDAO productDAO = null;
		try {
			productDAO = new ProductDAO();
			productDAO.updateThumsup(num);
			int thumsup = productDAO.selectThumsup(num);
			request.setAttribute("thumsup", thumsup);
			request.setAttribute("num", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/product/productThumsup.jsp");
		return actionFoward;
	}

}
