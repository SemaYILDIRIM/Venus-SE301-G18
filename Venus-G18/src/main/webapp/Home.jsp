
<%@ include file="header.jsp"%>
<jsp:useBean id="project"  class="proman.Project"></jsp:useBean>
<%@ include file="leftmenu.html"%>
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
    
for (int i=0; i<project.getProjects(ss).size(); i++){%>
<tr>
    <td><%=((Project)project.getProjects(ss).get(i)).getDiscription()%></td>
    <td><%=((Project)project.getProjects(ss).get(i)).getName()%></td>
    <td><%=((Project)project.getProjects(ss).get(i)).getType()%></td>
    <td><%=((Project)project.getProjects(ss).get(i)).getCreationDate()%></td>
    <td><%=((Project)project.getProjects(ss).get(i)).getPriority()%></td>
    <td><%=((Project)project.getProjects(ss).get(i)).getDueDate()%></td>
    
</tr>
        <%}%>
    
</table>
        
    