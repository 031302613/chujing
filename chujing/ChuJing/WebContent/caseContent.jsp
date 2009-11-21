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
	String DBDIVER = "com.mysql.jdbc.Driver";
	String DBUSER = "root";
	String DBPASSWORD = "123456";
	String DBURL = "jdbc:mysql://localhost:3306/chujing";
	String caseID =	(String)request.getParameter("caseID");
	
	Class.forName(DBDIVER);
	Connection conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from t_case where CASE_ID = "+caseID);
	//System.out.println(newsID);
	String caseTitle = "";
	String caseIntroduction = "";
	String caseCustomer = "";
	String resourceName="";
	String case3DSize = "";
	int caseStar = 0;
	String pic1 = "";
	String pic2 = "";
	String pic3 = "";
	String pic4 = "";
	String pic5 = "";
	if(rs.next()){
		caseTitle = rs.getString("CASE_TITLE");
		caseIntroduction = rs.getString("CASE_INTRODUCTION");
		caseCustomer = rs.getString("CASE_CUSTOMER");
		resourceName = rs.getString("CASE_3D_PATH");
		caseStar = rs.getInt("CASE_STAR");
		case3DSize = rs.getString("CASE_3D_SIZE");
		pic1 = rs.getString("CASE_SCREENSHOT1");
		pic2 = rs.getString("CASE_SCREENSHOT2");
		pic3 = rs.getString("CASE_SCREENSHOT3");
		pic4 = rs.getString("CASE_SCREENSHOT4");
		pic5 = rs.getString("CASE_SCREENSHOT5");
	}
	conn.close();
%>
<jsp:include page="include/header.jsp" />
<div id="page">
	<div id="content">
        <div class="post">
        	<div class="title"><span>案例介绍</span><a href="case.jsp">更多</a></div> 
	          <div class="case">
	                <div class="case_flash">
	                	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="350" height="250" align="middle"> 
								<param name="allowScriptAccess" value="sameDomain" /> 
								<param name="movie" value="images/PhotoPreView.swf?
								picurl1=images/<%=pic1 %>&
								picurl2=images/<%=pic2 %>&
								picurl3=images/<%=pic3 %>&
								picurl4=images/<%=pic4 %>&
								picurl5=images/<%=pic5 %>&
								"/>
								<param name="menu" value="false" />
								<param name="quality" value="high" />
								<param name="bgcolor" value="#333333" />
								<embed src="images/PhotoPreView.swf?picurl1=images/<%=pic1 %>&
								picurl2=images/<%=pic2 %>&
								picurl3=images/<%=pic3 %>&
								picurl4=images/<%=pic4 %>&
								picurl5=images/<%=pic5 %>" menu="false" quality="high" bgcolor="#333333" width="350" height="250" wmode="Transparent" name="mainflash" 
								
								align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" 
								
								pluginspage="http://www.macromedia.com/go/getflashplayer" /> 
						</object>
				</div>
				<div class="case_flash_content">
               		<span class="case_star"><%for(int i=0;i<caseStar;i++) out.print("★"); for(int i=0;i<5-caseStar;i++) out.print("☆"); %> </span>
                    <span class="case_title"><a href="#"  onclick="var DivWindow = new DivModelWindow('DivWindow','虚拟家居-互动看房','casePlay.jsp?resourceName=<%=resourceName %>',620,470,null);" ><%=caseTitle %></a></span>
                    <br />
					<span style="font-weight:bold;">作品介绍:</span>
					<div class="case_intro">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=caseIntroduction %></div> 
				</div>
				<div class="case_commments">Unity3D:<%=case3DSize %>MB</div>
				<div class="case_hits"> Download:<%=case3DSize %>MB</div>
                <div class="case_author">客户:<%=caseCustomer %> </div>
          </div>
		</div>
	</div>
	<!-- end #content -->
	<jsp:include page="include/sidebar.jsp" /> 
</div>
<!-- end #page -->
<jsp:include page="include/footer.jsp" /> 
</body>
</html>
