<%@ page language="java" import="com.javaBean.Job,com.Dao.impl.JobDao"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>触景科技 ---您的最佳选择</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/style.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>
<body>
<%
	JobDao dao = new JobDao();
	String jobID =	(String)request.getParameter("jobID");
	Job job = dao.getByID(jobID);
%>
<jsp:include page="include/header.jsp" />
<div id="page">
<div id="content">
<div class="post">
<h1 class="title"><%=job.getJobTitle()%></h1>

<div class="news_entry"><%=job.getJobContent()%></div>
<p class="meta">触景科技 于
2009年11月11日&nbsp;&bull;&nbsp;</p>
</div>
</div>
<!-- end #content -->
<jsp:include page="include/sidebar.jsp" /> 
</div>
<!-- end #page -->
<jsp:include page="include/footer.jsp" /> 
</body>
</html>