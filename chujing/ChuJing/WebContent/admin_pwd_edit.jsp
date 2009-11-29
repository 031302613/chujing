<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_validate.jsp"  %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>触景科技网站维护后台入口</title>
<link href="css/admin_style.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
td{
height:28px;
margin:auto;
position:static;
}
table{
background-color:#000066;
}



</style>
</head>
<body>
<div align="center" id="center">
<form>
  <table width="300" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center" valign="middle"><span style="font-size:18px; color:#ffffff; font-weight:bold">修改密码</span></td>
    </tr>
    <tr>
      <td><table width="300" border="0">
        <tr>
          <td width="66" align="center" valign="middle" ><span style="font-size:14px; color:#ffffff; font-weight:bold">新密码</span></td>
          <td width="224"><input type="password" maxlength="20" /></td>
        </tr>
        <tr>
          <td align="center" valign="middle" width="66"><span style="font-size:14px; color:#ffffff; font-weight:bold">重输密码</span></td>
          <td><input type="password" maxlength="20" /></td>
        </tr>
      </table>
	  </td>
    </tr>
    <tr>
      <td><table width="300" border="0">
  <tr>
    <td align="center" valign="middle"><input type="submit" value="确定" /></td>
    <td align="center" valign="middle"><input type="reset" value="重置" /></td>
  </tr>
</table>
</td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>
