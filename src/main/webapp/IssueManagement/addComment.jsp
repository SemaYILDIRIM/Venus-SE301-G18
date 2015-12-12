 
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
            </thead>
            <tbody>
                <%
                    String issueid3=request.getParameter("issueid");
                    issueman.getCommentList(issueid3);
                %>
                <c:forEach items="${issueman.getList()}" var="element"> 
                    <tr>
                      <td>${element.comment}</td>
                    </tr>
                </c:forEach>
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
                }
         %>
         </div>