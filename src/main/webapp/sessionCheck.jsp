<% HttpSession sv= request.getSession();
            if(sv.getAttribute("session")!="valid") {
                String redirectURL = "/Venus-G18/login.jsp";
                    response.sendRedirect(redirectURL);}%>