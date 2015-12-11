
        <%@page import="common.VenusSession"%>
<jsp:useBean id="user"  class="UserManagement.User"></jsp:useBean>
        

            <% 
                
                
               UserManagement.User loginUser = user.login(request.getParameter("email"),request.getParameter("password"));
                HttpSession s= request.getSession(true);
                String checkpassemail=s.getAttribute("email").toString();
                out.print(request.getParameter("currentpassword"));
                String currentpassword=request.getParameter("currentpassword");
                if(user.getUserPassword(checkpassemail).equals(currentpassword)){
                    
                
                if(user.changePassword(request.getParameter("currentpassword"),request.getParameter("newpassword"))){
                   
                    //if(user.getUserPassword(s.getAttribute("email").toString().equals(currentpassword))
                    String redirectURL = "/Venus-G18/logout.jsp";
                    response.sendRedirect(redirectURL);
                }else{
                     s.setAttribute("session", "not");
                     user.setSessionl(s);
            %>
             <%@ include file="login.jsp"%>
            
            <%}}else{
                    out.println("Current password is not match");
                }
                %>
            <script type="text/javascript">
$(document).ready(function(){    
    $("#loginfail").text("Password is not Valid");
  });
</script>
  
    
   