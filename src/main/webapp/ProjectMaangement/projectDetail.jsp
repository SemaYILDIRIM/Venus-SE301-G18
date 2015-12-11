 <%@page import="UserManagement.User"%>
<%@page import="java.util.List"%>
<jsp:useBean id="projects"  class="proman.ProjectManagementFacade"></jsp:useBean>
<jsp:useBean id="issue"  class="IssueManagement.IssueManagementFacade"></jsp:useBean>
 <jsp:useBean id="user5"  class="UserManagement.User" scope="session"></jsp:useBean>
 <jsp:useBean id="userfacade"  class="UserManagement.UserManagementFacade" scope="session"></jsp:useBean>
 <div class="detail">
     <div class="maindetail">
         <h2 class="proname"><img src="http://teachingresourcesbeta.businesscatalyst.com/images/icons/icon-circle-arrow-down_grey.png" style="width: 50px;height: 50px; margin-top: 10px;"></img>
             <% proman.Project p=new proman.Project();
                    p= projects.getProjectDetail(request.getParameter("name"));
                out.print(p.getName());
             %></h2> 
     </div>
     
     
        <%
    HttpSession session1= request.getSession();
   String g=""+session1.getAttribute("id");
   
   if(user5.getUser(g).getRole().contains("manager")){

%>
         <div class="tab">
         <ul class="promenu">
             <a  href="#link1"><li>
             Project Detail
             </li></a>
             <a  href="#link2"><li>
                 Project developer
             </li></a>
             <a  href="#link3"><li>
                 Assign Project to Staff
             </li></a>
             <a  href="#link4"><li>
                 Issues
             </li></a>
         </ul>
             
         <div id="link1" class="prodetail">
             <h2 class="proname"><% out.print(p.getName() +" "); %></h2>
             <hr>
             <img src="http://www.hilepack.com/img/User-blue-icon.png" style="width: 30px;height: 30px; margin-right: 10px; margin-left: 10px;"/>
             Manager: <% out.print(user5.getUser(""+p.getUser().getId()).getName()+" "+ user5.getUser(""+p.getUser().getId()).getSurname()); %>
             <hr>
             <p class="proname">Description: <% out.print(p.getDiscription()); %></p>
             <p class="proname">Type: <% out.print(p.getType()); %></p>
             <p class="proname">Due Date: <% out.print(p.getDueDate()); %></p>
             <p class="proname">Creation Date: <% out.print(p.getCreationDate()); %></p>
             <p class="proname">Priority: <% out.print(p.getPriority()); %></p>
         
         </div>
             
             
         <div id="link2" class="prodetail">
             <% out.print(request.getParameter("name")+"  --2222--");
             out.print("size: "+projects.getProjectUser(p.getId()).size());
             %>
             
             
             
             <table class="table" style="margin-left: 100px; margin-top: 50px;">
    <tr>
    <th style="background-color: #407fbf; color: white;">User Name</th>
    <th style="background-color: #407fbf; color: white;" >User Surname </th>
    <th style="background-color: #407fbf; color: white;">Role</th>
    <th style="background-color: #407fbf; color: white;">Email</th>
  </tr>
    <% 
for (int i=0; i<projects.getProjectUser(p.getId()).size(); i++){
    String u=projects.getProjectUser(p.getId()).get(i).getUser().getId()+"";
    %>
<tr>
    <td><a href=""><%=userfacade.getUserInfo(u).getName()%></a></td>
    <td><a href=""><%=userfacade.getUserInfo(u).getSurname()%></a></td>
    <td><a href=""><%=userfacade.getUserInfo(u).getRole()%></a></td>
    <td><a href=""><%=userfacade.getUserInfo(u).getEmail()%></a></td>
    </tr>
        <%}
        %>
    
</table>
        
         
         </div>
         <div id="link3" class="prodetail">
             <% out.print(request.getParameter("name")+"  --33--"); %>
             <form action="Projects.jsp?name=<%=request.getParameter("name")%>&uid=0#link3" method="post">
                 <input name="search"/>
             <input type="submit" value="Search" /></form>
             
             <%
             String searchString = request.getParameter("search");
             String result="";
             List<UserManagement.User> searchResults=userfacade.SearchStaff(searchString);
             if (searchString != null) {}
             if (searchResults.isEmpty()) {
                 result="No Result";
                 out.print(result);
                 result="";
             }
             if (!searchResults.isEmpty()) {
                 out.print(searchResults.get(0).getName());
                   %>
     <table class="table" style="margin-left: 100px; margin-top: 50px;">
    <tr>
    <th  style="background-color: #407fbf; color: white;">User Name</th>
    <th style="background-color: #407fbf; color: white;">User Surname</th>
    <th style="background-color: #407fbf; color: white;">Role</th>
    <th style="background-color: #407fbf; color: white;">Add Staff to Project</th>
  </tr>
    <% 
for (int i=0; i<searchResults.size(); i++){%>
<tr>
    <td><a href=""><%=searchResults.get(i).getName()%></a></td>
    <td><a href=""><%=searchResults.get(i).getSurname()%></a></td>
    <td><a href=""><%=searchResults.get(i).getRole()%></a></td>
    <td>
        <form method = "post" action = "Projects.jsp?name=<%=request.getParameter("name")%>&uid=<%=searchResults.get(i).getId()%>" >  <input class="btn" type = "submit" name = "Submit" value = "Add" /></form>
    </td>
</tr>
        <%}
searchString="";
        %>
    
</table><%}%>
         </div>
         <div id="link4" class="prodetail">
             <% out.print(request.getParameter("name")+"  --44--"); %>
             
             
             <table class="table" style="margin-left: 100px; margin-top: 50px;">
                        <tr>
                            <th  style="background-color: #407fbf; color: white;">Issue Discription</th>
                            <th style="background-color: #407fbf; color: white;">Issue Name</th>
                            <th style="background-color: #407fbf; color: white;">Issue Type</th>
                            <th style="background-color: #407fbf; color: white;">Issue Creation Date</th>
                            <th style="background-color: #407fbf; color: white;">Issue Priority</th>
                            <th style="background-color: #407fbf; color: white;">Issue DueDate</th>
                        </tr>
                        
                        <% 
    
                         for (int i=0; i<issue.getIssuesManager(request.getParameter("name")).size(); i++){%>
                        <tr>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issue.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issue.getIssuesManager(request.getParameter("name")).get(i).getDescription()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issue.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issue.getIssuesManager(request.getParameter("name")).get(i).getSummary()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issue.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issue.getIssuesManager(request.getParameter("name")).get(i).getDescription()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issue.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issue.getIssuesManager(request.getParameter("name")).get(i).getCreationDate()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issue.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issue.getIssuesManager(request.getParameter("name")).get(i).getPriority()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issue.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issue.getIssuesManager(request.getParameter("name")).get(i).getDueDate()%></a></td>

                        </tr> <%}%>
                    </table>
             
             
             
         </div>
     </div>
     <%}else{%>
      <div class="tab">
         <ul class="promenu">
             <a  href="#link1"><li>
             Project Detail
             </li></a>
             <a  href="#link2"><li>
                 Project members
             </li></a>
             <a  href="#link3"><li>
                My Issues
             </li></a>
         </ul>
             
         <div id="link1" class="prodetail">
             <h2 class="proname"><% out.print(p.getName()); %></h2>
             <hr>
             <img src="http://www.hilepack.com/img/User-blue-icon.png" style="width: 30px;height: 30px; margin-right: 10px; margin-left: 10px;"/>
             Manager: <% out.print(" Project Manager"); %>
             <hr>
             <p class="proname">Description: <% out.print(p.getDiscription()); %></p>
             <p class="proname">Type: <% out.print(p.getType()); %></p>
             <p class="proname">Due Date: <% out.print(p.getDueDate()); %></p>
             <p class="proname">Creation Date: <% out.print(p.getCreationDate()); %></p>
             <p class="proname">Priority: <% out.print(p.getPriority()); %></p>
         
         
         </div>
         <div id="link2" class="prodetail">
             <% out.print(request.getParameter("name")+"  --2222--"); %>
             <% out.print(request.getParameter("name")+"  --2222--");
             out.print("size: "+projects.getProjectUser(p.getId()).size());
             %>
             
             
             
             <table class="table" style="margin-left: 100px; margin-top: 50px;">
    <tr>
    <th  style="background-color: #407fbf; color: white;">User Name</th>
    <th style="background-color: #407fbf; color: white;" >User Surname </th>
    <th style="background-color: #407fbf; color: white;">Role</th>
    <th style="background-color: #407fbf; color: white;">Email</th>
  </tr>
    <% 
for (int i=0; i<projects.getProjectUser(p.getId()).size(); i++){
    String u=projects.getProjectUser(p.getId()).get(i).getUser().getId()+"";
    %>
<tr>
    <td><a href=""><%=userfacade.getUserInfo(u).getName()%></a></td>
    <td><a href=""><%=userfacade.getUserInfo(u).getSurname()%></a></td>
    <td><a href=""><%=userfacade.getUserInfo(u).getRole()%></a></td>
    <td><a href=""><%=userfacade.getUserInfo(u).getEmail()%></a></td>
    </tr>
        <%}
        %>
    
</table>
         </div>
         <div id="link3" class="prodetail">
             <% out.print(request.getParameter("name")+"  --33--"); %>
             
             <table class="table" style="margin-left: 100px; margin-top: 50px;">
                        <tr>
                            <th  style="background-color: #407fbf; color: white;">Issue Discription</th>
                            <th style="background-color: #407fbf; color: white;">Issue Name</th>
                            <th style="background-color: #407fbf; color: white;">Issue Type</th>
                            <th style="background-color: #407fbf; color: white;">Issue Creation Date</th>
                            <th style="background-color: #407fbf; color: white;">Issue Priority</th>
                            <th style="background-color: #407fbf; color: white;">Issue DueDate</th>
                        </tr>
                        
                        <% 
    
                         for (int i=0; i<issue.getIssuesAssignee(g,request.getParameter("name")).size(); i++){%>
                        <tr>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issue.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issue.getIssuesAssignee(g,request.getParameter("name")).get(i).getDescription()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issue.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issue.getIssuesAssignee(g,request.getParameter("name")).get(i).getSummary()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issue.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issue.getIssuesAssignee(g,request.getParameter("name")).get(i).getDescription()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issue.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issue.getIssuesAssignee(g,request.getParameter("name")).get(i).getCreationDate()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issue.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issue.getIssuesAssignee(g,request.getParameter("name")).get(i).getPriority()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issue.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issue.getIssuesAssignee(g,request.getParameter("name")).get(i).getDueDate()%></a></td>

                        </tr> <%}%>
                    </table>
         </div>
     </div>
       
<%}%>   
         <% 
   
           // if(!request.getParameter("uid").equals("0")){
           //     projects.saveProjectUser(request.getParameter("name"), request.getParameter("uid"));
           // }
         
         if(request.getParameter("Submit")==null){}
            else{
                            if(request.getParameter("Submit").equals("Add")){
                            projects.saveProjectUser(request.getParameter("name"), request.getParameter("uid"),g);
                            }}
         %>
</div>