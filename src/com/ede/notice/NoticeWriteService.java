package com.ede.notice;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NoticeWriteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method=request.getMethod();//GET, POST
		if(method.equals("POST")) {
			NoticeDAO noticeDAO = new NoticeDAO();
			NoticeDTO noticeDTO = new NoticeDTO();
			String filePath = request.getServletContext().getRealPath("upload");
			File file = new File(filePath);
			if(!file.exists()) {
				file.mkdirs();
			}
			int maxSize=1024*1024*10;
			
			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				noticeDTO.setWriter(multi.getParameter("writer"));
				noticeDTO.setTitle(multi.getParameter("title"));
				noticeDTO.setContents(multi.getParameter("contents"));
				//parameter names
				Enumeration<Object> names = multi.getFileNames();
				while(names.hasMoreElements()) {
					String name = (String)names.nextElement();
				}
				
				String fileName = multi.getFilesystemName("f1");
				String oriName = multi.getOriginalFileName("f1");
				System.out.println("저장된 경로 : "+filePath);
				System.out.println("fileName :"+fileName);
				System.out.println("oriName : "+oriName);
				
			} catch (IOException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			
			int num=0;
			try {
				num = noticeDAO.getNum();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			noticeDTO.setNum(num);
			
			int result=0;
			try {
				result=noticeDAO.insert(noticeDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			if(result>0) {
				actionFoward.setCheck(false);
				actionFoward.setPath("./noticeList.notice");
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./noticeList.notice");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
				
			}
			
			//insert
		}else {
			request.setAttribute("board", "notice");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/board/boardWrite.jsp");
		}
		
		
		
		
		return actionFoward;
	}

}
