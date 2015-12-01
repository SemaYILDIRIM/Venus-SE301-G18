
<%@page import="UserManagement.User"%>
<%@page import="proman.Project"%> 
<%@page contentType="text/html" %>
<html>
    <head>
        <title>VenuS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="header.css">
        <link rel="stylesheet" href="menu.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    </head>
    <body>
        <%@ include file="createIssue.jsp"%> 
       <%@page import="proman.Project"%> 
       <%@page import="java.util.Date"%>
        <% response.setIntHeader("Refresh", 25);
        HttpSession s= request.getSession();
        
            if(s.getAttribute("session")=="valid") {%>
                <div class="header">
                    <img class="img" src="http://icons.iconarchive.com/icons/zairaam/bumpy-planets/256/09-uranus-icon.png" alt="Mountain View">
                    <div> <ul class="menu"><li><a href="#">Home</a></li>
                            <li><a href="#openModal">Projects</a></li>
                            <li><a href="#openModal">Issue</a></li>
                            <li><a href="#openIssueModal">Create Issue</a></li>
                        </ul></div>
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
</script>
        <%@ include file="leftmenu.html"%>
         <%} else{
            String redirectURL = "/Venus-G18/login.jsp";
            response.sendRedirect(redirectURL);
        }
         
         %>
         
   <select>
       <c:forEach var="item" items="${user.items}">
     <option>${item}</option>
    </c:forEach>
</select>
    <% if(request.getParameter("deneme")==null){
                    out.print("-------------------");
                }
                        else{
                            if(request.getParameter("deneme").equals("Profile")){
                                out.print("---if");
                            }
                            else{out.print("***else");}
}%>