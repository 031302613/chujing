<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_validate.jsp"  %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>触景科技网站后台</title>
<link href="css/admin_style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">

table{
background-color:#000066;
}
td{
vertical-align:middle;
text-align:center;
width:12.5%;
}
</style>

</head>

<body>

<table width="800" border="0" align="center">
  <tr>
    <td height="100px">
      <table border="1" width="100%" height="100%" bordercolor="#FFFFFF" cellspacing="0px">
        <tr>
          <td height="70px" colspan="8" background="images/admin_header.gif">&nbsp;</td>
        </tr>
        <tr>
          <td><span class="menu_font">案例介绍模块</span></td>
          <td><span class="menu_font">人才招聘模块</span></td>
          <td><span class="menu_font">公司简介编辑</span></td>
          <td><span class="menu_font">新闻公告模块</span></td>
          <td><span class="menu_font">维护人员模块</span></td>
          <td><span class="menu_font">维护人员登出</span></td>
          <td><span class="menu_font">&nbsp;</span></td>
          <td><span class="menu_font">&nbsp;</span></td>
        </tr>
      </table>
      </td>
  </tr>
  <tr>
    <td valign="top"><iframe align="middle" width="100%" height="700px" name="maintd" hspace="0px"
	 vspace="0px" marginheight="0px" marginwidth="0px" src="admin_new_list.jsp"></iframe></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
</table>
</body>
</html>
