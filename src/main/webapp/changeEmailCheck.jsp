
 <%@page import="common.VenusSession"%>
<jsp:useBean id="user"  class="UserManagement.UserManagementFacade"></jsp:useBean>
        

            <% 
                HttpSession s= request.getSession(true);
                int userId=VenusSession.getSession().getUser().getId();
                String currentemail=request.getParameter("currentemail");
                String newemail=request.getParameter("newemail");
                
                String email = user.getUserEmail(userId);
                        
                if(!email.equals(currentemail)){
                    String redirectURL = "ChangeEmail.jsp";
                    response.sendRedirect(redirectURL);
                    return;
                }
                
                if(user.changeEmail(currentemail,newemail)){
                
                    String redirectURL = "logout.jsp";
                    response.sendRedirect(redirectURL);
                }else{
                     String redirectURL = "ChangeEmail.jsp";
                    response.sendRedirect(redirectURL);
                     
            %>
             <%@ include file="login.jsp"%>
            
            <%}
                %>
            <script type="text/javascript">
$(document).ready(function(){    
    $("#loginfail").text("Email is not Valid");
  });
</script>
  
    
   