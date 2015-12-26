<%@ include file="header.jsp"%>
<%@page contentType="text/html" %>
<%@page import="IssueManagement.Issue"%>
<%@page import="proman.Project"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:useBean id="issue1" class="IssueManagement.IssueManagementFacade"></jsp:useBean>


<div class="s">   
    <div class="maindetail">
        
             <% 
             String id = request.getParameter("id");
             
             Issue issueDetails = null;
             if(id != null){
                 issueDetails = issue1.findById(Integer.parseInt(request.getParameter("id")));
                 request.setAttribute("commentList", issueDetails.getComments());
             }
                   
             %></h2> 
     </div>
     
     <div id="header">
        <h1>Reported By Me</h1>
     
     </div>
    
    <div id="nav">
        <table border="1"  width="400">
            <tr>
                <th width="100" align="left">Issue ID</th>
                <th width="200" align="left">Summary</th>
                <th width="200" align="left">Status</th>
                <th width="200" align="left">Type</th>
            </tr>
             <c:forEach var="option" items="${issue1.allIssueByMe}">
                 
                 <tr>
                     <td width="70"><a href="ReportedByMe.jsp?id=${option.id}">${option.id}</a></td>
                     <td width="300">${option.summary}</td>
                     <td width="300">${option.status}</td>
                     <td width="300">${option.type}</td>
                 </tr>
            </c:forEach>
         </table>
    </div>  
    
    <div id="section">
         <h2>Issue Details</h2>
 
         <div>
         
         <table>
             <tr>    
                 <td><b>Issue ID: </b></td>
                 <td><% if(issueDetails != null && issueDetails.getId() != null) 
                            out.print(issueDetails.getId()); %></td>
             </tr>
             <tr>
                 <td><b>Summary: </b></td>
                 <td><% if(issueDetails != null) 
                            out.print(issueDetails.getSummary()); %></td>
             </tr>
             <tr>
                 <td><b>Description: </b></td>
                 <td><% if(issueDetails != null) 
                            out.print(issueDetails.getDescription()); %></td>
             </tr>
             <tr>
                 <td><b>Creation Date: </b></td>
                 <td><% if(issueDetails != null) 
                            out.print(issueDetails.getCreationDate()); %></td>
             </tr>
             <tr>
                 <td><b>Due Date: </b></td>
                 <td><% if(issueDetails != null) 
                            out.print(issueDetails.getDueDate()); %></td>
             </tr>
             <tr>
                 <td><b>Type: </b></td>
                 <td><% if(issueDetails != null) 
                            out.print(issueDetails.getType()); %></td>
             </tr>
             <tr>
                 <td><b>Project: </b></td>
                 <td><% if(issueDetails != null && issueDetails.getProject()!=null){ 
                            out.print(issueDetails.getProject().getName()); 
                        }%></td>
             </tr>
             <tr>
                 <td><b>Assignee: </b></td>
                 <td><% if(issueDetails != null && issueDetails.getUserByAssignee()!=null){ 
                            out.print(issueDetails.getUserByAssignee().getName() + " " + issueDetails.getUserByAssignee().getSurname()); 
                        }%></td>
             </tr>
             <tr>
                 <td><b>Creator: </b></td>
                 <td><% if(issueDetails != null && issueDetails.getUserByCreatoruserId()!=null){ 
                            out.print(issueDetails.getUserByCreatoruserId().getName() + " " + issueDetails.getUserByAssignee().getSurname()); 
                        }%></td>
             </tr>
             <tr>
                 <td><b>Status: </b></td>
                 <td><% if(issueDetails != null) 
                            out.print(issueDetails.getStatus()); %></td>
             </tr>
             <tr>
                 <td><b>Priority: </b></td>
                 <td><% if(issueDetails != null) 
                            out.print(issueDetails.getPriority()); %></td>
             </tr>
             
         </table>
             <b></b>
        <table>
            <tr>
                <th align="left"><b>Date: </b></th>
                <th align="left"><b>Comment: </b></th>
            </tr>
            <c:forEach items="${commentList}" var="ceyda">
                <tr>
                    <td width="150"><c:out value="${ceyda.creationDate}"/></td>
                    <td width="400"><c:out value="${ceyda.comment}"/></td>  
                </tr>
            </c:forEach>  
        </table>
         </div>
                                                                
    </div>
    <div id="footer">
        Copyright © Venus.com
    </div>
</div>