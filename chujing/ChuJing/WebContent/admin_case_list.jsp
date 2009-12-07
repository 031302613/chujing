<%@ page language="java" import="com.javaBean.Case,java.util.List,com.util.Pagination"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--<%@ include file="admin_validate.jsp"%>
--><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>案例列表</title>
<link href="css/admin_style.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="css/pagination.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>
<body>
<%

List<Case> caselist=(List<Case>)request.getAttribute("CASELIST");
if(caselist==null){
	System.out.println("is null !");
}
%>
<form name="query_cond_form" method="post" action="CaseOpeServlet">
<table border="1" align="center" cellpadding="0" cellspacing="0"
	bordercolor="#000066" width="95%">
	<tr>
		<td width="20%" class="to_ope_cell"><input type="button"
			onClick="window.location='admin_case_add.jsp';" value="添加案例" /></td>
		<td>
		<table border="0" cellpadding="0" cellspacing="0" width="100%"
			height="100%">
			<tr>
				<td class="head_title_3" width="80px"><span
					class="menu_font_small">查询条件</span></td>
				<td class="td_center" width="120px">
			    <select name="query_cond_value">
					<option value="CASE_ID">案例ID等于</option>
					<option value="CASE_TITLE_LIKE">案例标题中有</option>
					<option value="CASE_PUBLISH_TIME_MORE">创建日期大于</option>
					<option value="CASE_PUBLISH_TIME_EQUAL">创建日期等于</option>
					<option value="CASE_PUBLISH_TIME_LESS">创建日期小于</option>
					<option value="CASE_CUSTOMER_EQUAL">用户名为</option>
				</select></td>
				<td class="head_title_3" width="20px"><span
					class="menu_font_small">值</span></td>
				<td class="td_v_border"></td>
				<td valign="middle">
					<input class="input_text_query" name="query_cond_text" type="text" />
					<span class="note_font_red">日期格式：2009-01-01</span>
				</td>
				<td class="head_title_3" width="50px">
				<input type="submit" value="查询" />
				<input type="hidden" name="case_method" value="query_cond"/>
				<input type="hidden" name="page" value="1"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="td_forborder"></td>
	</tr>
</table>

<table width="95%" border="1" align="center" cellpadding="0"
	cellspacing="0" bordercolor="#000066">
	<tr>
		<td colspan="2" scope="col" bgcolor="#000066" class="head_title_2">
		<span class="menu_font_big">案例信息列表</span></td>
	</tr>
	<tr>
		<td colspan="2">
		<table border="1" align="center" width="100%" height="100%"
			bordercolor="#000066" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="6" class="td_forborder"></td>
			</tr>
			<tr>
				<td class="head_title_3" width="20%"><span
					class="menu_font_small">案例ID号</span></td>
				<td class="head_title_3" width="20%"><span
					class="menu_font_small">案例标题</span></td>
				<td class="head_title_3" width="20%"><span
					class="menu_font_small">案例用户</span></td>
				<td class="head_title_3" width="20%"><span
					class="menu_font_small">创建日期</span></td>
				<td class="head_title_3" width="20%" colspan="2"><span
					class="menu_font_small">操作</span></td>
			</tr>
			<%for(int i=0;i<caselist.size();i++){ 
        	Case _case=caselist.get(i);
        %>
			<tr>
				<td class="td_cell" width="20%"><span class="cell_font"><%=_case.getCaseId()%></span></td>
				<td class="td_cell" width="20%"><span class="cell_font"><%=_case.getCaseTitle()%></span></td>
				<td class="td_cell" width="20%"><span class="cell_font"><%=_case.getCaseCustomer()%></span></td>
				<td class="td_cell" width="20%"><span class="cell_font"><%=_case.getCasePublishTime()%></span></td>
				<td class="to_ope_cell" width="10%"><a href="CaseOpeServlet?case_method=case_edit&case_id=<%=_case.getCaseId()%>">
					<span class="menu_font_small">修改</span></a></td>
				<td class="to_ope_cell" width="10%"><a href="CaseOpeServlet?case_method=case_delete&case_id=<%=_case.getCaseId()%>">
					<span class="menu_font_small">删除</span></a></td>
			</tr>
			<%} %>
			<tr>
				<td colspan="6" class="td_forborder"></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
	  <td colspan="2" class="td_forbottom_bg_blue"><%=Pagination.getBackURL("CaseOpeServlet?case_method="+request.getAttribute("CASE_METHOD").toString()+
		  "&query_cond_value="+request.getAttribute("QUERY_COND_VALUE")+"&query_cond_text="+request.getAttribute("QUERY_COND_TEXT_APP")) %></td>
		<!--<td class="td_forbottom_bg_blue"><a href="#"><span
			class="menu_font_small">上一页</span></a></td>
		<td class="td_forbottom_bg_blue"><a href="#"><span
			class="menu_font_small">下一页</span></a></td>
	--></tr>
</table>
</form>
</body>
</html>

