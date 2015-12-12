<jsp:useBean id="user3"  class="UserManagement.User" scope="session"></jsp:useBean>
<%
    HttpSession session1= request.getSession();
   String g=""+session1.getAttribute("id");
   if(user3.getUser(g).getRole().contains("manager")){

%>
<div class="pro" id="projectmain" style="visibility: hidden;" >
    <u id="projectmenu" style="visibility: hidden;">
        <li><a>Show All Projects</a></li>
        <li><a href="#openModal">Create Project</a></li>
    </u>
</div>

<script>

function showProjectMenu() {
    document.getElementById("projectmenu").style.visibility = "visible";
    document.getElementById("projectmain").style.visibility = "visible";
}

function hideProjectMenu() {
   document.getElementById("projectmenu").style.visibility = "hidden";
   document.getElementById("projectmain").style.visibility = "hidden";
}
</script>

<%}
    else if(user3.getUser(""+session1.getAttribute("id")).getRole().contains("admin")){
                    String redirectURL = "/A-Venus/admin.jsp";
                    response.sendRedirect(redirectURL);
                    
                }
   else{%>

developer

<%}%>