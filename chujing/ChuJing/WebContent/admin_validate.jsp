
<% 
  String admin = (String)session.getAttribute("USERID");
  if(admin==null||admin.length()==0)
  {
      out.println("<script language='javascript'>alert('你还没有登录!');"+"window.location.href='admin_login.jsp';</script>");
  }
%>