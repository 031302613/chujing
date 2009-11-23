<%@ page language="java" import="com.javaBean.Case,com.Dao.impl.CaseDao,java.util.List" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="sidebar">
		<ul>
				<li>
					<h2>最新案例</h2>
					<ul>
					<% 
					CaseDao dao = new CaseDao();
					String sql = "select * from t_case  order by 'CASE_PUBLISH_TIME' desc LIMIT 4";
					List list = dao.getListBySQL(sql);
					Case _case;
					for(int i=0;i<list.size();i++){
	    				_case = (Case)list.get(i);
					%>
						<li>
                        	<div class="sidebar_content">
                                <div class="sidebar_image">
                                    <a href="caseContent.jsp?caseID=<%=_case.getCaseId() %>" ><img src="images/<%=_case.getCaseScreenshot1() %>" alt="<%=_case.getCaseTitle() %>" border="0" height="93" width="138" /></a>	
                                </div>
                                <a href="caseContent.jsp?caseID=<%=_case.getCaseId() %>" class="sidebar_title" ><%=_case.getCaseTitle() %></a>
                                <br />
                                <span class="sidebar_author">客户:<%=_case.getCaseCustomer() %> </span>
                                <br />
                                <font color="999999">星级：</font><font color="red"><% for(int j=0;j<_case.getCaseStar();j++) out.print("★"); %></font>
                            </div>
                        </li>
                        <%} %>
					</ul>
				</li>
		</ul>
	</div>
	<!-- end #sidebar -->