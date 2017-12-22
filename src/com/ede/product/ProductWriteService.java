package com.ede.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.member.MemberDTO;

public class ProductWriteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		ProductDAO productDAO = new ProductDAO();
		ProductDTO productDTO = new ProductDTO();
		ReplyDTO replyDTO = new ReplyDTO();
		int pro_num = Integer.parseInt(request.getParameter("pro_num"));
		int grade = Integer.parseInt(request.getParameter("grade"));
		int result=0;
		try {
			MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
			String id = memberDTO.getId();
			replyDTO.setId(id);
			replyDTO.setContents(request.getParameter("contents"));
			replyDTO.setReport(request.getParameter("report"));
			replyDTO.setGrade(grade);
			replyDTO.setPro_num(Integer.parseInt(request.getParameter("pro_num")));
			result = productDAO.review(replyDTO);	//새 댓글 insert
			System.out.println("after insert review 'grade' : "+grade);//들어옴
			System.out.println("after insert review 'pro_num' : "+pro_num);//들어옴
			productDAO.avgUpdate(grade, pro_num);	//avg update
			System.out.println("update done");
			List<ReplyDTO> ar = productDAO.reviewList(pro_num);
			if(result >0) {
				request.setAttribute("replyList", ar);
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/product/productReply.jsp");
			} else {
				request.setAttribute("message", "fail");
				request.setAttribute("path", "./productView.product");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	return actionFoward;
	}
}
