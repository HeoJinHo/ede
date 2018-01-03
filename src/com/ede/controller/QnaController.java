package com.ede.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.member.MemberDTO;

/**
 * Servlet implementation class QnaController
 */
@WebServlet("/QnaController")
public class QnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> command;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaController() {
        super();
        // TODO Auto-generated constructor stub
    }

   @Override
   	public void init(ServletConfig config) throws ServletException {
	   command = new HashMap<>();
	   String filePath = config.getServletContext().getRealPath("WEB-INF/properties");
	   String fileName = config.getInitParameter("properties");
	   File file = new File(filePath, fileName);
	   System.out.println(filePath);
	   FileInputStream fi = null;
	   Properties prop = new Properties();
	   
	   try {
			fi = new FileInputStream(file);
			prop.load(fi);
			Iterator<Object> it = prop.keySet().iterator();
			while(it.hasNext()) {
				String key = (String)it.next();
				String value= (String)prop.get(key);
				Class ins = Class.forName(value);
				Object obj = ins.newInstance();
				command.put(key, obj);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				fi.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
   	
   	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		Action action = null;
		ActionFoward actionFoward = null;
		MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
		action = (Action)command.get(path);		
		actionFoward = action.doProcess(request, response);
		if(memberDTO==null) {			
			request.setAttribute("message", "로그인 하십시오");
			request.setAttribute("path", "../index.jsp");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/common/result.jsp");
		}
		if(actionFoward.isCheck()) {
			RequestDispatcher view = request.getRequestDispatcher(actionFoward.getPath());
			view.forward(request, response);
		}else {
			response.sendRedirect(actionFoward.getPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
