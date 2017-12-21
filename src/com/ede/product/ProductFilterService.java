package com.ede.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.core.compiler.CategorizedProblem;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class ProductFilterService implements Action {
	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		ProductDAO productDAO = null;
		String del = request.getParameter("del");
		String category = request.getParameter("category");
		String brand = request.getParameter("brand");
		String[] type = request.getParameterValues("type");
		System.out.println("del : "+del);
		System.out.println("category : "+category);
		System.out.println("brand : "+brand);
		for(int i=0;i<type.length;i++) {
			System.out.println("type : "+type[i]);
		}

		if (del.equals("category")) {
			productDAO = new ProductDAO();
			try {
				List<ProductDTO> ar = productDAO.filterList(del, type, category, brand);
				request.setAttribute("list", ar);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (del.equals("brand")) {
			productDAO = new ProductDAO();
			try {
				List<ProductDTO> ar = productDAO.filterList(del, type, category, brand);
				request.setAttribute("list", ar);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("del", del);
		request.setAttribute("brand", brand);
		request.setAttribute("type", type);
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/product/productList.jsp");
		return actionFoward;
	}

}
