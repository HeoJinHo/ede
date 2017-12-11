package com.ede.qna;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ede.action.Action;
import com.ede.action.ActionFoward;
import com.ede.files.FileDAO;
import com.ede.files.FileDTO;
import com.ede.qna.QnaDAO;
import com.ede.qna.QnaDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QnaWriteService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String method=request.getMethod();//GET, POST
		if(method.equals("POST")) {
			QnaDAO qnaDAO = new QnaDAO();
			QnaDTO qnaDTO = new QnaDTO();
			int result=0;
			int result2=0;
			String filePath = request.getServletContext().getRealPath("upload");
			File file = new File(filePath);
			if(!file.exists()) {
				file.mkdirs();
			}
			int maxSize=1024*1024*10;
			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				result = qnaDAO.getNum();
				qnaDTO.setNum(result);
				qnaDTO.setWriter(multi.getParameter("writer"));
				qnaDTO.setTitle(multi.getParameter("title"));
				qnaDTO.setContents(multi.getParameter("contents"));
				//parameter names
				Enumeration<Object> names = multi.getFileNames();
				while(names.hasMoreElements()) {
					String name = (String)names.nextElement();
					String fName = multi.getFilesystemName(name);
		            String oName = multi.getOriginalFileName(name);
		            
		            FileDTO fileDTO = new FileDTO();
		            fileDTO.setoName(oName);
		            fileDTO.setfName(fName);
		            fileDTO.setNum(result);
		            FileDAO fileDAO = new FileDAO();
		            result = fileDAO.insert(fileDTO);
		            	            
		            try {
		            	result2=qnaDAO.insert(qnaDTO);
		            } catch (Exception e) {
		            	// TODO Auto-generated catch block
		            	e.printStackTrace();
		            }
		            
				}
							
			} catch (Exception e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}		
			if(result2*result>0) {
				actionFoward.setCheck(false);
				actionFoward.setPath("./qnaList.qna");
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./qnaList.qna");
				actionFoward.setCheck(true);
				actionFoward.setPath("../WEB-INF/view/common/result.jsp");
				
			}
		}else {
			request.setAttribute("board", "qna");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/board/boardWrite.jsp");
		}
		return actionFoward;
	}

}
