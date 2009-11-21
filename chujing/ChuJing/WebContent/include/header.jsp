<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="logo">
	<h1><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h1>
</div>
<div id="menu">
	<ul>
		<li id="index"><a href="index.jsp">首页</a></li>
		<li id="news"><a href="news.jsp">新闻公告</a></li>
		<li id="case"><a href="case.jsp">案例介绍</a></li>
		<li id="job"><a href="job.jsp">人才招聘</a></li>
		<li id="about"><a href="about.jsp">联系我们</a></li>
	</ul>
</div>
<div id="splash">
	<img src="images/img05.jpg" alt="" />
</div>
<hr />
    <script> 
var strUrl=window.location.href;
var arrUrl=strUrl.split("/");
var strPage=arrUrl[arrUrl.length-1];
var arrPage = strPage.split(".");
var flag = arrPage[0];
if(flag == "caseContent")
	flag = "case";
if(flag == "jobContent")
	flag = "job";
if(flag == "newsContent")
	flag = "news";
document.getElementById(flag).className = "current_page_item";
</script>