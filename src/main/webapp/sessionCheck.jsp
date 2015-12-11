<% HttpSession sv= request.getSession();
            if(sv.getAttribute("session")!="valid") {
                String redirectURL = "/A-Venus/login.jsp";
                    response.sendRedirect(redirectURL);}%>