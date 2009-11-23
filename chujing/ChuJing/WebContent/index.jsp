<%@ page language="java"
	import="com.Dao.impl.NewsDao,com.Dao.impl.CaseDao,java.util.List,com.javaBean.News,com.javaBean.Case"
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
	NewsDao newsDao = new NewsDao();
	String newsSQL = "select * from t_news limit 9";
	List newsList = newsDao.getListBySQL(newsSQL);
	News news;
	CaseDao caseDao = new CaseDao();
	String caseSQL = "select * from t_case LIMIT 3";
	List caseList = caseDao.getListBySQL(caseSQL);
	Case _case;
%>
<jsp:include page="include/header.jsp" />
<div id="page">
<div id="content">
<div class="post">
<div class="title">公司新闻<a href="#">more</a></div>
<div class="entry">
<div class="flash"><object
	classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
	codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cabversion=6,0,0,0"
	height="198" width="280">
	<param name="movie" value="images/focus.swf">
	<param name="quality" value="high">
	<param name="wmode" value="opaque">
	<param name="FlashVars"
		value="pics=images/new_5.jpg|images/new_2.jpg|images/new_3.jpg|images/new_1.jpg&amp;links=http://bbs.vrplatform.com/thread-4437-1-1.html||http://www.vrplatform.com/zhuanti/2008/|http://bbs.vrplatform.com/thread-4382-1-1.html&amp;texts=标题 1|标题 2|标题 3|标题 4&amp;pic_width=280&amp;pic_height=198&amp;show_text=0&amp;txtcolor=000000&amp;bgcolor=DDDDDD&amp;button_pos=4&amp;stop_time=4000">
	<embed lk_media="yes" lk_mediaid="lk_juiceapp_mediaPopup_1258185402000"
		src="images/focus.swf" wmode="transparent"
		flashvars="pics=images/new_5.jpg|images/new_2.jpg|images/new_3.jpg|images/new_1.jpg&amp;links=http://bbs.vrplatform.com/thread-4437-1-1.html||http://www.vrplatform.com/zhuanti/2008/|http://bbs.vrplatform.com/thread-4382-1-1.html&amp;texts=标题 1|标题 2|标题 3|标题 4&amp;pic_width=280&amp;pic_height=198&amp;show_text=0&amp;txtcolor=000000&amp;bgcolor=DDDDDD&amp;button_pos=4&amp;stop_time=4000"
		quality="high" allowscriptaccess="sameDomain"
		type="application/x-shockwave-flash"
		pluginspage="http://www.macromedia.com/go/getflashplayer" height="198"
		width="280" /> </object></div>
<div class="content">
<table>
	<tr>
		<td align="left">
		<%
			for (int i = 0; i < newsList.size(); i++) {
				news = (News) newsList.get(i);
		%> <a href="newsContent.jsp?newsID=<%=news.getNewsId()%>"
			title="<%=news.getNewsTitle()%>" target="_blank"> ·<span
			style="font-weight: bold;"><%=news.getNewsTitle()%></span></a><br>
		<%
			}
		%>
		</td>
	</tr>
</table>
</div>
</div>
</div>
<div class="post">
<div class="title">案例介绍<a href="#">more</a></div>
					<% 
	        		for(int i=0;i<caseList.size();i++){
	    				_case = (Case)caseList.get(i);
	    				int introLength = _case.getCaseIntroduction().length();
	    				int length = introLength>120 ? 120 : introLength;
					%>
<div class="case">
<div class="case_image"><a href="caseContent.jsp?caseID=<%=_case.getCaseId() %>"><img
	src="images/<%=_case.getCaseScreenshot1() %>" alt="" border="0" height="93" width="138" /></a></div>
<div class="case_content"><span class="case_star"><%for(int j=0;j<_case.getCaseStar();j++) out.print("★"); for(int j=0;j<5-_case.getCaseStar();j++) out.print("☆"); %></span> <span
	class="case_title"><a href="caseContent.jsp?caseID=<%=_case.getCaseId() %>"><%=_case.getCaseTitle() %></a></span> <br />
<span class="case_intro">&nbsp;&nbsp;&nbsp;&nbsp;<%=_case.getCaseIntroduction().substring(0,length) %>..</span>
<br />
<span class="case_author">客户:<%=_case.getCaseCustomer() %>
</span> <span class="case_hits"> 文件大小：</font><%=_case.getCase3DSize() %>MB</span></div>
</div>
					<%
						}
					%>

</div>
</div>
<!-- end #content --> <jsp:include page="include/sidebar.jsp" /></div>
<!-- end #page -->
<jsp:include page="include/footer.jsp" />
</body>
</html>