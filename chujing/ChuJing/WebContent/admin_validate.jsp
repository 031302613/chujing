
<% 

  String admin = (String)session.getAttribute("USERID");
String str="<script language='javascript'>alert('用户未登入！非法访问！');"+"window.location.href='admin_login.jsp';</script>";
String strout=new   String(str.getBytes("ISO-8859-1"),"utf-8");  
  if(admin==null||admin.length()==0)
  {
      out.println(strout);
  }
%>