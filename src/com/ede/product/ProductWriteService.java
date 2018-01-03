package com.ede.product;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
		ReplyDTO replyDTO = new ReplyDTO();
		int pro_num = Integer.parseInt(request.getParameter("pro_num"));
		int grade = Integer.parseInt(request.getParameter("grade"));
		int result=0;
		try {
			MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
			String id = memberDTO.getId();
			String gender = memberDTO.getGender();
			String skin = memberDTO.getSkin();
			String birth = memberDTO.getBirth();
			
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date =  sdf.parse(birth);
			int year = cal.get(Calendar.YEAR);
			cal.setTime(date);
			int birthyear = cal.get(Calendar.YEAR);
			
			birth = year-birthyear+1+"";
			System.out.println(birth);
			
			
			replyDTO.setId(id);
			replyDTO.setGender(gender);
			replyDTO.setSkin(skin);
			replyDTO.setBirth(birth);
			
			replyDTO.setContents(request.getParameter("contents"));
			replyDTO.setGrade(grade);
			replyDTO.setThumsup(0);
			replyDTO.setPro_num(Integer.parseInt(request.getParameter("pro_num")));
			
			result = productDAO.review(replyDTO);	//새 댓글 insert
			productDAO.avgUpdate(grade, pro_num);	//avg update
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
