<%@ page language="java" import="com.javaBean.Case"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="admin_validate.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改案例</title>
<link href="css/admin_style.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>

<body>
<%
Case _case=(Case)request.getAttribute("TheCase");
String content=_case.getCaseIntroduction();
%>
<form name="case_edit_form" action="CaseOpeServlet" method="post"
	enctype="multipart/form-data">
<table width="95%" border="1" align="center" cellpadding="0"
	cellspacing="0" bordercolor="#000066">
	<tr>
		<td colspan="2">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td class="head_title_2"><span class="menu_font">修改案例</span></td>
			</tr>
			<tr>
				<td class="td_forborder"></td>
			</tr>
			<tr>
				<td>
					<input type="hidden" name="case_method" value="case_edit_submit"/>
    				<input type="hidden" name="case_id" value="<%=_case.getCaseId()%>"/>
				<table width="100%" border="1" cellpadding="0" cellspacing="0"
					bordercolor="#000066">
					<tr>
						<td class="head_title_3" width="150px">客户名称</td>
						<td>
						<table width="100%" border="0">
							<tr>
								<td class="td_v_border">&nbsp;</td>
								<td><input type="text" name="customer" value="<%=_case.getCaseCustomer()%>" class="input_text" /></td>
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
										<option <% if(_case.getCaseStar() == 5 ) out.print("selected='selected'"); %> value="5">五星级</option>
										<option <% if(_case.getCaseStar() == 4 ) out.print("selected='selected'"); %> value="4">四星级</option>
										<option <% if(_case.getCaseStar() == 3 ) out.print("selected='selected'"); %> value="3">三星级</option>
										<option <% if(_case.getCaseStar() == 2 ) out.print("selected='selected'"); %> value="2">二星级</option>
										<option <% if(_case.getCaseStar() == 1 ) out.print("selected='selected'"); %> value="1">一星级</option>
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
				<td>
				<table width="100%" border="1" cellpadding="0" cellspacing="0"
					bordercolor="#000066">
					<tr>
						<td class="head_title_3" width="150px">案例标题</td>
						<td>
						<table width="100%" border="0">
							<tr>
								<td class="td_v_border">&nbsp;</td>
								<td><input type="text" name="case_title" class="input_text" value="<%=_case.getCaseTitle()%>" /></td>
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
				<td class="head_title_3">案例简介</td>
			</tr>
			<tr>
				<td height="400px">
				<div align="left"><%@ include file="admin_fckeditor.jsp"%>
				<%
					oFCKeditor.setValue(content);
					out.println(oFCKeditor.create());
				%>
				</div>
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
				<td class="head_title_3">上传资源(请将修改后的资源文件全部一起上传！)</td>
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
								<td width="150px">
									<input type="file" name="3d_file" />
								</td>
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
		<td class="td_forbottom_bg_blue"><input type="submit" value="提交" /></td>
		<td class="td_forbottom_bg_blue"><input type="reset" value="重置" /></td>
	</tr>
</table>
</form>
</body>
</html>
