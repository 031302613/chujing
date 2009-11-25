<%@ page language="java" import="com.Dao.impl.JobDao,com.javaBean.Job,java.util.List,com.util.Pagination" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>触景科技 ---您的最佳选择</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/pagination.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>
<body>
<% 
	JobDao dao = new JobDao();
	String currentPage = request.getParameter("page");
	int pageSize = 3;
	List list = dao.getListByPage(currentPage, pageSize);
	//String sql = "select * from t_job limit 4";
	//List list = dao.getListBySQL(sql);
	Job job;
%>
<jsp:include page="include/header.jsp" />
<div id="page">
	<div id="content">
			<% 
			for(int i=0;i<list.size();i++){
				job = (Job)list.get(i);
			%>
			<div class="post">
				<h1 class="title"><%=job.getJobTitle() %> </h1>
				
				<div class="news_entry">
				<%=job.getJobContent() %>
				</div>
				<p class="meta">触景科技  于 2009年11月11日&nbsp;&bull;&nbsp;<a href="jobContent.jsp?jobID=<%=job.getJobId() %>" class="permalink">详细信息</a></p>
			</div>
			<%
				}
			%>
	<div class="pagination"><%=Pagination.getURL("job.jsp") %></div>
	</div>
	<!-- end #content -->
<jsp:include page="include/sidebar.jsp" /> 
</div>
<!-- end #page -->
<jsp:include page="include/footer.jsp" /> 
</body>
</html>