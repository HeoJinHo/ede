package com.ede.catego;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class CategoryListService implements Action {
	
	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		CategoryDAO categoryDAO = new CategoryDAO();
		List<CategoryDTO> ar = null;
		try {
			ar = categoryDAO.selectList();
			System.out.println((ar.get(0)).getBrand());
		} catch (Exception e) {
		}
		if(ar != null) {
			request.setAttribute("test", "test");
			request.setAttribute("list", ar);
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/category/categoryList.jsp");
		} else {
			System.out.println("empty");
		}
		
		return actionFoward;
	}
	
	
	

}
