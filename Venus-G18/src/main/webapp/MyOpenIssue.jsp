<%@ include file="header.jsp"%>
<%@page contentType="text/html" %>
<%@page import="IssueManagement.Issue"%>
<%@page import="proman.Project"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:useBean id="issue1" class="IssueManagement.Issue"></jsp:useBean>


<div class="s">   
     <div id="header">
        <h1>My Open Issues</h1>
     
     </div>
    
    <div id="nav">
        <p><a href="/Venus-G18/MyOpenIssue.jsp">Assigned to Me</a></p><br>
        <!--<p><a href="/Venus-G18/ReportedByMe.jsp">Reported by Me</a></p><br>-->
    </div>  
    
    <div id="section">
         <h2>My Issues</h2>
         
         <table>
             <c:forEach var="option" items="${issue1.allIssue}">
                 <tr>
                     <td width="70"><a href="MyOpenIssue.jsp?name=${option.id.id}">${option.id.id}</a></td>
                     <td width="300">${option.summary}</td>
                     <td width="300">${option.description}</td>
                 </tr>
            </c:forEach>
         </table>
         <div><%String issues=request.getParameter("name");
         out.print(issues);
         
         %></div>
                                                                
    </div>
    <div id="footer">
        Copyright © Venus.com
    </div>
</div>