<jsp:useBean id="user"  class="UserManagement.User"></jsp:useBean>
<%              HttpSession s= request.getSession();
                String ss="sema";
                ss=request.getParameter("submit");
                s.setAttribute("session", "not");
                user.setSessionl(s);
                String redirectURL = "/Venus-G18/login.jsp";
                response.sendRedirect(redirectURL);

%>