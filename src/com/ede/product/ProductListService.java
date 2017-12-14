package com.ede.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class ProductListService implements Action{

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String del = request.getParameter("del");
		String brand =request.getParameter("brand");
		ProductDAO productDAO = null;
		if(del.equals("category")) {
			productDAO = new ProductDAO();
			try {
				List<ProductDTO> ar = productDAO.productList(del,brand);
				request.setAttribute("list", ar);
				request.setAttribute("del", "category");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (del.equals("brand")) {
			productDAO = new ProductDAO();
			try {
				List<ProductDTO> ar = productDAO.productList(del,brand);
				request.setAttribute("list", ar);
				request.setAttribute("del", "brand");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/product/productList.jsp");
		return actionFoward;
	}
}
