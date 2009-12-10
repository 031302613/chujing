<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.Dao.impl.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.javaBean.*" %>
    <%@ page import="com.util.*" %>
<%@ include file="admin_validate.jsp"  %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻列表</title>
<link href="css/admin_style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/pagination.css" rel="stylesheet" type="text/css"
	media="screen" />
<script type="text/javascript">
function link_news_add(){
window.location="admin_news_add.jsp";
}
</script>
</head>

<body>
<%

List<News> newslist=(List<News>)request.getAttribute("NEWSLIST");

%>
<form name="query_cond_form" method="post" action="NewsOpeServlet">
<table border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000066" width="95%">
  <tr>
    <td width="20%" class="to_ope_cell"><input type="button"  value="新增新闻" onClick="link_news_add()"/></td>
    <td><table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
      <tr>
        <td class="head_title_3" width="80px"><span class="menu_font_small">添加新闻</span></td>
        <td class="td_center" width="120px">
        <select name="query_cond_value">
		<option value="NEWS_ID">新闻id等于</option>
		<option value="NEWS_TITLE_LIKE">新闻标题中字段有</option>
		<option value="NEWS_PUBLISH_TIME_MORE">创建时间大于</option>
		<option value="NEWS_PUBLISH_TIME_EQUAL">创建时间等于</option>
		<option value="NEWS_PUBLISH_TIME_LESS">创建时间小于</option>
		</select>
		</td>
        <td class="head_title_3" width="20px"><span class="menu_font_small">值</span></td>
		<td class="td_v_border"></td>
        <td valign="middle"><input class="input_text_query" type="text" name="query_cond_text"/>
		<span class="note_font_red">日期格式：2009-01-01</span>
		</td>
		<td class="head_title_3" width="50px">
		<input type="submit" value="查询"/>
		<input type="hidden" name="news_method" value="query_cond"/>
		<input type="hidden" name="page" value="1"/>
		</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2" class="td_forborder"></td>
  </tr>
</table>

<table width="95%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000066">
  <tr>
    <td colspan="2" scope="col" bgcolor="#000066" class="head_title_2">
    <a href="NewsOpeServlet?news_method=query_all">
	<span class="menu_font_big">新闻信息列表</span>
	</a>
	</td>
  </tr>
  <tr>
    <td colspan="2">
	<table border="1" align="center" width="100%" height="100%" bordercolor="#000066" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="6" class="td_forborder"></td>
        </tr>
      <tr>
        <td class="head_title_3" width="20%"><span class="menu_font_small">新闻ID</span></td>
        <td class="head_title_3" width="20%"><span class="menu_font_small">新闻标题</span></td>
        <td class="head_title_3" width="20%"><span class="menu_font_small">创建时间</span></td>
        <td class="head_title_3" width="20%"><span class="menu_font_small">修改时间</span></td>
        <td class="head_title_3" width="20%" colspan="2"><span class="menu_font_small">操作</span></td>
        </tr>
        <%for(int i=0;i<newslist.size();i++){ 
        	News news=newslist.get(i);
        %>
		<tr>
        <td class="td_cell" width="20%"><span class="cell_font"><%=news.getNewsId()%></span></td>
        <td class="td_cell"width="20%"><span class="cell_font"><%=news.getNewsTitle()%></span></td>
        <td class="td_cell"width="20%"><span class="cell_font"><%=news.getNewsPublishTime()%></span></td>
        <td class="td_cell"width="20%"><span class="cell_font"><%=news.getNewsModifiedTime()%></span></td>
        <td class="to_ope_cell" width="10%">
        <a href="NewsOpeServlet?news_method=news_delete&news_id=<%=news.getNewsId()%>">
        <span class="menu_font_small">删除</span>
        </a></td>
		<td class="to_ope_cell" width="10%">
		<a href="NewsOpeServlet?news_method=news_edit&news_id=<%=news.getNewsId()%>">
		<span class="menu_font_small">修改</span>
		</a></td>
        </tr>
        <%} %>
      <tr>
        <td colspan="6" class="td_forborder"></td>
        </tr>
    </table></td>
  </tr>
  <tr>
  <td colspan="2" class="td_forbottom_bg_blue"><%=Pagination.getBackURL("NewsOpeServlet?news_method="+request.getAttribute("NEWS_METHOD").toString()+
		  "&query_cond_value="+request.getAttribute("QUERY_COND_VALUE")+"&query_cond_text="+request.getAttribute("QUERY_COND_TEXT_APP")) %></td>
  <!--
    <td class="td_forbottom_bg_blue"><a href="#"><span class="menu_font_small">上一页</span></a></td>
    <td class="td_forbottom_bg_blue"><a href="#"><span class="menu_font_small">下一页</span></a></td>
	-->
  </tr>
</table>
</form>
</body>
</html>
