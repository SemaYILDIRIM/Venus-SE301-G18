<%@page import="UserManagement.User"%>
<%@page contentType="text/html" %>
<html>
    <head>
        <title>VenuS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="header.css">
        <link rel="stylesheet" href="menu.css">
        <link rel="stylesheet" href="ProjectMaangement/ProjectManagement.css">
        <link rel="stylesheet" href="ProjectMaangement/projectDetail.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    </head>
    <body>
        
        <jsp:useBean id="user"  class="UserManagement.User" scope="session"></jsp:useBean>
        <%@page import="proman.Project"%> 
        <%@page import="java.util.Date"%>
        <% //response.setIntHeader("Refresh", 25);
        HttpSession s= request.getSession();
        
            if(s.getAttribute("session")=="valid") {%>
                <div class="header">
                    <img class="img" src="http://icons.iconarchive.com/icons/zairaam/bumpy-planets/256/09-uranus-icon.png" alt="Mountain View">
                    <div><form action="Home.jsp" method="post">  
                            <ul class="menu">
                            <li class="menuli"><a href="Home.jsp">Home</a></li>
                            <li class="menuli" onmouseout="hide2()" onmouseover="show2()">Projects
                                <div class="profile2"  >
                                <div id="profileoption2"  style="visibility: hidden;">
                            
                             <%@ include file="menu.jsp"%>
                        </div>
                    </div></li>
                            <li class="menuli"><a href="#">Issue</a></li>
                            <li class="menuli"><a href="#openModal2">Create Issue</a></li>
                            
                        </ul></form>
                    </div>
                    <div class="profile" onmouseout="hide()" onmouseover="show()" >
                        <img src="<%=user.getpicture(s.getAttribute("email").toString())%>" alt="">
                        <div id="profileoption"  style="visibility: hidden;">
                            
                            <form action="Home.jsp" method="post"> 
                                <input type="submit" class="loginbuttons" value="Profile" name="deneme" ><br></form>
                                <form action="logout.jsp" method="post"> 
                                <input type="submit" class="loginbuttons" value="Logout" name="submit" ></form>
                            
                        </div>
                    </div>
                </div>
                       
                       <%@ include file="createProject.jsp"%>
                <script>
function show() {
    document.getElementById("profileoption").style.visibility = "visible";
}

function hide() {
   document.getElementById("profileoption").style.visibility = "hidden";
}
function show2() {
    document.getElementById("profileoption2").style.visibility = "visible";
}

function hide2() {
   document.getElementById("profileoption2").style.visibility = "hidden";
}
</script>
        
         <%} else{
            String redirectURL = "/Venus-G18/login.jsp";
            response.sendRedirect(redirectURL);
        }
         
         %>
    
    <% if(request.getParameter("deneme")==null){
                   // out.print("-------------------");
                }
                        else{
                            if(request.getParameter("deneme").equals("Profile")){
                                //out.print("---if");
                            }
                            else{}
}%>