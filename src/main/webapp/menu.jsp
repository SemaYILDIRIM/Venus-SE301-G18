<%@page import="proman.Project"%>
<jsp:useBean id="projects2"  class="proman.ProjectManagementFacade"></jsp:useBean>
<jsp:useBean id="user4"  class="UserManagement.User" scope="session"></jsp:useBean>
<jsp:useBean id="project1"  class="proman.Project"></jsp:useBean>
<% HttpSession session1= request.getSession();
   String g=""+session1.getAttribute("id");
   if(user4.getUser(g).getRole().contains("manager")){
%>

<ul>
    <li style="width: 145px;"><input type="submit" formaction="Home.jsp" style="width: 145px; margin-top:-1px;" class="loginbuttons" value="Show All Projects" name="showAllProject" ></li>
    <li style="width: 101px;" class="loginbuttons"><a href="createProject.jsp">Create Project</a></li>
</ul>

        <%}
            else{
             HttpSession sx= request.getSession();
             String sd=""+sx.getAttribute("email");
             int ss=user4.getId(sd);
        %>
        <ul><li class="loginbuttons" >
            <%
            for (int i=0; i<projects2.getProjectProject(ss).size(); i++){
            String u=projects2.getProjectProject(ss).get(i).getProject().getId()+"";
            %>
            <%=projects2.getProjectDetail(u).getName()%>
                <br><br>
            <%}%>
        <input class="loginbuttons" style="width: 142px; margin-left: -19px; margin-top: 10px;" type="submit" formaction="Home.jsp"  value="Show All Projects" name="showAllProject" ></li>
        </ul>
<%}%>