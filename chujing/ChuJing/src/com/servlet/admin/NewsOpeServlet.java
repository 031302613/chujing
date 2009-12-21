package com.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javaBean.*;
import com.jspsmart.upload.SmartRequest;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.Dao.impl.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

/**
 * Servlet implementation class NewsOpeServlet
 */
public class NewsOpeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletConfig config;
	private String filename;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewsOpeServlet() {
		super();
	}
	final public void init(ServletConfig config) throws ServletException {
		this.config = config;
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		NewsDao newsdao = new NewsDao();
		PrintWriter out = response.getWriter();
		String type = request.getParameter("news_method");
		if (type == null || type.equals("add_with_image")
				|| type.equals("edit_with_image")) {
			try {
				if (upload(request, response)) {
					request.getRequestDispatcher(
							"NewsOpeServlet?news_method=query_all").forward(
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
			type = type.toString();
			if (type.equals("add")) {
				if (this.AddNews(request, newsdao)) {
					request.getRequestDispatcher(
							"NewsOpeServlet?news_method=query_all").forward(
							request, response);
				}
			}

			if (type.equals("query_all")) {
				if (this.QueryNews(request, newsdao)) {
					request.getRequestDispatcher("admin_new_list.jsp").forward(
							request, response);
				}
			}

			if (type.equals("query_cond")) {
				if (this.QueryNewsByCond(request, newsdao)) {
					request.getRequestDispatcher("admin_new_list.jsp").forward(
							request, response);
				}
			}

			if (type.equals("news_delete")) {
				if (this.deleteNews(request, newsdao)) {
					out
							.println("<script language='javascript'>alert('操作成功');"
									+ "window.location.href='NewsOpeServlet?news_method=query_all';</script>");
				}
			}

			if (type.equals("news_edit")) {
				if (this.editNews(request, newsdao)) {
					request.getRequestDispatcher("admin_news_edit.jsp")
							.forward(request, response);
				}
			}

			if (type.equals("news_edit_submit")) {
				if (this.editNewsAndSubmit(request, newsdao)) {
					out
							.println("<script language='javascript'>alert('操作成功');"
									+ "window.location.href='NewsOpeServlet?news_method=query_all';</script>");
				}
			}
		}
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
		su.setMaxFileSize(100000);
		// 总共上传文件限制
		su.setTotalMaxFileSize(500000);
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
			this.filename = filename;
		}
		SmartRequest requestSU = su.getRequest();
		String type = requestSU.getParameter("news_method").toString();
		NewsDao newsDao = new NewsDao();
		if (type.equals("add_with_image")) {
			AddNewsWithImage(requestSU, newsDao);
		}
		if (type.equals("edit_with_image")) {
			editNewsAndSubmitWithImage(requestSU, newsDao);
		}/**/
		return true;
	}

	protected boolean AddNewsWithImage(SmartRequest request, NewsDao newsDao) {
		String title = request.getParameter("news_title");
		String content = request.getParameter("content");
		if (title == null || content == null || title.length() == 0
				|| content.length() == 0) {
			return false;
		}
		return newsDao.AddNewsWithImage(title, content, this.filename);
	}

	protected boolean editNewsAndSubmitWithImage(SmartRequest request,
			NewsDao newsDao) {

		String id = request.getParameter("news_id");
		if (id == null) {
			return false;
		}
		String title = request.getParameter("news_title");
		String content = request.getParameter("content");

		return newsDao.editNewsAndSubmitWithImage(id, title, content,
				this.filename);
	}

	protected boolean AddNews(HttpServletRequest request, NewsDao newsdao) {
		String title = request.getParameter("news_title");
		String content = request.getParameter("content");
		if (title == null || content == null || title.length() == 0
				|| content.length() == 0) {
			return false;
		}
		return newsdao.AddNews(title, content);
	}

	protected boolean QueryNews(HttpServletRequest request, NewsDao newsdao) {
		List<News> newslist = newsdao.getListByPage(request
				.getParameter("page"), 12);
		if (newslist == null) {
			return false;
		} else {
			request.setAttribute("NEWSLIST", newslist);
			request.setAttribute("NEWS_METHOD", "query_all");
			return true;
		}
	}

	protected boolean QueryNewsByCond(HttpServletRequest request,
			NewsDao newsdao) {
		String query_cond_value = request.getParameter("query_cond_value");
		if (query_cond_value == null || query_cond_value.length() == 0) {
			return false;
		}
		String query_cond = request.getParameter("query_cond_text");
		String cond = "";
		if (query_cond == null || query_cond.length() == 0) {
			cond = "";
		}
		if (query_cond_value.equals("NEWS_ID")) {
			cond = "AND NEWS_ID=\'" + query_cond + "\'";
		}

		if (query_cond_value.equals("NEWS_TITLE_LIKE")) {
			cond = "AND NEWS_TITLE like \'%" + query_cond + "%\'";
		}

		if (query_cond_value.equals("NEWS_PUBLISH_TIME_MORE")) {
			cond = "AND NEWS_PUBLISH_TIME > date(\'" + query_cond + "\')";
		}
		if (query_cond_value.equals("NEWS_PUBLISH_TIME_EQUAL")) {
			cond = "AND NEWS_PUBLISH_TIME = date(\'" + query_cond + "\')";
		}

		if (query_cond_value.equals("NEWS_PUBLISH_TIME_LESS")) {
			cond = "AND NEWS_PUBLISH_TIME <date( \'" + query_cond + "\')";
		}

		List<News> newslist = newsdao.getListByPageAndCond(cond, request
				.getParameter("page"), 12);
		if (newslist == null) {
			return false;
		} else {
			request.setAttribute("NEWSLIST", newslist);
			request.setAttribute("QUERY_COND_VALUE", query_cond_value);
			request.setAttribute("QUERY_COND_TEXT_APP", query_cond);
			request.setAttribute("NEWS_METHOD", "query_cond");
			return true;
		}

	}

	protected boolean deleteNews(HttpServletRequest request, NewsDao newsdao) {
		String id = request.getParameter("news_id").toString();
		return newsdao.DeleteNews(id);
	}

	protected boolean editNews(HttpServletRequest request, NewsDao newsdao) {
		String id = request.getParameter("news_id").toString();
		News news = newsdao.getByID(id);
		request.setAttribute("TheNews", news);
		if (news == null) {
			return false;
		} else {
			return true;
		}
	}

	protected boolean editNewsAndSubmit(HttpServletRequest request,
			NewsDao newsdao) {
		String id = request.getParameter("news_id");
		if (id == null) {
			return false;
		}
		String title = request.getParameter("news_title");
		String content = request.getParameter("content");

		return newsdao.EditNews(id, title, content);

	}
}
