package com.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Dao.impl.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String UserId=request.getParameter("UserId").toString();
		String PassWord=request.getParameter("PassWord").toString();
		HttpSession session=request.getSession(true);
		PrintWriter out= response.getWriter();
		UserDao user=new UserDao();
		if(user.isExistsUser(UserId)){
			if(user.isPassWordValite(UserId, PassWord)){
				session.setAttribute("USERID", UserId);
				request.getRequestDispatcher("admin_main.jsp").forward(request, response);
			}else{
				out.println("<script language='javascript'>alert('密码错误!');"+"window.location.href='admin_login.jsp';</script>");
			}
		}else{
			out.println("<script language='javascript'>alert('不存在该用户!');"+"window.location.href='admin_login.jsp';</script>");
		}
		
	}

}
