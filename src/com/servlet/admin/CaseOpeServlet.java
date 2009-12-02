package com.servlet.admin;

import java.io.IOException;
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		try {
			if (upload(request, response)) {
				request.getRequestDispatcher("admin_case_list.jsp").forward(
						request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		} catch (SmartUploadException e) {
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		}

	}

	protected boolean AddCase(Request request, CaseDao CaseDao) {

		String title = request.getParameter("case_title");
		String content = request.getParameter("content");
		String customer = request.getParameter("customer");
		int star = Integer.parseInt(request.getParameter("star"));
		
		if (title == null || content == null || title.length() == 0
				|| content.length() == 0) {
			System.out.println("fail:" + content + " title:" + title);
			return false;
		}
		return CaseDao.AddCase(title, content, customer,star,filenames,RARSize,Unity3DSize);
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
			com.jspsmart.upload.File file = su.getFiles().getFile(i);
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
			if(file.getFileExt().equals("rar")){
				RARSize = file.getSize()/1048576;
			}
			if(file.getFileExt().equals("unity3d")){
				Unity3DSize = file.getSize()/1048576;
			}
			filenames.add(filename);
		}
		Request requestSU = su.getRequest();
		String type = requestSU.getParameter("case_method").toString();
		if (type.equals("add")) {
			CaseDao caseDao = new CaseDao();
			AddCase(requestSU, caseDao);
		}
		return true;
	}

}
