package com.ede.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class ProductRegistService implements Action{

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		if(method.equals("POST")) {
			ProductDAO productDAO = new ProductDAO();
			ProductDTO productDTO = new ProductDTO();
			int num = 0;
			try {
				num = productDAO.getNum();
			} catch (Exception e) {
			}
			productDTO.setPro_num(num);
			productDTO.setBrand(request.getParameter("brand"));
			productDTO.setPro_name(request.getParameter("pro_name"));
			productDTO.setPro_price(Integer.parseInt(request.getParameter("pro_price")));
			productDTO.setCapacity(Integer.parseInt(request.getParameter("capacity")));
			productDTO.setInfo(request.getParameter("info"));
			productDTO.setGrade1(Integer.parseInt(request.getParameter("grade1")));
			productDTO.setGrade2(Integer.parseInt(request.getParameter("grade2")));
			productDTO.setGrade3(Integer.parseInt(request.getParameter("grade3")));
			productDTO.setGrade4(Integer.parseInt(request.getParameter("grade4")));
			productDTO.setGrade5(Integer.parseInt(request.getParameter("grade5")));
			productDTO.setPic_realName(request.getParameter("pic_realName"));
			productDTO.setPic_compName(request.getParameter("pic_compName"));
			productDTO.setEvt(Integer.parseInt(request.getParameter("evt")));
			productDTO.setCategory(request.getParameter("category"));
			int result = 0;
			try {
				result=productDAO.regist(productDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(result>0) {
				actionFoward.setCheck(false);
				actionFoward.setPath("./productList.product");
			}
		} else {
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/product/productRegist.jsp");
		}
		
		return actionFoward;
	}
}
