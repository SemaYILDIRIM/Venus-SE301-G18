
 <%@page import="common.VenusSession"%>
<jsp:useBean id="user"  class="UserManagement.User"></jsp:useBean>
        

            <% 
                HttpSession s= request.getSession(true);
                String checkpass=s.getAttribute("id").toString();
                out.print(request.getParameter("currentemail"));
                String currentemail=request.getParameter("currentemail");
                if(user.getUserEmail(Integer.parseInt(checkpass)).equals(currentemail)){
                    
               
                
                if(user.changeEmail(request.getParameter("currentemail"),request.getParameter("newemail"))){
                
                    String redirectURL = "/Venus-G18/logout.jsp";
                    response.sendRedirect(redirectURL);
                }else{
                     s.setAttribute("session", "not");
                     user.setSessionl(s);
            %>
             <%@ include file="login.jsp"%>
            
            <%}
                %>
            <script type="text/javascript">
$(document).ready(function(){    
    $("#loginfail").text("Email is not Valid");
  });
</script>
  
    
   