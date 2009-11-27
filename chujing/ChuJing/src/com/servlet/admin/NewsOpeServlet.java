package com.servlet.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javaBean.*;
import com.Dao.impl.*;

/**
 * Servlet implementation class NewsOpeServlet
 */
public class NewsOpeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsOpeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("gb2312");
		NewsDao newsdao=new NewsDao();
		String type=request.getParameter("news_method").toString();
		System.out.println("type:"+type+"  length:"+type.length());
		if(type.equals("add")){
			System.out.println("dddddddddd!!");
			if(this.AddNews(request, newsdao)){
				System.out.println("successful!!");
				request.getRequestDispatcher("admin_new_list.jsp").forward(request, response);	
			}
		}
	}
	
	protected boolean AddNews(HttpServletRequest request,NewsDao newsdao){
		String title=request.getParameter("news_title");
		String content=request.getParameter("content");
		System.out.println("content:"+content+" title:"+title);
		if(title==null||content==null||title.length()==0||content.length()==0){
			System.out.println("fail:"+content+" title:"+title);
			return false;
		}
		return newsdao.AddNews(title, content);
	}

}
