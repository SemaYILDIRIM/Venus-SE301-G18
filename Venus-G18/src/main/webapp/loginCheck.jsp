
        <%@page import="common.VenusSession"%>
<jsp:useBean id="user"  class="UserManagement.User"></jsp:useBean>
        

            <% 
                
                UserManagement.User loginUser = user.login(request.getParameter("email"),request.getParameter("password"));
                HttpSession s= request.getSession(true);
                 if(loginUser != null){
                    s.setAttribute("session", "valid");
                    s.setAttribute("email", loginUser.getEmail());
                    s.setAttribute("password", loginUser.getPassword());
                    s.setAttribute("role", loginUser.getRole());
                    
                    VenusSession.getSession().setUser(loginUser);
                    
                    String redirectURL = "/Venus-G18/Home.jsp";
                    response.sendRedirect(redirectURL);
                 }
                 else{
                     s.setAttribute("session", "not");
                     user.setSessionl(s);
            %>
             <%@ include file="login.jsp"%>
            
            <%}%>
            <script type="text/javascript">
$(document).ready(function(){    
    $("#loginfail").text("Email Or Password is not Valid");
  });
</script>
  
    
   