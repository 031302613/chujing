<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language='javascript' src='js/detect.js'></script>
<script language='VBScript' src='js/detectVB.js'></script>
<style type="text/css">
  .displayNo {display: none;}
  .displayYes {display: block;}
</style>
</head>
<body>
<%
	String resourceName = (String) request.getParameter("resourceName");
%>
<div id="message" class="displayNo">您没有安装Unity3D播放器，请下载安装<a href="images/UnityWebPlayer.exe">点此下载</a></div>
<div id="unityPlayer" class="displayYes">
<script type="text/javascript">
	if (DetectUnityWebPlayer())
	{
		document.getElementById("message").className = "displayNo";
		document.getElementById("unityPlayer").className = "displayYes";
	}
	else
	{
		document.getElementById("message").className = "displayYes";
		document.getElementById("unityPlayer").className = "displayNo";
	}
</script>
<object id="UnityObject" standby="正在加载播放器，请耐心等待！"
	classid="clsid:444785F1-DE89-4295-863A-D46C3A781394" width="600"
	height="450">
	<param name="src" value="resource/<%=resourceName%>" />
	<embed id="UnityEmbed" src="resource/<%=resourceName%>" width="600"
		height="450" type="application/vnd.unity"/></object>
</div>
</body>
</html>