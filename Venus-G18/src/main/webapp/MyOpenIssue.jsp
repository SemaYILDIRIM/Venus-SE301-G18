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
        <table>
             <c:forEach var="option" items="${issue1.allIssue}">
                 <tr>
                     <td width="70"><a href="MyOpenIssue.jsp?id=${option.id.id}">${option.id.id}</a></td>
                     <td width="300">${option.summary}</td>
                     <td width="300">${option.status}</td>
                 </tr>
            </c:forEach>
         </table>
    </div>  
    
    <div id="section">
         <h2>My Issues</h2>
 
         <div><%String issueId=request.getParameter("id");
         
         if(issueId != null){
             Issue issueDetails = issue1.findById(Integer.parseInt(issueId));
             
           
         }
         %>
         
         <table>
             <tr>
                 <td>${issueDetails.id}</td>
             </tr>
             <tr>
                 <td>${issueDetails.description}</td>
             </tr>
         </table>
         </div>
                                                                
    </div>
    <div id="footer">
        Copyright © Venus.com
    </div>
</div>