package com.ede.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.member.MemberDTO;

public class ProductWriteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method = request.getMethod();
		
		if(method.equals("POST")) {
			ProductDAO productDAO = new ProductDAO();
			ProductDTO productDTO = new ProductDTO();
			ReplyDTO replyDTO = new ReplyDTO();
			int pro_num = Integer.parseInt(request.getParameter("pro_num"));
			int result=0;
			try {
				MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
				String id = memberDTO.getId();
				replyDTO.setId(id);
				replyDTO.setContents(request.getParameter("contents"));
				replyDTO.setReport(request.getParameter("report"));
				replyDTO.setGrade(Integer.parseInt(request.getParameter("grade")));
				replyDTO.setPro_num(Integer.parseInt(request.getParameter("pro_num")));
				result = productDAO.review(replyDTO);
				if(result >0) {
					actionFoward.setCheck(false);
					actionFoward.setPath("./productView.product?pro_num="+pro_num);
				} else {
					request.setAttribute("message", "fail");
					request.setAttribute("path", "./productView.product");
					actionFoward.setCheck(true);
					actionFoward.setPath("../WEB-INF/view/common/result.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		} else if (method.equals("GET")) {
			int pro_num = Integer.parseInt(request.getParameter("pro_num"));
			request.setAttribute("pro_num",pro_num);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/product/productWrite.jsp");
		}
		return actionFoward;
	}

}