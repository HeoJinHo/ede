package com.ede.category;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class CategoryService implements Action{
	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		CategoryDAO categoryDAO = new CategoryDAO();
		CategoryDTO categoryDTO = new CategoryDTO();
		try {
			List<CategoryDTO> ar = categoryDAO.selectList();
			request.setAttribute("list", ar);
		} catch (Exception e) {
			
		}
		actionFoward.setCheck(true);
		actionFoward.setPath("../WEB-INF/view/category/categoryList.jsp");
		
		
		return actionFoward;
	}
	
	
	

}
