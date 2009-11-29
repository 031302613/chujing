package com.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.impl.CaseDao;
import com.Dao.impl.NewsDao;
/**
 * Servlet implementation class NewsOpeServlet
 */
public class CaseOpeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CaseOpeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		CaseDao caseDao=new CaseDao();
		String type=request.getParameter("case_method").toString();
		if(type.equals("add")){
			if(this.AddCase(request, caseDao)){
				request.getRequestDispatcher("admin_case_list.jsp").forward(request, response);	
			}
		}
	}
	
	protected boolean AddCase(HttpServletRequest request,CaseDao CaseDao){
		String title=request.getParameter("case_title");
		String content=request.getParameter("content");
		String customer=request.getParameter("customer");
		System.out.println("content:"+content+" title:"+title+" customer:"+customer);
		if(title==null||content==null||title.length()==0||content.length()==0){
			System.out.println("fail:"+content+" title:"+title);
			return false;
		}
		return CaseDao.AddCase(title, content,customer);
	}

}
