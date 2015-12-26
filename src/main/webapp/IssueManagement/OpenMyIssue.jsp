<%@page import="IssueManagement.Issue"%>
<jsp:useBean id="issue3"  class="IssueManagement.IssueManagementFacade"></jsp:useBean>
    <jsp:useBean id="userr"  class="UserManagement.UserManagementFacade"></jsp:useBean>
<%
    String issueid=request.getParameter("issueid");
    String userid=request.getParameter("userid");
    Issue i=issue3.getIssueById(issueid, userid);
%> 
    <div class="issuedetail">

             <ul>
                <li  style="float: right; margin-right: 60%; height: 20px;width: 150px;" onmouseout="hide4()" onmouseover="show4()">Change Issue's Status
                    <div id="status" style="margin-top: 0px; float: right; margin-right: 60%; visibility: hidden">
                        <ul>
                            <li style="width: 145px;">
                                <form method="post" action="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=request.getParameter("issueid")%>&userid=<%=request.getParameter("userid")%>">
                                    <input type="submit" formaction="" style="width: 145px; margin-top:-1px;" class="loginbuttons" value="Inprogress" name="Submit" >
                                </form>
                            </li>
                            <li style="width: 101px;width: 100px; margin-top:0px;">
                                <form method="post" action="changeStatus.jsp?name=<%=request.getParameter("name")%>&issueid=<%=request.getParameter("issueid")%>&userid=<%=request.getParameter("userid")%>">
                                    <input type="submit" style="width: 145px; margin-top:-1px;" class="loginbuttons" value="Resolved" name="Submit" >
                                </form>   
                                <form method="post" action="changeStatus.jsp?name=<%=request.getParameter("name")%>&issueid=<%=request.getParameter("issueid")%>&userid=<%=request.getParameter("userid")%>">    
                                    <input type="submit" style="width: 145px; margin-top:-1px;" class="loginbuttons" value="Reopen" name="Submit" >
                                </form> 
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>



                 <hr>
                 <img src="https://cdn0.iconfinder.com/data/icons/octicons/1024/issue-reopened-128.png" style="width: 30px;height: 30px; margin-right: 10px; margin-left: 10px;"/>
                 Issue Name: <%=i.getDescription()  %>
                 <hr>
                 <p class="issue">Assignee: <%=userr.getUserInfo(i.getUserByAssignee().getId()+"").getName()%> <%=userr.getUserInfo(i.getUserByAssignee().getId()+"").getSurname()%></p>
                 <p class="issue">Description: <%=i.getDescription() %></p>
                 <p class="issue">Summary: <%=i.getSummary() %></p>
                 <p class="issue">Status: <%=i.getStatus() %></p>
                 <p class="issue">Due Date: <%=i.getDueDate() %></p>
                 <p class="issue">Type: <%=i.getType() %></p>
                 <p class="issue">Priority: <%=i.getPriority()  %></p>
                 <hr>
                 <br><br>
                 <% out.println();%>
                <%@ include file="addComment.jsp"%>
                <%@ include file="PutAttachment.jsp"%>

    </div>


<script>
        function show4() {
            document.getElementById("status").style.visibility = "visible";
        }

        function hide4() {
           document.getElementById("status").style.visibility = "hidden";
        }
                    
</script>
 <% 
   if(request.getParameter("Submit")==null){}
            else{
                if(request.getParameter("Submit").equals("Inprogress")){

                issue3.changestatus("Inprogress", Integer.parseInt(issueid));
                    }
                }
         %>
