
<%@ include file="header.jsp"%>
<jsp:useBean id="project2"  class="proman.Project"></jsp:useBean>
<%@ include file="leftmenu.html"%>
<%@ include file="ProjectMaangement/ProjectOption.jsp"%>
<% if(request.getParameter("showAllProject")==null){
                    out.print("-------------------");
                }
                        else{
                            if(request.getParameter("showAllProject").contains("Show All Projects")){
                               %>
<table class="table" style="margin-left: 100px; margin-top: 50px;">
    <tr>
    <th  style="background-color: #407fbf; color: white;">Project Discription</th>
    <th style="background-color: #407fbf; color: white;">Project Name</th>
    <th style="background-color: #407fbf; color: white;">Project Type</th>
    <th style="background-color: #407fbf; color: white;">Project Creation Date</th>
    <th style="background-color: #407fbf; color: white;">Project Priority</th>
    <th style="background-color: #407fbf; color: white;">Project DueDate</th>
  </tr>
    <% HttpSession sx= request.getSession();
    String sd=""+sx.getAttribute("email");
    int ss=user.getId(sd);
    
for (int i=0; i<project2.getProjects(ss).size(); i++){%>
<tr>
    <td><a href="Projects.jsp?name=<%=((Project)project2.getProjects(ss).get(i)).getId()%>"><%=((Project)project2.getProjects(ss).get(i)).getDiscription()%></a></td>
    <td><a href="Projects.jsp?name=<%=((Project)project2.getProjects(ss).get(i)).getId()%>"><%=((Project)project2.getProjects(ss).get(i)).getName()%></a></td>
    <td><a href="Projects.jsp?name=<%=((Project)project2.getProjects(ss).get(i)).getId()%>"><%=((Project)project2.getProjects(ss).get(i)).getType()%></a></td>
    <td><a href="Projects.jsp?name=<%=((Project)project2.getProjects(ss).get(i)).getId()%>"><%=((Project)project2.getProjects(ss).get(i)).getCreationDate()%></a></td>
    <td><a href="Projects.jsp?name=<%=((Project)project2.getProjects(ss).get(i)).getId()%>"><%=((Project)project2.getProjects(ss).get(i)).getPriority()%></a></td>
    <td><a href="Projects.jsp?name=<%=((Project)project2.getProjects(ss).get(i)).getId()%>"><%=((Project)project2.getProjects(ss).get(i)).getDueDate()%></a></td>
    
</tr>
        <%}%>
    
</table>

<%
                            }
                            else{out.print("developerprojects");
                            }
}%>

        
    