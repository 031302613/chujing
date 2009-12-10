package com.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Dao.impl.*;
import com.javaBean.Job;
import com.javaBean.News;

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
			if(this.addJob(request, jobdao)){
				out.println("<script language='javascript'>alert('添加成功');"+"window.location.href='JobsOpeServlet?job_method=query_all';</script>");	
			}
		}
		
		if(type.equals("query_all")){
			if(this.QueryJob(request, jobdao)){
				request.getRequestDispatcher("admin_job_list.jsp").forward(request, response);	
			}
		}
		
		
		
		if(type.equals("query_cond")){
			if(this.QueryJobByCond(request, jobdao)){
				request.getRequestDispatcher("admin_job_list.jsp").forward(request, response);	
			}
		}
		
		if(type.equals("job_delete")){
			if(this.deleteJob(request, jobdao)){
				out.println("<script language='javascript'>alert('操作成功');"+"window.location.href='JobsOpeServlet?job_method=query_all';</script>");	
			}
		}
		
		if(type.equals("job_edit")){
			if(this.editJob(request, jobdao)){
				request.getRequestDispatcher("admin_job_edit.jsp").forward(request, response);	
			}
		}
		
		if(type.equals("job_edit_submit")){
			if(this.editJobAndSubmit(request, jobdao)){
				out.println("<script language='javascript'>alert('操作成功');"+"window.location.href='JobsOpeServlet?job_method=query_all';</script>");	
			}
		}
	}
	protected boolean addJob(HttpServletRequest request,JobDao jobdao){
		String title=request.getParameter("job_title");
		String content=request.getParameter("content");
		String date=request.getParameter("job_deadline_date");
		if(title==null||content==null||title.length()==0||content.length()==0||date==null||date.length()==0){
			return false;
		}
		return jobdao.AddJob(title, content,date);
	}
	
	protected boolean QueryJobByCond(HttpServletRequest request,JobDao jobdao){
		String query_cond_value=request.getParameter("query_cond_value");
		if(query_cond_value==null||query_cond_value.length()==0){
			return false;
		}
		String query_cond=request.getParameter("query_cond_text");
		String cond="";
		if(query_cond==null||query_cond.length()==0){
			cond="";
		}
		if(query_cond_value.equals("JOB_ID_EQUAL")){
			cond="AND JOB_ID=\'"+query_cond+"\'";
		}
		
		if(query_cond_value.equals("JOB_TITLE_LIKE")){
			cond="AND JOB_TITLE like \'%"+query_cond+"%\'";
		}
		
		if(query_cond_value.equals("JOB_PUBLISH_TIME_MORE")){
			cond="AND JOB_PUBLISH_TIME > date(\'"+query_cond+"\')";
		}
		if(query_cond_value.equals("JOB_PUBLISH_TIME_EQUAL")){
			cond="AND JOB_PUBLISH_TIME = date(\'"+query_cond+"\')";
		}
		
		if(query_cond_value.equals("JOB_PUBLISH_TIME_LESS")){
			cond="AND JOB_PUBLISH_TIME <date( \'"+query_cond+"\')";
		}
		
		List<Job> joblist=jobdao.getListByPageAndCond(cond, request.getParameter("page"), 12);
		if(joblist==null){
			return false;
		}else{
			request.setAttribute("JOBLIST", joblist);
			request.setAttribute("QUERY_COND_VALUE", query_cond_value);
			request.setAttribute("QUERY_COND_TEXT_APP",query_cond);
			request.setAttribute("JOB_METHOD", "query_cond");
			return true;
		}
		
	}
	
	
	protected boolean QueryJob(HttpServletRequest request,JobDao jobdao){
		List<Job> joblist=jobdao.getListByPage(request.getParameter("page"), 12);
		if(joblist==null){
			return false;
		}else{
			request.setAttribute("JOBLIST", joblist);
			request.setAttribute("JOB_METHOD", "query_all");
			return true;
		}
	}
	
	protected boolean deleteJob(HttpServletRequest request,JobDao jobdao){
		String id=request.getParameter("job_id").toString();
		return jobdao.DeleteJob(id);
	}
	
	
	protected boolean editJob(HttpServletRequest request,JobDao jobdao){
		String id=request.getParameter("job_id").toString();
		Job job=jobdao.getByID(id);
		request.setAttribute("TheJob", job);
		if(job==null){
			return false;
		}else{
			return true;
		}
	}
	
	protected boolean editJobAndSubmit(HttpServletRequest request,JobDao jobdao){
		String id=request.getParameter("job_id");
		if(id==null){
			return false;
		}
		String title=request.getParameter("job_title");
		String content=request.getParameter("content");
		String date=request.getParameter("job_deadline_date");
		return jobdao.EditJob(id, title, content, date);
		
	}

}
