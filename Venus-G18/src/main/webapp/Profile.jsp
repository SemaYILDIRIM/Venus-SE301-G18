<%@ include file="header.jsp"%>
<%@page contentType="text/html" %>
<%@page import="IssueManagement.Issue"%>
<%@page import="proman.Project"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:useBean id="user1" class="UserManagement.User"></jsp:useBean>


<div class="ss">
    <div class="project">
          <form id="" method = "post" action = "Home.jsp" onsubmit="return validateForm()">
                 <p class="n"><h3>Profile</h3></p>
    <%User loggedUser = VenusSession.getSession().getUser();
    
    %>
     
    
    <div id="navv">
        <table>
            <tr>
                
                <td>FirstName:</td> 
                <td>${user1.loggedUser.name}</td> 
            </tr>
            <tr>
                
                <td>Surname:</td> 
                <td>${user1.loggedUser.surname}</td> 
            </tr>
            <tr>
                <td>E-mail:</td> 
                <td><p><a href="/Venus-G18/ChangeEmail.jsp">${user1.loggedUser.email}</a></p></td> 
            </tr>
            
            <tr>
                <td>Password:</td> 
                <td><p><a href="/Venus-G18/ChangePassword.jsp">Change Password</a></p></td> 
            </tr>
           
            <tr>
                <td>Role of Staff:</td> 
                <td>${user1.loggedUser.role}</td> 
            </tr>
         </table>
          
    </div>  
    
                                                     
    
    
</div>
  

</div>