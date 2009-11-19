<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
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
	//jsp for get top four news from db
	String DBDIVER = "com.mysql.jdbc.Driver";
	String DBUSER = "root";
	String DBPASSWORD = "123456";
	String DBURL = "jdbc:mysql://localhost:3306/chujing";
	
	Class.forName(DBDIVER);
	Connection conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from t_job LIMIT 4");
%>
<div id="logo">
	<h1><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h1>
</div>
<div id="menu">
	<ul>
		<li><a href="index.jsp">首页</a></li>
		<li><a href="news.jsp">新闻公告</a></li>
		<li><a href="case.jsp">案例介绍</a></li>
		<li class="current_page_item"><a href="job.jsp">人才招聘</a></li>
		<li><a href="about.jsp">联系我们</a></li>
	</ul>
</div>
<div id="splash">
	<img src="images/img05.jpg" alt="" />
</div>
<hr />
<div id="page">
	<div id="content">
			<% 
				String jobTitle;
				String jobContent;
				String jobID;
				while(rs.next()){
					jobID = rs.getString("JOB_ID");
					
					jobTitle = rs.getString("JOB_TITLE");
					jobContent = rs.getString("JOB_CONTENT");
			%>
			<div class="post">
				<h1 class="title"><%=jobTitle %> </h1>
				
				<div class="news_entry">
				<%=jobContent %>
				</div>
				<p class="meta">上传者 <a href="#">HHH</a> 于 2009年11月11日&nbsp;&bull;&nbsp;<a href="jobContent.jsp?jobID=<%=jobID %>" class="permalink">Read more</a></p>
			</div>
			<%
				}
			%>
	</div>
	<!-- end #content -->
	<div id="sidebar">
		<ul>
				<li>
					<h2>最新案例</h2>
					<ul>
						<li>
                        	<div class="sidebar_content">
                                <div class="sidebar_image">
                                    <a href="#" ><img src="images/test1.jpg" alt="" border="0" height="93" width="138" /></a>	
                                </div>
                                <a href="#" class="sidebar_title" >虚拟家居-互动看房</a>
                                <br />
                                <span class="sidebar_author">作者:薛建良 </span>
                            </div>
                        </li>
						<li>
                        	<div class="sidebar_content">
                                <div class="sidebar_image">
                                    <a href="#" ><img src="images/test1.jpg" alt="" border="0" height="93" width="138" /></a>	
                                </div>
                                <a href="#" class="sidebar_title" >虚拟家居-互动看房</a>
                                <br />
                                <span class="sidebar_author">作者:薛建良 </span>
                            </div>
                        </li>
						<li>
                        	<div class="sidebar_content">
                                <div class="sidebar_image">
                                    <a href="#" ><img src="images/test1.jpg" alt="" border="0" height="93" width="138" /></a>	
                                </div>
                                <a href="#" class="sidebar_title" >虚拟家居-互动看房</a>
                                <br />
                                <span class="sidebar_author">作者:薛建良 </span>
                            </div>
                        </li>
						<li>
                        	<div class="sidebar_content">
                                <div class="sidebar_image">
                                    <a href="#" ><img src="images/test1.jpg" alt="" border="0" height="93" width="138" /></a>	
                                </div>
                                <a href="#" class="sidebar_title" >虚拟家居-互动看房</a>
                                <br />
                                <span class="sidebar_author">作者:薛建良 </span>
                            </div>
                        </li>
					</ul>
				</li>
		</ul>
	</div>
	<!-- end #sidebar -->
</div>
<!-- end #page -->
<div id="footer">
	<p id="legal">Copyright (c) 2009 www.chujing.com. All rights reserved. Design by <a href="#">XXX团队</a>.</p>
	<p id="links"><a href="#">Privacy Policy</a> | <a href="#">Terms of Use</a></p>
</div>
<%
	conn.close();
%>
</body>
</html>