<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_validate.jsp"  %>
    <%@ page import="com.Dao.impl.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.javaBean.*" %>
    <%@ page import="com.util.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>招聘信息列表</title>
<link href="css/admin_style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/pagination.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>
<script type="text/javascript">
function link_job_add(){
window.location="admin_job_add.jsp";
}
</script>
<body>
<%
List<Job> jobslist=(List<Job>)request.getAttribute("JOBLIST");
if(jobslist==null){
	System.out.println("is null !");
}
%>
<form name="job_list_form" method="post" action="JobsOpeServlet">
<table border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000066" width="95%">
  <tr>
    <td width="20%" class="to_ope_cell"><input type="button" onClick="link_job_add()" value="添加招聘"/></td>
    <td><table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
      <tr>
        <td class="head_title_3" width="80px"><span class="menu_font_small">查询条件</span></td>
        <td class="td_center" width="120px">
		<select name="query_cond_value">
		<option value="JOB_ID_EQUAL">招聘ID等于</option>
		<option value="JOB_TITLE_LIKE">招聘标题中有</option>
		<option value="JOB_PUBLISH_TIME_MORE">创建日期大于</option>
		<option value="JOB_PUBLISH_TIME_EQUAL">创建日期等于</option>
		<option value="JOB_PUBLISH_TIME_LESS">创建日期小于</option>
		</select>
		</td>
        <td class="head_title_3" width="20px"><span class="menu_font_small">值</span></td>
		<td class="td_v_border"></td>
        <td valign="middle"><input class="input_text_query" type="text" name="query_cond_text"/>
		<span class="note_font_red">日期格式：2009-01-01</span>
		</td>
		<td class="head_title_3" width="50px"><input type="submit" value="查询"/></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2" class="td_forborder">
    <input type="hidden" name="job_method" value="query_cond"/>
    </td>
  </tr>
</table>

<table width="95%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000066">
  <tr>
    <td colspan="2" scope="col" bgcolor="#000066" class="head_title_2">
    <a href="JobsOpeServlet?job_method=query_all">
	<span class="menu_font_big">招聘信息列表</span>
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
        <td class="head_title_3" width="20%"><span class="menu_font_small">招聘ID号</span></td>
        <td class="head_title_3" width="20%"><span class="menu_font_small">招聘标题</span></td>
        <td class="head_title_3" width="20%"><span class="menu_font_small">创建日期</span></td>
        <td class="head_title_3" width="20%"><span class="menu_font_small">截止日期</span></td>
        <td class="head_title_3" width="20%" colspan="2"><span class="menu_font_small">操作</span></td>
        </tr>
        <%
        for(int i=0;i<jobslist.size();i++){ 
        	Job job=jobslist.get(i);
        	%>
		      <tr>
        <td class="td_cell" width="20%"><span class="cell_font"><%=job.getJobId() %></span></td>
        <td class="td_cell"width="20%"><span class="cell_font"><%=job.getJobTitle() %></span></td>
        <td class="td_cell"width="20%"><span class="cell_font"><%=job.getJobPublishTime() %></span></td>
        <td class="td_cell"width="20%"><span class="cell_font"><%=job.getJobAvailableTime() %></span></td>
        <td class="to_ope_cell" width="10%">
        <a href="JobsOpeServlet?job_method=job_edit&job_id=<%=job.getJobId() %>" >
        <span class="menu_font_small">修改</span>
        </a></td>
		<td class="to_ope_cell" width="10%">
		<a href="JobsOpeServlet?job_method=job_delete&job_id=<%=job.getJobId() %>">
		<span class="menu_font_small">删除</span>
		</a></td>
        </tr>
        <%} %>
      <tr>
        <td colspan="6" class="td_forborder"></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2" class="td_forbottom_bg_blue"><%=Pagination.getBackURL("JobsOpeServlet?job_method="+request.getAttribute("JOB_METHOD").toString()+
		  "&query_cond_value="+request.getAttribute("QUERY_COND_VALUE")+"&query_cond_text="+request.getAttribute("QUERY_COND_TEXT_APP")) %></td>
		  <%System.out.println("JobsOpeServlet?job_method="+request.getAttribute("JOB_METHOD").toString()+
				  "&query_cond_value="+request.getAttribute("QUERY_COND_VALUE")+"&query_cond_text="+request.getAttribute("QUERY_COND_TEXT_APP")) ; %>
   <!--
   <td class="td_forbottom_bg_blue"><a href="#"><span class="menu_font_small">上一页</span></a></td>
    <td class="td_forbottom_bg_blue"><a href="#"><span class="menu_font_small">下一页</span></a></td>
     --> 
  </tr>
</table>
</form>
</body>
</html>

