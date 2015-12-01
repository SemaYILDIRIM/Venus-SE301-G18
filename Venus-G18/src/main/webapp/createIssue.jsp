<%@page import="IssueManagement.Issue"%>
<%@page import="proman.Project"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:useBean id="project" class="proman.Project"></jsp:useBean>
<jsp:useBean id="issue" class="IssueManagement.Issue"></jsp:useBean>
<jsp:useBean id="user"  class="UserManagement.User"></jsp:useBean>
<div class="aa">
            <div id="openIssueModal" class="modalbg">
                <div class="dialog">
                    <a href="#close" title="Close" class="close">X</a>
                    <div class="amainn">
                        
                            <li class="block">
                                <div class="form12">
                                <div class="project">
                                        <form  method = "post" action = "Home.jsp" onsubmit="return validateForm()">
                                                <p class="n"><h3>Create Issue</h3></p>
                                        <link href="site.css" rel="stylesheet">
                                            
                                            <table>
                                                <tr>
                                                    <td>Project:</td>
                                                    <td><select id="projectListId">
                                                            <c:forEach var="option" items="${project.allProjects}">
                                                                <option><c:out value="${option.name}" /></option>
                                                            </c:forEach>
                                                        </select>   
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Issue Type:</td>
                                                    <td><select id="issueTypeListId">
                                                            <c:forEach var="option" items="${issue.allIssueTypes}">
                                                                <option><c:out value="${option}" /></option>
                                                            </c:forEach>
                                                        </select>   
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Summary:</td>
                                                    <td>
                                                        <input class="imgp" type = "text" name = "dsc" placeholder="Summary" required=""/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Priority:</td>
                                                    <td>
                                                        <select id="AllPriorityTypeListId">
                                                            <c:forEach var="option" items="${issue.allPriorityTypes}">
                                                                <option><c:out value="${option}" /></option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Assignee:</td>
                                                    <td>
                                                        <select id="AllUserId">
                                                            <c:forEach var="option" items="${user.allUser}">
                                                                <option><c:out value="${option.name}" /></option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>DueDate:</td>
                                                    <td>
                                                        <input type="date" name="dday">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Issue Description:</td>
                                                    <td>
                                                        <input class="imgp" type = "textarea" name = "dsc" cols="40" rows="10" placeholder="Description" required=""/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <input class="btn" type = "submit" name = "Submit" value = "Create" />
                                                    </td>
                                                    <td>
                                                        <input class="btn" type = "reset" name = "reset" value = "Cancel" />
                                                    </td>
                                                </tr>
                                                
                                            </table>
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
                               //Date date = new Date();
                                Issue p= new Issue();
                                p.setDescription(request.getParameter("dsc"));
                                p.setSummary(request.getParameter("issueSubject"));                              
                                p.saveIssue();
    }}
            
             
            %>