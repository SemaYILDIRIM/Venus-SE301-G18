<%@ include file="header.jsp"%>
<%@page contentType="text/html" %>
<%@page import="IssueManagement.IssueManagementFacade"%>
<%@page import="proman.Project"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:useBean id="user1" class="UserManagement.UserManagementFacade"></jsp:useBean>


<div class="ss">
    <div class="project">
        <form class="profileform"  method = "post" action = "Home.jsp" onsubmit="return validateForm()">
                 <p class="n"><h3>Profile</h3></p>
    <%User loggedUser = VenusSession.getSession().getUser();
    
    %>
     
    
    <div id="navv">
        FirstName: 
               ${user1.loggedUser.name}<br><br>
           Surname: 
           
           ${user1.loggedUser.surname}<br><br>
           E-mail:         
                
           <a href="ChangeEmail.jsp">${user1.loggedUser.email}</a><p></p>
           Password:
           <a href="ChangePassword.jsp">Change Password</a><p></p>
           
           Role of Staff:
           ${user1.loggedUser.role}<br><br>
           
          
    </div>  
    
                                                     
    
          </form>
</div>
  

</div>