package com.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.impl.UserDao;

/**
 * Servlet implementation class UserOpeServlet
 */
public class UserOpeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserOpeServlet() {
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
		UserDao userdao=new UserDao();
		PrintWriter out= response.getWriter();
		HttpSession session=request.getSession(true);
		String admin = (String)session.getAttribute("USERID");
		if(userdao.EditPwd(admin, request.getParameter("new_pwd").toString())){
			out.println("<script language='javascript'>alert('操作成功');"+"window.location.href='admin_pwd_edit.jsp';</script>");
		}else{
			out.println("<script language='javascript'>alert('操作失敗');"+"window.location.href='admin_pwd_edit.jsp';</script>");
		}
	}

}
