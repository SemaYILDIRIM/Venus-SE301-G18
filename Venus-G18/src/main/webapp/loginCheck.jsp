
        <jsp:useBean id="user"  class="DAO.User"></jsp:useBean>
        

            <% user.login(request.getParameter("email"),request.getParameter("password"));
            HttpSession s= request.getSession(true);
             if(user.getList().size()>0){
               
                s.setAttribute("session", "valid");
                s.setAttribute("email", request.getParameter("email"));
                s.setAttribute("password", request.getParameter("password"));
                user.setSessionl(s);
                String redirectURL = "/Venus-G18/header.jsp";
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
  
    
   