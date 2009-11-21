<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="sidebar">
		<ul>
				<li>
					<h2>最新案例</h2>
					<ul>
					<% 
	String DBDIVER = "com.mysql.jdbc.Driver";
	String DBUSER = "root";
	String DBPASSWORD = "123456";
	String DBURL = "jdbc:mysql://localhost:3306/chujing";
	
	Class.forName(DBDIVER);
	Connection conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from t_case LIMIT 4");
	
	String caseTitle;
	String caseID;
	String caseCustomer;
	String pic1;
	int caseStar;
	while(rs.next()){
		caseID = rs.getString("CASE_ID");
		caseCustomer = rs.getString("CASE_CUSTOMER");
		caseTitle = rs.getString("CASE_TITLE");
		caseStar = rs.getInt("CASE_STAR");
		pic1 = rs.getString("CASE_SCREENSHOT1");
%>
						<li>
                        	<div class="sidebar_content">
                                <div class="sidebar_image">
                                    <a href="caseContent.jsp?caseID=<%=caseID %>" ><img src="images/<%=pic1 %>" alt="<%=caseTitle %>" border="0" height="93" width="138" /></a>	
                                </div>
                                <a href="caseContent.jsp?caseID=<%=caseID %>" class="sidebar_title" ><%=caseTitle %></a>
                                <br />
                                <span class="sidebar_author">客户:<%=caseCustomer %> </span>
                                <br />
                                <font color="999999">星级：</font><font color="red"><% for(int i=0;i<caseStar;i++) out.print("★"); %></font>
                            </div>
                        </li>
                        <%} %>
					</ul>
				</li>
		</ul>
	</div>
	<!-- end #sidebar -->
	<%
	conn.close();
	%>