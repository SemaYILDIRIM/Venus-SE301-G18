<jsp:useBean id="user"  class="UserManagement.User"></jsp:useBean>
<%              HttpSession s= request.getSession();
                String ss="sema";
                ss=request.getParameter("submit");
                s.setAttribute("session", "not");
                String redirectURL = "/A-Venus/login.jsp";
                response.sendRedirect(redirectURL);

%>