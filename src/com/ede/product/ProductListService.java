package com.ede.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class ProductListService implements Action{
	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		ProductDAO categoryDAO = new ProductDAO();
		System.out.println(request.getServletContext());
		try {
			List<ProductDTO> ar = categoryDAO.selectList();
			request.setAttribute("list", ar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/product/productList.jsp");
		return actionFoward;
	}

}
