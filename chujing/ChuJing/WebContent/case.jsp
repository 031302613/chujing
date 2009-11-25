<%@ page language="java" import="com.javaBean.Case,com.Dao.impl.CaseDao,java.util.List,com.util.Pagination" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>触景科技 ---您的最佳选择</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/common.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/pagination.css" rel="stylesheet" type="text/css"
	media="screen" />
<script language='javascript' src='js/common.js'></script>
</head>
<body>
<% 
	CaseDao dao = new CaseDao();
	String currentPage = request.getParameter("page");
	int pageSize = 8;
	List list = dao.getListByPage(currentPage, pageSize);
	//String sql = "select * from t_case LIMIT 8";
	//List list = dao.getListBySQL(sql);
	Case _case;
%>
<jsp:include page="include/header.jsp" />
<div id="page">
	<div id="content">
        <div class="post">
        	<div class="title">案例介绍</div> 
	        <div class="case">
	        	<div class="case_list">
	        		<br/>
	        		<% 
	        		for(int i=0;i<list.size();i++){
	    				_case = (Case)list.get(i);
					%>
	        		 <dl>
						<a href="caseContent.jsp?caseID=<%=_case.getCaseId() %>" ><img src="images/<%=_case.getCaseScreenshot1() %>" alt="<%=_case.getCaseTitle() %>" height="93" width="138"></a>
						<dt>
						
						<a href="caseContent.jsp?caseID=<%=_case.getCaseId() %>" title="<%=_case.getCaseTitle() %>"><%=_case.getCaseTitle() %></a>
						<br>
						</dt> 
						<dt><span><font color="999999">客户：</font><%=_case.getCaseCustomer() %></span></dt>
						<dt><span><font color="999999">文件大小：</font><%=_case.getCase3DSize() %>MB</span> </dt>
						<dt><font color="999999">星级：</font><font color="red"><% for(int j=0;j < _case.getCaseStar();j++) out.print("★"); %></font></dt>
					</dl>
					<%
						}
					%>
	        	</div>
	        </div>
		</div>
		<div class="pagination"><%=Pagination.getURL("case.jsp") %></div>
	</div>
	<!-- end #content -->
<jsp:include page="include/sidebar.jsp" /> 
</div>
<!-- end #page -->
<jsp:include page="include/footer.jsp" /> 
</body>
</html>
