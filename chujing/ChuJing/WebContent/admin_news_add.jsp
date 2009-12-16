<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_validate.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑新闻</title>
<link href="css/admin_style.css" rel="stylesheet" type="text/css" />
</head>
<script type='text/javascript'>
function onChecked(){
	var fileUpload = document.getElementById("news_img");
	var newsImage = document.getElementById("news_image");
	var form = document.getElementById("add_news");
	var method = document.getElementById("news_method");
	if(fileUpload.checked){
		newsImage.className = "displayYes";
		form.enctype="multipart/form-data";
		method.value = "add_with_image";
	}else{
		newsImage.className = "displayNo";
		form.enctype="text/form";
		method.value = "add";
	}
	
}
</script>
<body>

<form id="add_news" method="post" name="add_news" action="NewsOpeServlet">
<table width="95%" border="1" align="center" bordercolor="#000066"
	cellspacing="0" cellpadding="0">
	<tr>
		<td valign="middle" align="center" bgcolor="#000066"><span
			class="head_title_2">添加新闻</span></td>
	</tr>
	<tr>
		<td class="td_forborder"></td>
	</tr>
	<tr>
		<td>
		<table width="100%" height="100%" cellpadding="0px" cellspacing="0px"
			border="0px">
			<tr>
				<th width="20%" bgcolor="#000066"><span class="head_title_3">新闻标题</span></th>
				<td width="20px"></td>
				<td align="left"><input type="text" class='input_text'
					align="left" name="news_title" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td class="td_forborder"></td>
	</tr>
		<tr>
		<td>
		<table width="100%" height="100%" cellpadding="0px" cellspacing="0px"
			border="0px">
			<tr>
				<th width="30%" bgcolor="#000066"><span class="head_title_3">
				<input type="checkbox" id="news_img" onClick="onChecked()" name="news_img"/>是否上传新闻封面图片</span></th>
				<td width="20px"></td>
				<td align="left">
				<input id="news_image" class="displayNo" type="file" name="news_image" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td class="td_forborder"></td>
	</tr>
	<tr>
		<td bgcolor="#000066" align="center"><span class="head_title_3">新闻内容</span></td>
	</tr>
	<tr>
		<td>
		<table border="0" cellpadding="0" cellspacing="0" width="100%"
			height="500">
			<tr>
				<td>
				<div align="left"><%@ include file="admin_fckeditor.jsp"%>
				<%
					out.println(oFCKeditor.create());
				%>
				</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td class="td_forborder"></td>
	</tr>
	<tr>
		<td>
		<table border="0" cellpadding="0" cellspacing="0" bgcolor="#000066"
			width="100%" height="100%">
			<tr>
				<td align="center"><input type="submit" value="保存" />
				<input id="news_method"
					type="hidden" name="news_method" value="add" /></td>
				<td align="center"><input type="reset" value="重置" /></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>
