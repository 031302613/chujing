package com.servlet.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javaBean.*;
import com.Dao.impl.*;
import java.util.ArrayList;
import java.util.List;

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
		System.out.println("tttttttt");
		String type=request.getParameter("news_method").toString();
		System.out.println("type ffffff:"+type+"  length:"+type.length());
		if(type.equals("add")){
			System.out.println("dddddddddd!!");
			if(this.AddNews(request, newsdao)){
				System.out.println("successful!!");
				request.getRequestDispatcher("admin_new_list.jsp").forward(request, response);	
			}
		}
		
		if(type.equals("query_all")){
			if(this.QueryNews(request, newsdao)){
				request.getRequestDispatcher("admin_new_list.jsp").forward(request, response);	
			}
		}
		
		
		
		if(type.equals("query_cond")){
			if(this.QueryNewsByCond(request, newsdao)){
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
	
	protected boolean QueryNews(HttpServletRequest request,NewsDao newsdao){
		List<News> newslist=newsdao.getListByPage(request.getParameter("currentpage"), 2);
		if(newslist==null){
			return false;
		}else{
			request.setAttribute("NEWSLIST", newslist);
			request.setAttribute("NEWS_METHOD", "query_all");
			return true;
		}
	}
	protected boolean QueryNewsByCond(HttpServletRequest request,NewsDao newsdao){
		String query_cond_value=request.getParameter("query_cond_value");
		if(query_cond_value==null||query_cond_value.length()==0){
			return false;
		}
		String query_cond=request.getParameter("query_cond_text");
		String cond="";
		if(query_cond==null||query_cond.length()==0){
			cond="";
		}
		if(query_cond_value.equals("NEWS_ID")){
			cond="AND NEWS_ID=\'"+query_cond+"\'";
		}
		
		if(query_cond_value.equals("NEWS_TITLE_LIKE")){
			cond="AND NEWS_TITLE like \'%"+query_cond+"%\'";
		}
		
		if(query_cond_value.equals("NEWS_PUBLISH_TIME_MORE")){
			cond="AND NEWS_PUBLISH_TIME > date(\'"+query_cond+"\')";
		}
		if(query_cond_value.equals("NEWS_PUBLISH_TIME_EQUAL")){
			cond="AND NEWS_PUBLISH_TIME = date(\'"+query_cond+"\')";
		}
		
		if(query_cond_value.equals("NEWS_PUBLISH_TIME_LESS")){
			cond="AND NEWS_PUBLISH_TIME <date( \'"+query_cond+"\')";
		}
		
		List<News> newslist=newsdao.getListByPageAndCond(cond, request.getParameter("currentpage"), 10);
		if(newslist==null){
			return false;
		}else{
			request.setAttribute("NEWSLIST", newslist);
			request.setAttribute("QUERY_COND_VALUE", query_cond_value);
			request.setAttribute("QUERY_COND_TEXT",query_cond);
			request.setAttribute("NEWS_METHOD", "query_cond");
			return true;
		}
		
	}

}
