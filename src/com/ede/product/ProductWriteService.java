package com.ede.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class ProductWriteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		int pro_num = Integer.parseInt(request.getParameter("pro_num")); 
		System.out.println(pro_num+"request가 살아서 왔는지 check");
		int num=0;
		if(method.equals("POST")) {
			ProductDAO productDAO = new ProductDAO();
			ProductDTO productDTO = new ProductDTO();
			try {
				num = productDAO.review(pro_num);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//todo
			
			
		} else if (method.equals("GET")) {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/product/productWrite.jsp");
		}
		return actionFoward;
	}

}
