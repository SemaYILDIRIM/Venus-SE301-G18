
<%@page import="UserManagement.User"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<jsp:useBean id="issueresolve"  class="proman.ProjectManagementFacade"></jsp:useBean>
<jsp:useBean id="changestatus"  class="IssueManagement.IssueManagementFacade"></jsp:useBean>
     <jsp:useBean id="userissue"  class="UserManagement.User" scope="session"></jsp:useBean>
        <% String status="";
                if(request.getParameter("Submit")==null){}
                else{
                    if(request.getParameter("Submit").equals("Resolved")){
                        status="Resolved";
                    }
                    else if(request.getParameter("Submit").equals("Reopen")){
                        status="Reopen";
                    }
                    }
            HttpSession session1= request.getSession();
            String g=""+session1.getAttribute("id");
            List<User> userlist;
            String role=userissue.getUser(g).getRole();
            //issueresolve.getlistofUser(userissue.getUser(g).getRole()+"",Integer.parseInt(g));
            List<proman.Projectuser> l=issueresolve.getProjectUser(Integer.parseInt(request.getParameter("name")));
            if(status.equals("Resolved")){
                    if(role.contains("manager")||role.contains("developer")){
                        for(int ii=0;ii<l.size();ii++){
                        String x=l.get(ii).getUser().getId()+"";
                        if(userissue.getUser(x).getRole().contains("tester")){
                            issueresolve.getUserlist().add(userissue.getUser(x));
                        }
                    }
                }

                    else if(userissue.getUser(g).getRole().contains("tester")){
                        User manager=issueresolve.getProjectDetail(request.getParameter("name")).getUser();
                        issueresolve.getUserlist().add(userissue.getUser(manager.getId()+""));
                           // /issueresolve.getUserlist().add(userissue.getUser(manager.getId()+""));
                      }
            }
   else{
       for(int ii=0;ii<l.size();ii++){
               String x=l.get(ii).getUser().getId()+"";
             if(userissue.getUser(x).getRole().contains("developer")){
                   issueresolve.getUserlist().add(userissue.getUser(x));
             }
         }
   }
        %>


    
<div class="form1">
        <div class="login">
            <form method = "post" action = "changeStatus.jsp?name=<%=request.getParameter("name")%>&issueid=<%=request.getParameter("issueid")%>&userid=<%=request.getParameter("userid")%>" onsubmit="return validateForm()">
                                                <p class="n"><h3>Select Staff</h3></p>
                                                <p class="n">Status:</p>
                                                <input class="imgp" type = "text" name = "istatus" id="istatus" value="<%=status%>" placeholder="Project Name" readonly=""/>
                                                   <br>
                                                <p class="na">Developers</p>
                                                <select name="dev">
                                                    <c:forEach items="${issueresolve.userlist}" var="element"> 
                                                       <option value="${element.id}">${element.name}</option> 

                                                   </c:forEach>
                                                        
                                                </select>
                                                       
                                                <br><br><br>
                                                <input class="btn" type = "submit" name = "Submit"
                                                value = "Send" />
                                        </form>
        </div></div>
                                                   
                                                   <% 
   if(request.getParameter("Submit")==null){}
            else{
        if(request.getParameter("Submit").equals("Send")){
            changestatus.changestatus("Open", Integer.parseInt(request.getParameter("issueid")));
            changestatus.IssueAssigneeStatus(Integer.parseInt(request.getParameter("issueid")),Integer.parseInt(request.getParameter("dev")));             
        }
        
                }
         %>
  