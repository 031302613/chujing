<%@ page language="java" import="com.javaBean.Case,com.Dao.impl.CaseDao,java.util.List" contentType="text/html; charset=UTF-8"
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
CaseDao dao = new CaseDao();
String caseID =	(String)request.getParameter("caseID");
Case _case = dao.getByID(caseID);
%>
<script type="text/javascript">
function PhotoPreView(obj,action){
	var resourceName = document.getElementById('resourceName');
	var source = 'casePlay.jsp?resourceName='+resourceName.value;
	var DivWindow = new DivModelWindow('DivWindow','在线观看',source,620,470,null);
}
</script>
<jsp:include page="include/header.jsp" />
<div id="TabMenuCon2">
</div>
<div id="page">
	<div id="content">
        <div class="post">
        	<div class="title"><span>案例介绍</span><a href="case.jsp">更多</a></div> 
	          <div class="case">
	                <div class="case_flash">
	                	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="350" height="250" align="middle"> 
								<param name="allowScriptAccess" value="sameDomain" /> 
								<param name="movie" value="images/PhotoPreView.swf?
								picurl1=resource/<%=_case.getCaseScreenshot1() %>&
								picurl2=resource/<%=_case.getCaseScreenshot2() %>&
								picurl3=resource/<%=_case.getCaseScreenshot3() %>&
								picurl4=resource/<%=_case.getCaseScreenshot4() %>&
								picurl5=resource/<%=_case.getCaseScreenshot5() %>&
								"/>
								<param name="menu" value="false" />
								<param name="quality" value="high" />
								<param name="bgcolor" value="#333333" />
								<embed src="images/PhotoPreView.swf?picurl1=resource/<%=_case.getCaseScreenshot1() %>&
								picurl2=resource/<%=_case.getCaseScreenshot2() %>&
								picurl3=resource/<%=_case.getCaseScreenshot3() %>&
								picurl4=resource/<%=_case.getCaseScreenshot4() %>&
								picurl5=resource/<%=_case.getCaseScreenshot5() %>" menu="false" quality="high" bgcolor="#333333" width="350" height="250" wmode="Transparent" name="mainflash" 
								
								align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" 
								
								pluginspage="http://www.macromedia.com/go/getflashplayer" /> 
						</object>
				</div>
				<div class="case_flash_content">
               		<span class="case_star"><%for(int i=0;i<_case.getCaseStar();i++) out.print("★"); for(int i=0;i<5-_case.getCaseStar();i++) out.print("☆"); %> </span>
                    <span class="case_title"><a href="#"  onclick="var DivWindow = new DivModelWindow('DivWindow','在线观看,'casePlay.jsp?resourceName=<%=_case.getCase3DPath() %>',620,470,null);" ><%=_case.getCaseTitle() %></a></span>
                    <br />
					<span style="font-weight:bold;">作品介绍:</span>
					<div class="case_intro">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=_case.getCaseIntroduction() %></div>
					<input type="hidden" id="resourceName" value="<%=_case.getCase3DPath() %>"></input> 
				</div>
				<div class="case_commments"><a href="#"  onclick="var DivWindow = new DivModelWindow('DivWindow','在线观看','casePlay.jsp?resourceName=<%=_case.getCase3DPath() %>',620,470,null);" >在线播放:<%=_case.getCase3DSize() %>MB</a></div>
				<div class="case_hits"><a href="resource/<%=_case.getCaseRARPath() %>" >下载:<%=_case.getCase3DSize() %>MB</a></div>
                <div class="case_author">客户:<%=_case.getCaseCustomer() %> </div>
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
