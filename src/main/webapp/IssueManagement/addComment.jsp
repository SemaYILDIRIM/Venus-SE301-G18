 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  
<%@page import="IssueManagement.Issue"%>
<%@page import="IssueManagement.Comment"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <jsp:useBean id="issueman"  class="IssueManagement.IssueManagementFacade"></jsp:useBean>
 <div style="float: left;">
 <table  class="table table-hover" style="width: 500px; margin-right: 60px; margin-left: 80px;">
     <thead>
         <th>Comments</th>
         <th>Delete</th>
     </thead>
     <tbody>
     <%String issueid3=request.getParameter("issueid");
     issueman.getCommentList(issueid3);
     for(int ic=0;ic<issueman.getList().size();ic++){
     %>
     
        <tr>
            <td><%=issueman.getList().get(ic).getComment()%></td>
          <td> <form method="post" action="/A-Venus/Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=request.getParameter("issueid")%>&userid=<%=request.getParameter("userid")%>">
                  <input type="text" value="<%=issueman.getList().get(ic).getId()%>" name="commentid" style="width: 0px; height: 0px;" >
                  <input type="text" value="<%=issueman.getList().get(ic).getUser().getId()%>" name="commentuid" style="width: 0px; height: 0px;" >
                  <input type="submit" value="Delete" name="Submit" >
              
              </form></td>
        </tr>
        <%}%>
    </tbody>
    
</table>
     
<form method="post" action="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=request.getParameter("issueid")%>&userid=<%=request.getParameter("userid")%>">
    <textarea style="max-height: 200px; height: 100px; width: 500px; max-width: 500px; margin-left: 8px; margin-top: 30px; " maxlength="500" title="max character 500" name="cmnt"></textarea>
    <br>
    <input type="submit" name="Submit" value="AddComment"/>
</form>
     <%
         if(request.getParameter("Submit")==null){}
            else{
                            if(request.getParameter("Submit").equals("AddComment")){
                                issueman.saveCmnt(request.getParameter("cmnt"),request.getParameter("userid"),request.getParameter("issueid"));
                            
                            }
                            else if(request.getParameter("Submit").equals("Delete")){
                                issueman.deleteComment(request.getParameter("commentid")+"",request.getParameter("commentuid"),request.getParameter("issueid"));
                                
                            }
         }
         %>
         </div>