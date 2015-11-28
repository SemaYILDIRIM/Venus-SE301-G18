
<%@page import="proman.Project"%>
<jsp:useBean id="user4"  class="UserManagement.User" scope="session"></jsp:useBean>
    <jsp:useBean id="project1"  class="proman.Project"></jsp:useBean>
<%
    HttpSession session1= request.getSession();
   String g=""+session1.getAttribute("id");
   if(user4.getUserRole(g).contains("manager")){

%>
<ul>
    <li style="width: 100px;"><input type="submit" formaction="Home.jsp" style="width: 145px;" class="loginbuttons" value="Show All Projects" name="showAllProject" ></li>
    <li style="width: 100px;" class="loginbuttons" style="width: 100px;"><a href="#openModal">Create Project</a></li>
</ul>
<%}else{
HttpSession sx= request.getSession();
    String sd=""+sx.getAttribute("email");
    int ss=user4.getId(sd);
    %><ul><li class="loginbuttons" >
    <%
for (int i=0; i<project1.getProjects(ss).size(); i++){
%>
<%=((Project)project1.getProjects(ss).get(i)).getDiscription()%>


<%}%>
<input class="loginbuttons" style="width: 142px; margin-left: -19px; margin-top: 10px;" type="submit" formaction="Home.jsp"  value="Show All Projects" name="showAllProject" ></li>
  </ul>
<%}%>