 
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <%@page import="IssueManagement.IssueId"%>
<%@page import="IssueManagement.Issue"%>
<%@page import="IssueManagement.Comment"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <jsp:useBean id="issueman"  class="IssueManagement.IssueManagementFacade"></jsp:useBean>
 <table  class="table table-hover" style="width: 200px;">
     <thead>
         <th>Comment</th>
     </thead>
     <tbody>
     <%String issueid=request.getParameter("name");
     issueman.getCommentList(issueid);
     %>
     <c:forEach items="${issueman.getList()}" var="element"> 
  <tr>
    <td>${element.comment}</td>
  </tr>
</c:forEach>
  </tbody>
</table>
<form method="post" action="addComment.jsp?name=2&asgn=110&proid=1&issueid=2">
    <textarea style="max-height: 200px; width: 300px; max-width: 300px; height: 100px;" maxlength="500" title="max character 500" name="cmnt"></textarea>
    <br>
    <input type="submit" name="Submit" value="Add Comment"/>
</form>
     <%
         if(request.getParameter("Submit")==null){}
            else{
                            if(request.getParameter("Submit").equals("Add Comment")){
                                issueman.saveCmnt(request.getParameter("cmnt"),request.getParameter("asgn"),request.getParameter("proid"),request.getParameter("issueid"));
                            
                            }}
         %>