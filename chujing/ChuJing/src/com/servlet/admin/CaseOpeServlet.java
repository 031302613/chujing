package com.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.impl.CaseDao;
import com.Dao.impl.NewsDao;
import com.javaBean.Case;
import com.javaBean.News;
import com.jspsmart.upload.*;

/**
 * Servlet implementation class NewsOpeServlet
 */
public class CaseOpeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletConfig config;
	private List<String> filenames;
	private int Unity3DSize;
	private int RARSize;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CaseOpeServlet() {
		super();
	}

	final public void init(ServletConfig config) throws ServletException {
		this.config = config;
		this.filenames = new ArrayList<String>();
	}

	final public ServletConfig getServletConfig() {
		return config;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8");
		//response.setCharacterEncoding("UTF-8");
		//response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String type = request.getParameter("case_method");
		CaseDao casedao = new CaseDao();
		if (type == null || type.equals("add")
				|| type.equals("case_edit_submit")) {
			try {
				if (upload(request, response)) {
					request.getRequestDispatcher(
							"CaseOpeServlet?case_method=query_all").forward(
							request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				request.getRequestDispatcher("error.jsp").forward(request,
						response);
			} catch (SmartUploadException e) {
				e.printStackTrace();
				request.getRequestDispatcher("error.jsp").forward(request,
						response);
			}
		} else {

			if (type.equals("query_all")) {
				if (this.QueryCases(request, casedao)) {
					request.getRequestDispatcher("admin_case_list.jsp")
							.forward(request, response);
				}
			}
			if (type.equals("case_delete")) {
				if (this.deleteCase(request, casedao)) {
					out
							.println("<script type='text/javascript'>alert('操作成功');"
									+ "window.location.href='CaseOpeServlet?case_method=query_all';</script>");
				}
			}
			if (type.equals("query_cond")) {
				if (this.QueryCaseByCond(request, casedao)) {
					request.getRequestDispatcher("admin_case_list.jsp")
							.forward(request, response);
				}
			}
			if (type.equals("case_edit")) {
				if (this.editCase(request, casedao)) {
					request.getRequestDispatcher("admin_case_edit.jsp")
							.forward(request, response);
				}
			}
		}
	}

	protected boolean editCase(HttpServletRequest request, CaseDao casedao) {
		String id = request.getParameter("case_id").toString();
		Case _case = casedao.getByID(id);
		request.setAttribute("TheCase", _case);
		if (_case == null) {
			return false;
		} else {
			return true;
		}
	}

	protected boolean QueryCaseByCond(HttpServletRequest request,
			CaseDao casedao) {
		String query_cond_value = request.getParameter("query_cond_value");
		if (query_cond_value == null || query_cond_value.length() == 0) {
			return false;
		}
		String query_cond = request.getParameter("query_cond_text");
		String cond = "";
		if (query_cond == null || query_cond.length() == 0) {
			cond = "";
		}
		if (query_cond_value.equals("CASE_ID")) {
			cond = "AND CASE_ID=\'" + query_cond + "\'";
		}

		if (query_cond_value.equals("CASE_TITLE_LIKE")) {
			cond = "AND CASE_TITLE like \'%" + query_cond + "%\'";
		}

		if (query_cond_value.equals("CASE_PUBLISH_TIME_MORE")) {
			cond = "AND CASE_PUBLISH_TIME > date(\'" + query_cond + "\')";
		}
		if (query_cond_value.equals("CASE_PUBLISH_TIME_EQUAL")) {
			cond = "AND CASE_PUBLISH_TIME = date(\'" + query_cond + "\')";
		}

		if (query_cond_value.equals("CASE_PUBLISH_TIME_LESS")) {
			cond = "AND CASE_PUBLISH_TIME <date( \'" + query_cond + "\')";
		}

		if (query_cond_value.equals("CASE_CUSTOMER_EQUAL")) {
			cond = "AND CASE_CUSTOMER =( \'" + query_cond + "\')";
		}

		List<Case> caselist = casedao.getListByPageAndCond(cond, request
				.getParameter("page"), 12);
		if (caselist == null) {
			return false;
		} else {
			request.setAttribute("CASELIST", caselist);
			request.setAttribute("QUERY_COND_VALUE", query_cond_value);
			request.setAttribute("QUERY_COND_TEXT_APP", query_cond);
			request.setAttribute("CASE_METHOD", "query_cond");
			return true;
		}

	}

	protected boolean deleteCase(HttpServletRequest request, CaseDao casedao) {
		String id = request.getParameter("case_id").toString();
		return casedao.DeleteCase(id);
	}

	protected boolean QueryCases(HttpServletRequest request, CaseDao casedao) {
		List<Case> caselist = casedao.getListByPage(request
				.getParameter("page"), 12);
		if (caselist == null) {
			return false;
		} else {
			request.setAttribute("CASELIST", caselist);
			request.setAttribute("CASE_METHOD", "query_all");
			return true;
		}
	}

	protected boolean AddCase(SmartRequest request, CaseDao CaseDao) {

		String title = request.getParameter("case_title");
		String content = request.getParameter("content");
		String customer = request.getParameter("customer");
		int star = Integer.parseInt(request.getParameter("star"));

		if (title == null || content == null || title.length() == 0
				|| content.length() == 0) {
			return false;
		}
		return CaseDao.AddCase(title, content, customer, star, filenames,
				RARSize, Unity3DSize);
	}

	protected boolean upload(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			SQLException, SmartUploadException {
		SmartUpload su = new SmartUpload();
		// 初始化上传
		su.initialize(config, request, response);
		// 定义允许上传文件类型
		su.setAllowedFilesList("unity3d,gif,jpg,jpeg,rar,zip");
		// 不允许上传文件类型
		su.setDeniedFilesList("jsp,asp,php,aspx,html.htm");
		// 单个文件最大限制
		su.setMaxFileSize(10000000);
		// 总共上传文件限制
		su.setTotalMaxFileSize(50000000);
		// 开始上传,如果超过限制或者为不允许类型，抛出异常提示
		su.setContentDisposition(null);
		su.upload();

		Random rd = new Random();
		Calendar time = Calendar.getInstance();
	
		// 得到单个上传文件的信息
		for (int i = 0; i < su.getFiles().getCount(); i++) {
			com.jspsmart.upload.SmartFile file = su.getFiles().getFile(i);
			if (file.isMissing())
				continue;
			// 定义上传后另存为的文件名
			
			String filename = String.valueOf(time.get(Calendar.YEAR))
					+ String.valueOf(time.get(Calendar.MONTH))
					+ String.valueOf(time.get(Calendar.DAY_OF_MONTH))
					+ String.valueOf(time.get(Calendar.HOUR_OF_DAY))
					+ String.valueOf(time.get(Calendar.MINUTE))
					+ String.valueOf(time.get(Calendar.SECOND))
					+ String.valueOf(rd.nextInt(100)) + "." + file.getFileExt();
			// 文件另存为
			file.saveAs("/resource/" + filename);
			if (file.getFileExt().equals("rar")) {
				RARSize = file.getSize() / 1048576;
			}
			if (file.getFileExt().equals("unity3d")) {
				Unity3DSize = file.getSize() / 1048576;
			}
			filenames.add(filename);
		}
		SmartRequest requestSU = su.getRequest();
		String type = requestSU.getParameter("case_method").toString();
		CaseDao caseDao = new CaseDao();
		if (type.equals("add")) {
			AddCase(requestSU, caseDao);
		}
		if (type.equals("case_edit_submit")) {
			editCaseAndSubmit(requestSU, caseDao);
		}
		return true;
	}

	protected boolean editCaseAndSubmit(SmartRequest request, CaseDao caseDao) {
		String id = request.getParameter("case_id");
		if (id == null) {
			return false;
		}
		String title = request.getParameter("case_title");
		String content = request.getParameter("content");
		String customer = request.getParameter("customer");
		int star = Integer.parseInt(request.getParameter("star"));

		return caseDao.EditCase(id, title, content, customer, star, filenames,
				RARSize, Unity3DSize);

	}
}
