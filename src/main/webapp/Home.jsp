<%@ include file="header.jsp"%>
<%@ include file="leftmenu.html"%>
<%@ include file="ProjectMaangement/ProjectOption.jsp"%>
        <% HttpSession sx= request.getSession();
           String sd=""+sx.getAttribute("email");
           int ss=user.getId(sd);
           
           if(request.getParameter("showAllProject")==null){
           %>
<div class="home">
    <h3>Welcome <%=user.getUser(g).getName()+" "+user.getUser(g).getSurname()%> !</h3>
    <h2>What do you want to do today?</h2>
    <br>
        <div class="pro1">
        <br>
        <p>YOU CAN CHECK YOUR PROJECTS</p>
    </div>
        <div class="pro1">
        <br>
        <p>YOU CAN CHECK YOUR ISSUES
    </div>
    <div class="pro1">
        <br>
        <p>YOU CAN CREATE A ISSUES
    </div>
</div>
       
<%
           }
          
           else{
              
           if(request.getParameter("showAllProject").contains("Show All Projects")){
                if(user.getUser(g).getRole().contains("manager")){ %>
                
                    <table class="table" style="margin-left: 50px; margin-top: 50px; width: 95%">
                        <thead> <tr>
                            <th  style="background-color: #407fbf; color: white;">Project Discription</th>
                            <th style="background-color: #407fbf; color: white;">Project Name</th>
                            <th style="background-color: #407fbf; color: white;">Project Type</th>
                            <th style="background-color: #407fbf; color: white;">Project Creation Date</th>
                            <th style="background-color: #407fbf; color: white;">Project DueDate</th>
                        </tr>
                        </thead> 
                        <tbody id="myTable">
                        <% 
    
                    for (int i=0; i<project2.getProjects(ss).size(); i++){%>
                        <tr>
                            <td><a href="Projects.jsp?name=<%=((Project)project2.getProjects(ss).get(i)).getId()%>&uid=0"><%=((Project)project2.getProjects(ss).get(i)).getDiscription()%></a></td>
                            <td><a href="Projects.jsp?name=<%=((Project)project2.getProjects(ss).get(i)).getId()%>&uid=0"><%=((Project)project2.getProjects(ss).get(i)).getName()%></a></td>
                            <td><a href="Projects.jsp?name=<%=((Project)project2.getProjects(ss).get(i)).getId()%>&uid=0"><%=((Project)project2.getProjects(ss).get(i)).getType()%></a></td>
                            <td><a href="Projects.jsp?name=<%=((Project)project2.getProjects(ss).get(i)).getId()%>&uid=0"><%=((Project)project2.getProjects(ss).get(i)).getCreationDate()%></a></td>
                            <td><a href="Projects.jsp?name=<%=((Project)project2.getProjects(ss).get(i)).getId()%>&uid=0"><%=((Project)project2.getProjects(ss).get(i)).getDueDate()%></a></td>

                        </tr> <%}%>
                        </tbody>
                    </table>
                        <div class="col-md-12 text-center">
      <ul class="pagination pagination-lg pager" id="myPager"></ul>
                        </div>
                    <% }
                
                else{%>
                            
                    <table class="table" style="margin-left: 50px; margin-top: 50px; width: 95%">
                        <tr>
                            <th style="background-color: #407fbf; color: white;">Project Discription</th>
                            <th style="background-color: #407fbf; color: white;">Project Name</th>
                            <th style="background-color: #407fbf; color: white;">Project Type</th>
                            <th style="background-color: #407fbf; color: white;">Project Creation Date</th>
                            <th style="background-color: #407fbf; color: white;">Project Priority</th>
                            <th style="background-color: #407fbf; color: white;">Project DueDate</th>
                        </tr>
                        <tbody id="myTable">
                                <%  for (int i=0; i<projects3.getProjectProject(ss).size(); i++){
                                    String u=projects3.getProjectProject(ss).get(i).getProject().getId()+"";
                                %>
                        <tr>
                            <td><a href="Projects.jsp?name=<%=projects3.getProjectDetail(u).getId()%>&uid=0"><%=projects3.getProjectDetail(u).getDiscription()%></a></td>
                            <td><a href="Projects.jsp?name=<%=projects3.getProjectDetail(u).getId()%>&uid=0"><%=projects3.getProjectDetail(u).getName()%></a></td>
                            <td><a href="Projects.jsp?name=<%=projects3.getProjectDetail(u).getId()%>&uid=0"><%=projects3.getProjectDetail(u).getType()%></a></td>
                            <td><a href="Projects.jsp?name=<%=projects3.getProjectDetail(u).getId()%>&uid=0"><%=projects3.getProjectDetail(u).getCreationDate()%></a></td>
                            <td><a href="Projects.jsp?name=<%=projects3.getProjectDetail(u).getId()%>&uid=0"><%=projects3.getProjectDetail(u).getPriority()%></a></td>
                            <td><a href="Projects.jsp?name=<%=projects3.getProjectDetail(u).getId()%>&uid=0"><%=projects3.getProjectDetail(u).getDueDate()%></a></td>

                        </tr>

                        <%} }}
           
           }
                         
                        %>
           </tbody>
</table>
 
  <div class="col-md-12 text-center">
      <ul class="pagination pagination-lg pager" id="myPager"></ul>
      </div>
