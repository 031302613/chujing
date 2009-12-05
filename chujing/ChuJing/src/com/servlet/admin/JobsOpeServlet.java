package com.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Dao.impl.*;

/**
 * Servlet implementation class JobsOpeServlet
 */
public class JobsOpeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobsOpeServlet() {
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
		response.setContentType("text/html;charset=utf-8"); 
		request.setCharacterEncoding("utf-8"); 
		JobDao jobdao=new JobDao();
		PrintWriter out= response.getWriter();
		String type=request.getParameter("job_method").toString();
		if(type.equals("job_add")){
			System.out.println("dddddddddd!!");
			if(this.addJob(request, jobdao)){
				System.out.println("successful!!-------------------------");
				request.getRequestDispatcher("NewsOpeServlet?news_method=query_all").forward(request, response);	
			}
		}
		
/*		if(type.equals("query_all")){
			if(this.QueryNews(request, newsdao)){
				System.out.println("query_all is successfull!");
				request.getRequestDispatcher("admin_new_list.jsp").forward(request, response);	
			}
		}
		
		
		
		if(type.equals("query_cond")){
			if(this.QueryNewsByCond(request, newsdao)){
				request.getRequestDispatcher("admin_new_list.jsp").forward(request, response);	
			}
		}
			
		if(type.equals("news_delete")){
			if(this.deleteNews(request, newsdao)){
				out.println("<script language='javascript'>alert('操作成功');"+"window.location.href='NewsOpeServlet?news_method=query_all';</script>");	
			}
		}
		
		if(type.equals("news_edit")){
			if(this.editNews(request, newsdao)){
				request.getRequestDispatcher("admin_news_edit.jsp").forward(request, response);	
			}
		}
		
		if(type.equals("news_edit_submit")){
			if(this.editNewsAndSubmit(request, newsdao)){
				out.println("<script language='javascript'>alert('操作成功');"+"window.location.href='NewsOpeServlet?news_method=query_all';</script>");	
			}
		}*/
	}
	protected boolean addJob(HttpServletRequest request,JobDao jobdao){
		String title=request.getParameter("job_title");
		String content=request.getParameter("content");
		String date=request.getParameter("job_deadline_date");
		System.out.println("content:"+content+" title:"+title);
		if(title==null||content==null||title.length()==0||content.length()==0||date==null||date.length()==0){
			System.out.println("fail:"+content+" title:"+title);
			return false;
		}
		return jobdao.AddJob(title, content,date);
	}

}
