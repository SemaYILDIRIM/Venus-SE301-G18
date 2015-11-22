<%-- 
    Document   : header
    Created on : Nov 22, 2015, 8:13:11 PM
    Author     : LinkTera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="header.css">
        <link rel="stylesheet" href="menu.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    </head>
    <body>
       <jsp:useBean id="user"  class="DAO.User"></jsp:useBean>
        <%  HttpSession s= request.getSession();
        
            if(s.getAttribute("session")=="valid") {%>
                <div class="header">
                    <img class="img" src="http://icons.iconarchive.com/icons/zairaam/bumpy-planets/256/09-uranus-icon.png" alt="Mountain View">
                    <div> <ul class="menu"><li><a href="#">Home</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Issue</a></li>
                            <li><a href="#">Create Issue</a></li>
                        </ul></div>
                    <div class="profile" onmouseout="hide()" onmouseover="show()" >
                        <img src="<%=user.getpicture(s.getAttribute("email").toString())%>" alt="">
                        <div id="profileoption"  style="visibility: hidden;">
                            
                            <form action="logout.jsp" method="post"> 
                                <input type="button" class="loginbuttons" value="Profile" name="deneme" ><br>
                                <input type="submit" class="loginbuttons" value="Logout" name="submit" ></form>
                            
                        </div>
                    </div>
                </div>
                
            <%

//if(!user.checkvalid(s.getAttribute("session").toString())){
//out.println("-----L "+s);
//}
//else{
  // out.println("we");
//}

%>  
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