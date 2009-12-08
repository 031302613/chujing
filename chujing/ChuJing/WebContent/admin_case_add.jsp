<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_validate.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加案例</title>
<link href="css/admin_style.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body>
<form name="case_add_form" action="CaseOpeServlet" method="post" ENCTYPE="multipart/form-data">
<table width="95%" border="1" align="center" cellpadding="0"
	cellspacing="0" bordercolor="#000066">
	<tr>
		<td colspan="2">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td class="head_title_2" colspan="4"><span class="menu_font">案例增加</span></td>
			</tr>
			<tr>
				<td class="td_forborder"></td>
			</tr>
			<tr>
				<td>
				<table width="100%" border="1" cellpadding="0" cellspacing="0"
					bordercolor="#000066">
					<tr>
						<td class="head_title_3" width="150px">客户名称</td>
						<td>
						<table width="100%" border="0">
							<tr>
								<td class="td_v_border">&nbsp;</td>
								<td><input type="text" name="customer" class="input_text" /></td>
							</tr>
						</table>
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
				<table width="100%" border="1" cellpadding="0" cellspacing="0"
					bordercolor="#000066">
					<tr>
						<td class="head_title_3" width="150px">案例星级</td>
						<td>
						<table width="100%" border="0">
							<tr>
								<td class="td_v_border">&nbsp;</td>
								<td>
									<select name="star">
										<option value="5">五星级</option>
										<option value="4">四星级</option>
										<option value="3">三星级</option>
										<option value="2">二星级</option>
										<option value="1">一星级</option>
									</select>
								</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td class="td_forborder"></td>
			</tr>
			<tr>
				<td class="td_forborder"></td>
			</tr>
			<tr>
				<td>
				<table width="100%" border="1" cellpadding="0" cellspacing="0"
					bordercolor="#000066">
					<tr>
						<td class="head_title_3" width="150px">案例标题</td>
						<td>
						<table width="100%" border="0">
							<tr>
								<td class="td_v_border">&nbsp;</td>
								<td><input type="text" name="case_title" class="input_text" /></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td class="td_forborder"></td>
			</tr>
			<tr>
				<td class="head_title_3" colspan="4">案例简介</td>
			</tr>
			<tr>
				<td colspan="4">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" height="500">
					<tr>
						<td>
							<div align="left">
								<%@ include file="admin_fckeditor.jsp"%>
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
		</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<table width="100%" border="0" cellpadding="0px" cellspacing="0px">
			<tr>
				<td class="head_title_3">上传资源</td>
			</tr>
			<tr>
				<td class="td_forborder"></td>
			</tr>
			<tr>
				<td>
				<table cellpadding="0" cellspacing="0" width="100%" border="1"
					bordercolor="#000066">
					<tr>
						<td width="50%">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="100px" class="head_title_3">3D文件</td>
								<td class="td_v_border"></td>
								<td width="150px"><input type="file" name="3d_file" /></td>
							</tr>
						</table>
						</td>
						<td width="50%">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="100px" class="head_title_3">RAR文件</td>
								<td class="td_v_border"></td>
								<td width="150px"><input type="file" name="rar_file" /></td>
							</tr>
						</table>
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
				<table cellpadding="0" cellspacing="0" width="100%" border="1"
					bordercolor="#000066">
					<tr>
						<td width="50%">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="100px" class="head_title_3">案例图片一</td>
								<td class="td_v_border"></td>
								<td width="150px"><input type="file" name="image_1" /></td>
							</tr>
						</table>
						</td>
						<td width="50%">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="100px" class="head_title_3">案例图片二</td>
								<td class="td_v_border"></td>
								<td width="150px"><input type="file" name="image_2" /></td>
							</tr>
						</table>
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
				<table cellpadding="0" cellspacing="0" width="100%" border="1"
					bordercolor="#000066">
					<tr>
						<td width="50%">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="100px" class="head_title_3">案例图片三</td>
								<td class="td_v_border"></td>
								<td width="150px"><input type="file" name="image_3" /></td>
							</tr>
						</table>
						</td>
						<td width="50%">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="100px" class="head_title_3">案例图片四</td>
								<td class="td_v_border"></td>
								<td width="150px"><input type="file" name="image_4" /></td>
							</tr>
						</table>
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
				<table cellpadding="0" cellspacing="0" width="100%" border="1"
					bordercolor="#000066">
					<tr>
						<td width="50%">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="100px" class="head_title_3">案例图片五</td>
								<td class="td_v_border"></td>
								<td width="150px"><input type="file" name="image_5" /></td>
							</tr>
						</table>
						</td>
						<td width="50%">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="100%" class="head_title_3"><span
									class="note_font_red">由于资源上传量大，可能上传时间较长！</span></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td class="td_forborder"></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td class="td_forbottom_bg_blue"><input type="submit" value="提交" />
		<input type="hidden" name="case_method" value="add" /></td>
		<td class="td_forbottom_bg_blue"><input type="reset" value="重置" /></td>
	</tr>
</table>
</form>
</body>
</html>
