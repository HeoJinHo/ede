package com.ede.product;

import java.io.BufferedReader;

import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ede.action.Action;
import com.ede.action.ActionFoward;

public class ProductViewBlogService implements Action {

	@Override
	public ActionFoward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		String query=request.getParameter("query");
		String start=request.getParameter("start");
		String display=request.getParameter("display");
		String clientId = "ouDhdOFbt14QQm9jt5rE";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "eAhVbZGgaX";//애플리케이션 클라이언트 시크릿값";
        try {
			String text = URLEncoder.encode(query, "UTF-8");
			
			String apiURL = "https://openapi.naver.com/v1/search/blog?query="+text+"&start="+start+"&display="+display; // json 결과
			
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer getResult = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                getResult.append(inputLine);
            }
            br.close();
            request.setAttribute("result", getResult.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        actionFoward.setCheck(true);
        actionFoward.setPath("../WEB-INF/view/product/productViewBlog.jsp");
		return actionFoward;
	}

}
