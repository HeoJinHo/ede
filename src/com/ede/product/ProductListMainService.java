package com.ede.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class ProductListMainService implements Action{

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String del = request.getParameter("del");
		String brand = request.getParameter("brand");
		String category = request.getParameter("category");
		ProductDAO productDAO = null;
		if(del.equals("category")) {
			productDAO = new ProductDAO();
			try {
				List<ProductDTO> ar = productDAO.productList(del,brand,category);
				request.setAttribute("list", ar);
				request.setAttribute("del", "category");
				request.setAttribute("category", category);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (del.equals("brand")) {
			productDAO = new ProductDAO();
			try {
				List<ProductDTO> ar = productDAO.productList(del,brand,category);
				request.setAttribute("list", ar);
				request.setAttribute("del", "brand");
				//System.out.println(brand+" : brand in productService");
				request.setAttribute("brand", brand);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/product/productListMain.jsp");
		return actionFoward;
	}
}
