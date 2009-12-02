<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language='javascript' src='js/detect.js'></script>
<script language='VBScript'  src='js/detectVB.js'></script>
</head>
<script language='javascript'>

</script>
<body>
<%
	String resourceName = (String) request.getParameter("resourceName");
%>
<Button id="message"></Button>
<object id="UnityObject" classid="clsid:444785F1-DE89-4295-863A-D46C3A781394"
    width="600" height="450"
    codebase="http://webplayer.unity3d.com/download_webplayer/UnityWebPlayer.cab#version=2,0,0,0">
    <param name="src" value="resource/<%=resourceName %>" />
    <embed id="UnityEmbed" src="resource/<%=resourceName %>" width="600" height="450"
        type="application/vnd.unity" pluginspage="http://www.unity3d.com/unity-web-player-2.x" />
</object>
</body>
</html>