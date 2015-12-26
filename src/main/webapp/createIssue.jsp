<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="common.VenusSession"%>
<%@page import="UserManagement.User"%>
<%@page import="IssueManagement.Issue"%>
<%@page import="proman.Project"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:useBean id="project" class="proman.ProjectManagementFacade"></jsp:useBean>
<jsp:useBean id="issue" class="IssueManagement.IssueManagementFacade"></jsp:useBean>
<jsp:useBean id="userFcd"  class="UserManagement.UserManagementFacade"></jsp:useBean>
<script type="text/javascript">

   function changeFunc() {
    var selectBox = document.getElementById("projectListId");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    window.location="Home.jsp?projectId="+selectedValue+"#openIssueModal";
    
   }

  </script>


<div class="aa">
     <% 
             String pId = request.getParameter("projectId");
             
             if(pId != null){
                 List<User> userList = userFcd.getUserByProject(Integer.parseInt(pId));
                 request.setAttribute("userList", userList);
                 request.setAttribute("selectedProjectId", pId);
             }
                   
             %>
             
            <div id="openIssueModal" class="modalbg">
                <div class="dialog">
                    <a href="#close" title="Close" class="close">X</a>
                    <div class="amainn">
                        
                            <li class="block">
                                <div class="form12">
                                <div class="project">
                                        <form  method = "post" action = "Home.jsp" onsubmit="return validateForm()">
                                                <p class="n"><h3>Create Issue</h3></p>
                                       
                                            Project:
                                            <br>
                                                    <select id="projectListId" name="projectListId" onchange=onchange"changeFunc();">
                                                            <c:forEach var="option" items="${project.allProjects}">
                                                                <option value="${option.id}" ${option.id == selectedProjectId ? 'selected="selected"' : ''}><c:out value="${option.name}" /></option>
                                                            </c:forEach>
                                                        </select><br> <br>   
                                                   Issue Type:<br> 
                                                    <select id="issueTypeListId" name="issueTypeListId">
                                                            <c:forEach var="option" items="${issue.allIssueTypes}">
                                                                <option value="${option}"><c:out value="${option}" /></option>
                                                            </c:forEach>
                                                        </select>   <br> <br>
                                                   Summary:<br>
                                                   
                                                        <input class="im" type = "text" name = "summary" maxlength="1000" placeholder="Summary" required=""/>
                                                   <br><br>
                                                Priority:<br>
                                                    
                                                        <select id="priorityTypeListId" name="priorityTypeListId">
                                                            <c:forEach var="option" items="${issue.allPriorityTypes}">
                                                                <option value="${option.key}"><c:out value="${option.value}" /></option>
                                                            </c:forEach>
                                                        </select><br> <br>
                                                   Assignee:<br>
                                                        <select id="userListId" name="userListId">
                                                            <c:forEach var="option" items="${userList}">
                                                                <option value="${option.id}"><c:out value="${option.name}" /></option>
                                                            </c:forEach>
                                                        </select><br> <br>
                                                    DueDate:<br>
                                                        <input type="date" name="dday"> <br> <br>
                                                    Issue Description:<br>
                                                    <input class="imgp2" type = "textarea" name = "dsc" cols="40" rows="10" maxlength="1000" placeholder="Description" required=""/>
                                                   <br>
                                                        <input class="btn" type = "submit" name = "Submit" value = "Create" />
                                                    
                                                        <input class="btn" type = "reset" name = "reset" value = "Cancel" />
                                                   
                                        </form>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div> 
    
<%  
            if(request.getParameter("Submit")==null){}
            else{
                            if(request.getParameter("Submit").equals("Create")){                            
                                
                                String projectId = request.getParameter("projectListId");
                                String issueType = request.getParameter("issueTypeListId");
                                String priority = request.getParameter("priorityTypeListId");
                                String selectedUserId = request.getParameter("userListId");
                                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                                
                                Issue p= new Issue();
                                if(!request.getParameter("dday").equals("")){
                                    Date date = formatter.parse(request.getParameter("dday"));
                                p.setDueDate(date);
                                }
                                p.setDescription(request.getParameter("dsc"));
                                p.setStatus("Open");
                                p.setUserByCreatoruserId(VenusSession.getSession().getUser());
                                p.setSummary(request.getParameter("summary"));  
                                p.setType(issueType);
                                p.setPriority(Integer.parseInt(priority));
                                p.setProject(project.findById(Integer.parseInt(projectId)));
                                p.setUserByAssignee(userFcd.findById(Integer.parseInt(selectedUserId)));
                                
                                p.saveIssue();
                                out.print("Issue is Saved");
    }}
            
             
            %>