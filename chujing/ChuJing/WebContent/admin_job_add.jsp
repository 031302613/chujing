<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date"%>
<%@ include file="admin_validate.jsp"  %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加招聘信息</title>
<link href="css/admin_style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
<form name="job_add_form" action="JobsOpeServlet" method="post">
<table width="95%" border="1" align="center" bordercolor="#000066" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="middle" align="center" bgcolor="#000066"><span class="head_title_2">添加招聘信息</span></td>
  </tr>
  <tr>
    <td class="td_forborder"></td>
  </tr>
  <tr>
    <td><table width="100%" height="100%" cellpadding="0px" cellspacing="0px" border="0px"><tr>
      <th width="20%" bgcolor="#000066"><span class="head_title_3">招聘标题</span></th><td width="20px"></td>
      <td align="left">
      <input type="text" class='input_text' align="left" name="job_title" />
      </td></tr></table></td>
  </tr>
    <tr>
    <td class="td_forborder"></td>
  </tr>
    <tr>
    <td><table width="100%" height="100%" cellpadding="0px" cellspacing="0px" border="0px"><tr>
      <th width="20%" bgcolor="#000066"><span class="head_title_3">发布日期</span></th><td width="20px"></td>
      <td align="left">
      <%Date myDate = new Date();
      int thisYear = myDate.getYear() + 1900;//thisYear = 2003
      int thisMonth = myDate.getMonth() + 1;//thisMonth = 5
      int thisDate = myDate.getDate();//thisDate = 30
      String datetime_str=thisYear+"-"+thisMonth+"-"+thisDate;%>
      <%=datetime_str %>
      </td></tr></table></td>
  </tr>
    <tr>
    <td class="td_forborder">
    <input type="hidden" name="job_method" value="job_add"/> 
    </td>
  </tr>
      <tr>
    <td>
	<table width="100%" height="100%" cellpadding="0px" cellspacing="0px" border="0px"><tr>
      <th width="20%" bgcolor="#000066"><span class="head_title_3">截止日期</span></th>
	  <td width="20px"></td>
	  <td><input type="text" class="input_text" name="job_deadline_date" onclick="WdatePicker()"/></td>
      </tr></table></td>
  </tr>
    <tr>
    <td class="td_forborder"></td>
  </tr>
   <tr>
    <td bgcolor="#000066" align="center"><span class="head_title_3">招聘简介</span></td>
  </tr>
  <tr>
    <td><table border="0" cellpadding="0" cellspacing="0" width="100%" height="500">
  <tr>
    <td>
	<div align="left"><%@ include file="admin_fckeditor.jsp"%>
	<%
	out.println(oFCKeditor.create());
	%>
	</div>
</td>
  </tr></table>
</td>
  </tr>
    <tr>
    <td class="td_forborder"></td>
  </tr>
    <tr>
    <td><table border="0" cellpadding="0" cellspacing="0" bgcolor="#000066" width="100%" height="100%">
  <tr>
    <td align="center"><input type="submit" value="保存" /></td>
    <td align="center"><input type="reset" value="重置" /></td>
  </tr>
</table>
</td>
  </tr>
</table>
</form>
</body>
</html>

