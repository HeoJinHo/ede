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

/**
 * Servlet implementation class MeetController
 */
@WebServlet("/MeetController")
public class MeetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> command;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MeetController() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
    	//1. command  객체 생성
    	command = new HashMap<>();
    	//2. property 파일의 경로 명 가져 오기
    	String filePath=config.getServletContext().getRealPath("WEB-INF/properties");
    	//3. property 파일 이름 가져 오기
    	String fileName=config.getInitParameter("property");
    	//4. 파일의 내용을 읽어올 준비
    	File file = new File(filePath, fileName);
    	FileInputStream fi = null;
    	Properties prop = new Properties();
    	
    	//5. 파일의 내용을 읽어서 파싱 한 다음 저장
    	try {
			fi = new FileInputStream(file);
			prop.load(fi);
		//6. prop 키를 읽어서 value를 찾아서 객체 생성
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
		Action action=null;
		ActionFoward actionFoward=null;
		
		action = (Action)command.get(path);
		
		actionFoward = action.doProcess(request, response);
		
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
