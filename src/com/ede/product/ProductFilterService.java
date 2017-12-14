package com.ede.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class ProductFilterService implements Action {
	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String del = request.getParameter("del");
		ProductDAO productDAO = null;
		String type = request.getParameter("type");
		String category = request.getParameter("category");
		String brand = request.getParameter("brand");
		
		if(del.equals("category")) {
			productDAO = new ProductDAO();
			try {
				List<ProductDTO> ar = productDAO.filterList(del, type, category, brand);
				request.setAttribute("list", ar);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(del.equals("brand")) {
			try {
				productDAO = new ProductDAO();
				List<ProductDTO> ar = productDAO.filterList(del, type, category, brand);
				request.setAttribute("list", ar);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/product/productList.jsp");
		return actionFoward;
	}

}
