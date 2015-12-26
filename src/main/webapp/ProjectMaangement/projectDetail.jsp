<%@page import="UserManagement.User"%>
<%@page import="IssueManagement.Issue"%>
<%@page import="java.util.List"%>
<jsp:useBean id="projects"  class="proman.ProjectManagementFacade"></jsp:useBean>
<jsp:useBean id="issueFcd"  class="IssueManagement.IssueManagementFacade"></jsp:useBean>
 <jsp:useBean id="user5"  class="UserManagement.User" scope="session"></jsp:useBean>
 <jsp:useBean id="userfacade"  class="UserManagement.UserManagementFacade" scope="session"></jsp:useBean>
 <div class="detail">
     <div class="maindetail">
         <h2 class="proname2"><img src="http://teachingresourcesbeta.businesscatalyst.com/images/icons/icon-circle-arrow-down_grey.png" style="width: 50px;height: 50px; margin-top: 10px;"></img>
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
             <a  href="#link5"><li>
                 Reported By Me
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
                <table class="table">
                   <thead> <tr>
                    <th style="background-color: #407fbf; color: white;">User Name</th>
                    <th style="background-color: #407fbf; color: white;" >User Surname </th>
                    <th style="background-color: #407fbf; color: white;">Role</th>
                    <th style="background-color: #407fbf; color: white;">Email</th>
                  </tr>
                  </thead> 
                        <tbody id="myTable2">
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

               </tbody>
                    </table>
                        
       
            <ul class="pagination pagination-lg pager" id="myPager2">
            
            </ul>
    
        
        
         
         </div>
         <div id="link3" class="prodetail">
             <form action="Projects.jsp?name=<%=request.getParameter("name")%>&uid=0#link3" method="post">
                 <input type="radio" name="name" value="name" checked="">Name <input type="radio" name="name" value="email">Email <br><br>
                 <input name="search"/>
                 <h6>Enter Staff's name or email to add</h6>
                 <input type="submit" value="Search" name="Submit" />
             </form>
             
             <%
             if(request.getParameter("Submit")==null){}
            else{
                            if(request.getParameter("Submit").equals("Search")){
                                
                            
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
                   %>
     <table class="table">
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
                <form method = "post" action = "Projects.jsp?name=<%=request.getParameter("name")%>&uid=<%=searchResults.get(i).getId()%>" >  
                    <%
                    if(projects.listUserProject(searchResults.get(i).getId(), Integer.parseInt(request.getParameter("name"))).size()>0){
                        
                    
                    %>
                    <input class="btn" type = "text" name = "Submit" value = "Already in project" disabled="" style="width: 300px;" /></form>
                    <%}else{%>
                    <input class="btn" type = "submit" name = "Submit" value = "Add" /></form>
                    <%}%>
            </td>
        </tr>
            <%}
                searchString="";
            %>
    
</table><%}}}%>
         </div>
         <div id="link4" class="prodetail">
                    <table class="table">
                       <thead> <tr>
                            <th  style="background-color: #407fbf; color: white;">Issue Description</th>
                            <th style="background-color: #407fbf; color: white;">Issue Name</th>
                            <th style="background-color: #407fbf; color: white;">Issue Type</th>
                            <th style="background-color: #407fbf; color: white;">Issue Creation Date</th>
                            <th style="background-color: #407fbf; color: white;">Issue Priority</th>
                            <th style="background-color: #407fbf; color: white;">Issue DueDate</th>
                        </tr>
                        </thead> 
                        <tbody id="myTable3">
                        <% 
    
                         for (int i=0; i<issueFcd.getIssuesManager(request.getParameter("name")).size(); i++){%>
                        <tr>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueFcd.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issueFcd.getIssuesManager(request.getParameter("name")).get(i).getDescription()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueFcd.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issueFcd.getIssuesManager(request.getParameter("name")).get(i).getSummary()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueFcd.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issueFcd.getIssuesManager(request.getParameter("name")).get(i).getType()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueFcd.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issueFcd.getIssuesManager(request.getParameter("name")).get(i).getCreationDate()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueFcd.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issueFcd.getIssuesManager(request.getParameter("name")).get(i).getPriority()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueFcd.getIssuesManager(request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issueFcd.getIssuesManager(request.getParameter("name")).get(i).getDueDate()%></a></td>

                        </tr> <%}%>
                   </tbody>
                    </table>
      <ul class="pagination pagination-lg pager" id="myPager3"></ul>
             
             
             
         </div>
                   
        <div id="link5" class="prodetail">
            <table class="table" style="margin-left: 100px; margin-top: 50px;">
                <thead> 
                    <tr>
                        <th  style="background-color: #407fbf; color: white;">Issue Description</th>
                        <th style="background-color: #407fbf; color: white;">Issue Name</th>
                        <th style="background-color: #407fbf; color: white;">Issue Type</th>
                        <th style="background-color: #407fbf; color: white;">Issue Creation Date</th>
                        <th style="background-color: #407fbf; color: white;">Issue Priority</th>
                        <th style="background-color: #407fbf; color: white;">Issue DueDate</th>
                    </tr>
                </thead> 
                <tbody id="myTable">
                <% 
                    List<Issue> issueList = issueFcd.getAllIssueByMe();     
                    for (int i=0; i<issueList.size(); i++){%>
                        <tr>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueList.get(i).getId()%>&userid=<%=g%>"><%=issueList.get(i).getDescription()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueList.get(i).getId()%>&userid=<%=g%>"><%=issueList.get(i).getSummary()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueList.get(i).getId()%>&userid=<%=g%>"><%=issueList.get(i).getDescription()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueList.get(i).getId()%>&userid=<%=g%>"><%=issueList.get(i).getCreationDate()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueList.get(i).getId()%>&userid=<%=g%>"><%=issueList.get(i).getPriority()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueList.get(i).getId()%>&userid=<%=g%>"><%=issueList.get(i).getDueDate()%></a></td>
                        </tr> 
                        
                <%}%>
                    </tbody>
                    </table>
            <div class="col-md-12 text-center">
                <ul class="pagination pagination-lg pager" id="myPager"></ul>
            </div>
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
             
             <a  href="#link5"><li>
                Reported By Me
             </li></a>
         </ul>
             
         <div id="link1" class="prodetail">
             <h2 class="proname"><% out.print(p.getName()); %></h2>
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
            <table class="table" >
               <thead> <tr>
                <th  style="background-color: #407fbf; color: white;">User Name</th>
                <th style="background-color: #407fbf; color: white;" >User Surname </th>
                <th style="background-color: #407fbf; color: white;">Role</th>
                <th style="background-color: #407fbf; color: white;">Email</th>
                </tr>
                </thead> 
                        <tbody id="myTable4">
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
    
           </tbody>
                    </table>
      <ul class="pagination pagination-lg pager" id="myPager4"></ul>
         </div>
         <div id="link3" class="prodetail">
             
             <table class="table">
                       <thead> <tr>
                            <th  style="background-color: #407fbf; color: white;">Issue Description</th>
                            <th style="background-color: #407fbf; color: white;">Issue Name</th>
                            <th style="background-color: #407fbf; color: white;">Issue Type</th>
                            <th style="background-color: #407fbf; color: white;">Issue Creation Date</th>
                            <th style="background-color: #407fbf; color: white;">Issue Priority</th>
                            <th style="background-color: #407fbf; color: white;">Issue DueDate</th>
                        </tr>
                        </thead> 
                        <tbody id="myTable5">
                        <% 
    
                         for (int i=0; i<issueFcd.getIssuesAssignee(g,request.getParameter("name")).size(); i++){%>
                        <tr>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueFcd.getIssuesAssignee(g,request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issueFcd.getIssuesAssignee(g,request.getParameter("name")).get(i).getDescription()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueFcd.getIssuesAssignee(g,request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issueFcd.getIssuesAssignee(g,request.getParameter("name")).get(i).getSummary()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueFcd.getIssuesAssignee(g,request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issueFcd.getIssuesAssignee(g,request.getParameter("name")).get(i).getDescription()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueFcd.getIssuesAssignee(g,request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issueFcd.getIssuesAssignee(g,request.getParameter("name")).get(i).getCreationDate()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueFcd.getIssuesAssignee(g,request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issueFcd.getIssuesAssignee(g,request.getParameter("name")).get(i).getPriority()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueFcd.getIssuesAssignee(g,request.getParameter("name")).get(i).getId()%>&userid=<%=g%>"><%=issueFcd.getIssuesAssignee(g,request.getParameter("name")).get(i).getDueDate()%></a></td>

                        </tr> <%}%>
                    </tbody>
                    </table>
      <ul class="pagination pagination-lg pager" id="myPager5"></ul>
         </div>
                    
                    
                    
        <div id="link5" class="prodetail">
            <table class="table" style="margin-left: 100px; margin-top: 50px;">
                <thead> 
                    <tr>
                        <th  style="background-color: #407fbf; color: white;">Issue Description</th>
                        <th style="background-color: #407fbf; color: white;">Issue Name</th>
                        <th style="background-color: #407fbf; color: white;">Issue Type</th>
                        <th style="background-color: #407fbf; color: white;">Issue Creation Date</th>
                        <th style="background-color: #407fbf; color: white;">Issue Priority</th>
                        <th style="background-color: #407fbf; color: white;">Issue DueDate</th>
                    </tr>
                </thead> 
                <tbody id="myTable">
                <% 
                         List<Issue> issueList = issueFcd.getAllIssueByMe();
                         
                    for (int i=0; i<issueList.size(); i++){%>
                        <tr>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueList.get(i).getId()%>&userid=<%=g%>"><%=issueList.get(i).getDescription()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueList.get(i).getId()%>&userid=<%=g%>"><%=issueList.get(i).getSummary()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueList.get(i).getId()%>&userid=<%=g%>"><%=issueList.get(i).getDescription()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueList.get(i).getId()%>&userid=<%=g%>"><%=issueList.get(i).getCreationDate()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueList.get(i).getId()%>&userid=<%=g%>"><%=issueList.get(i).getPriority()%></a></td>
                            <td><a href="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=issueList.get(i).getId()%>&userid=<%=g%>"><%=issueList.get(i).getDueDate()%></a></td>
                        </tr> 
                        
                <%}%>
                    </tbody>
                    </table>
            <div class="col-md-12 text-center">
                <ul class="pagination pagination-lg pager" id="myPager"></ul>
            </div>
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
