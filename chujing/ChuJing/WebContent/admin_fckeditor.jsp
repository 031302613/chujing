
<%@ page import="com.fredck.FCKeditor.*"%>
<%
	//response.setCharacterEncoding("GB2312");
	FCKeditor oFCKeditor = new FCKeditor( request, "content" ) ;
	FCKeditorConfigurations editorConfig = new FCKeditorConfigurations();
	oFCKeditor.setConfig(editorConfig);		
	oFCKeditor.setBasePath( "FCKeditor/" ) ;
	oFCKeditor.setHeight("100%");
	//out.println( oFCKeditor.create() ) ;
%>
