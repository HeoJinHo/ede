package com.ede.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class CategoryListService implements Action{
	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		ProductDAO categoryDAO = new ProductDAO();
		String del = request.getParameter("del");
		if(del.equals("category")) {
			try {
				List<ProductDTO> ar = categoryDAO.categoryList(del);
				request.setAttribute("list", ar);
			} catch (Exception e) {
				e.printStackTrace();
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/product/categoryList.jsp");
		} else if (del.equals("brand")) {
			try {
				List<ProductDTO> ar = categoryDAO.categoryList(del);
				request.setAttribute("list", ar);
			} catch (Exception e) {
				e.printStackTrace();
			}
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/product/brandList.jsp");
		}
		return actionFoward;
	}
}
