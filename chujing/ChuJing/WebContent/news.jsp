<%@ page language="java" import="com.Dao.impl.NewsDao,java.util.List,com.javaBean.News" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>触景科技 ---您的最佳选择</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<% 
	NewsDao dao = new NewsDao();
	String sql = "select * from t_news limit 4";
	List list = dao.getListBySQL(sql);
	News news;
%>
<jsp:include page="include/header.jsp" />
<div id="page">
	<div id="content">
	
			<% 
			for(int i=0;i<list.size();i++){
				news = (News)list.get(i);
			%>
			<div class="post">
				<a href="newsContent.jsp?newsID=<%=news.getNewsId() %>"><h1 class="title"><%=news.getNewsTitle() %>"</h1></a>
				
				<div class="news_entry">
				<%= news.getNewsContent()%>
				</div>
				<p class="meta"><span>触景科技</span> 发布于  <%=news.getNewsPublishTime() %>&nbsp;&bull;&nbsp; <a href="newsContent.jsp?newsID=<%=news.getNewsId() %>" class="permalink">详细信息</a></p>
			</div>
			<%
				}
			%>
	</div>
	<!-- end #content -->
<jsp:include page="include/sidebar.jsp" /> 
</div>
<!-- end #page -->
<jsp:include page="include/footer.jsp" /> 
</body>
</html>
