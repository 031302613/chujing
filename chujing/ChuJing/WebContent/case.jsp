<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
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
<script language='javascript' src='js/common.js'></script>
</head>
<body>
<% 
	//jsp for get top four news from db
	String DBDIVER = "com.mysql.jdbc.Driver";
	String DBUSER = "root";
	String DBPASSWORD = "123456";
	String DBURL = "jdbc:mysql://localhost:3306/chujing";
	
	Class.forName(DBDIVER);
	Connection conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from t_case LIMIT 8");
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
	        		String caseTitle;
					String caseIntroduction;
					String caseID;
					String caseCustomer;
					String pic1;
					int caseRARSize;
					int case3DSize;
					int caseStar;
					while(rs.next()){
						caseID = rs.getString("CASE_ID");
						caseCustomer = rs.getString("CASE_CUSTOMER");
						caseTitle = rs.getString("CASE_TITLE");
						caseIntroduction = rs.getString("CASE_INTRODUCTION");
						caseRARSize = rs.getInt("CASE_RAR_SIZE");
						case3DSize = rs.getInt("CASE_3D_SIZE");
						caseStar = rs.getInt("CASE_STAR");
						pic1 = rs.getString("CASE_SCREENSHOT1");
			%>
	        		 <dl>
						<a href="caseContent.jsp?caseID=<%=caseID %>" ><img src="images/<%=pic1 %>" alt="<%=caseTitle %>" height="93" width="138"></a>
						<dt>
						
						<a href="caseContent.jsp?caseID=<%=caseID %>" title="<%=caseTitle %>"><%=caseTitle %></a>
						<br>
						</dt> 
						<dt><span><font color="999999">客户：</font><%=caseCustomer %></span></dt>
						<dt><span><font color="999999">文件大小：</font><%=case3DSize %>MB</span> </dt>
						<dt><font color="999999">星级：</font><font color="red"><% for(int i=0;i<caseStar;i++) out.print("★"); %></font></dt>
					</dl>
					<%
				}
			%>
	        	</div>
	        </div>
		</div>
	</div>
	<!-- end #content -->
<jsp:include page="include/sidebar.jsp" /> 
</div>
<!-- end #page -->
<jsp:include page="include/footer.jsp" /> 
<%
	conn.close();
%>
</body>
</html>
