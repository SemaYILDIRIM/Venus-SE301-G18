<%@page import="common.VenusSession"%>
<jsp:useBean id="ciuser"  class="UserManagement.UserManagementFacade"></jsp:useBean>
        <jsp:useBean id="user"  class="UserManagement.User"></jsp:useBean>
        

            <%  user.login(request.getParameter("email"),request.getParameter("password"));
                user.setEmail(request.getParameter("email"));
                HttpSession s= request.getSession(true);
                if(user.getList().size()>0){
                   s.setAttribute("session", "valid");
                   s.setAttribute("email", request.getParameter("email"));
                   s.setAttribute("password", request.getParameter("password"));
                   s.setAttribute("id", user.getId(request.getParameter("email")));
                   UserManagement.User loginUser = ciuser.login(request.getParameter("email"),request.getParameter("password"));
                   VenusSession.getSession().setUser(loginUser);
                    if(user.getUser(""+s.getAttribute("id")).getRole().contains("admin")){
                    String redirectURL = "admin.jsp";
                    response.sendRedirect(redirectURL);
                    
                }else{
                   String redirectURL = "/A-Venus/Home.jsp";
                   response.sendRedirect(redirectURL);
                    }
                }
                else{
                    s.setAttribute("session", "not");
            %>
             <%@ include file="login.jsp"%>
            <%}%>
            <script type="text/javascript">
$(document).ready(function(){    
    $("#loginfail").text("Email Or Password is not Valid");
  });
</script>
  
    
   