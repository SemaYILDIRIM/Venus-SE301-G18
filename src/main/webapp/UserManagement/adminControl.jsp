<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="UserManagement.User"%>
 <jsp:useBean id="userfacade2"  class="UserManagement.UserManagementFacade" scope="session"></jsp:useBean>

<div class="tab2">
    
         <ul class="promenu2">
             <a  href="#link1">
                 <br>
                 <li>
             Create Staff
             </li></a>
             <a  href="#link2">
                 <br><li>
              Delete Staff
             </li></a>
             <a  href="#link3">
                 <br>
                 <li>
              Edit Staff
             </li></a>
             
         </ul>
             
         <div id="link1" class="prodetail2">
          <form method = "post" action = "admin.jsp" style="margin-top: 20px; -moz-box-shadow: inset 0 0 15px #E8E8E8;-webkit-box-shadow: inset 0 0 15px #E8E8E8;box-shadow: inner 0 0 15px #E8E8E8;" onsubmit="return validateForm()">
              <br>
                <h3 style="margin-left: 20px; ">Create User</h3>
                <p id="Creationfail" style="margin-left: 20px;"></p>
                <p class="n" style="margin-left: 20px;">User Name:</p>
                <input class="imgp" type = "text" name = "uname" placeholder="User Name" required=""  style="margin-left: 20px;"/>
                <br>
                <p class="n" style="margin-left: 20px;">User Surname</p>
                <input class="imgp" style="margin-left: 20px;" type = "text" name = "usurname" placeholder="User Surname" required=""/>
                <img class="imgp"   id="img" src="https://dialectline.files.wordpress.com/2013/06/sign-error-icon.png" style=" margin-left: 20px; width: 15px; height: 15px; visibility: hidden">
                <br>
                <p class="n" style="margin-left: 20px;">User Email:</p>
                <input class="imgp"  style="margin-left: 20px;" type = "text" name = "uemail" placeholder="User Email" required=""/>
                <img class="imgp"  src="https://dialectline.files.wordpress.com/2013/06/sign-error-icon.png"  style="margin-left: 20px; width: 15px; height: 15px; visibility: hidden">
                <br>
                <p class="n" style="margin-left: 20px;">Password:</p>
                <input class="imgp" style="margin-left: 20px;" type = "text" name = "upassword" placeholder="Project Name" required=""/>
                <img class="imgp" id="img" src="https://dialectline.files.wordpress.com/2013/06/sign-error-icon.png" style="margin-left: 20px; width: 15px; height: 15px; visibility: hidden">
                <br>
                <p class="na" style="margin-left: 20px;">Role</p>
                <select name="urole" style="margin-left: 20px;" >
                        <option value="manager">Manager</option>
                        <option value="developer">Developer</option>
                        <option value="tester">Tester</option>
                        <option value="admin">Admin</option>
                </select>
                <br>
                <br><br><br>
                <input class="btn" style="margin-left: 20px;" type = "submit" name = "Submit"
                value = "Save" />
                <input class="btn2" type = "reset" value = "Reset" />
                </form>
         </div>
             
             
         <div id="link2" class="prodetail2">
           
             <form action="admin.jsp#link2" method="post">
                 <input name="search"/>
             <input type="submit" value="Search" /></form>
             
             <%
             String searchString = request.getParameter("search");
             String result="";
             List<UserManagement.User> searchResults=userfacade2.SearchStaff(searchString);
             if (searchString != null) {}
             if (searchResults.isEmpty()) {
                 result="No Result";
                 out.print(result);
                 result="";
             }
             if (!searchResults.isEmpty()) {
                 out.print(searchResults.get(0).getName());
                   %>
     <table class="table" style="margin-left: -140px; margin-top: 50px;">
    <tr>
    <th  style=" visibility: hidden; background-color: #407fbf; color: white;">id</th>
    <th  style="background-color: #407fbf; color: white;">User Name</th>
    <th style="background-color: #407fbf; color: white;">User Surname</th>
    <th style="background-color: #407fbf; color: white;">User Email</th>
    <th style="background-color: #407fbf; color: white;">Role</th>
    <th style="background-color: #407fbf; color: white;">Status</th>
    <th style="background-color: #407fbf; color: white;">Creation Date</th>
    <th style="background-color: #407fbf; color: white;">Delete</th>
  </tr>
    <% 
for (int i=0; i<searchResults.size(); i++){%>
<tr>
    <td style="visibility: hidden"><input type="text" name="uid" value="<%=searchResults.get(i).getId()%>"/></td>
    <td><a href=""><%=searchResults.get(i).getName()%></a></td>
    <td><a href=""><%=searchResults.get(i).getSurname()%></a></td>
    <td><a href=""><%=searchResults.get(i).getEmail()%></a></td>
    <td><a href=""><%=searchResults.get(i).getRole()%></a></td>
    <td><a href=""><%=searchResults.get(i).getStatus()%></a></td>
    <td><a href=""><%=searchResults.get(i).getCreationDate()%></a></td>
    <td>
        <form method = "post" action = "admin.jsp?uid=<%=searchResults.get(i).getId()%>" >  <input class="btn" type = "submit" name = "Submit" value = "Delete" /></form>
    </td>
</tr>
        <%}
searchString="";
        %>
    
</table><%}%>
         
         </div>
         <div id="link3" class="prodetail2">
         
             <form action="admin.jsp#link3" method="post">
                 <input name="Searchs"/>
             <input type="submit" value="Search" /></form>
             
             <%
             String editUser = request.getParameter("Searchs");
             String result2="";
             List<UserManagement.User> searchResults2=userfacade2.SearchStaff(editUser);
             if (editUser != null) {}
             if (searchResults2.isEmpty()) {
                 result2="No Result";
                 out.print(result2);
                 result2="";
             }
             if (!searchResults2.isEmpty()) {
                 out.print(searchResults2.get(0).getName());
                   %>
     <table class="table" style="margin-left: 100px; margin-top: 50px;">
    <tr>
    <th  style="background-color: #407fbf; color: white;">User Name</th>
    <th style="background-color: #407fbf; color: white;">User Surname</th>
    <th style="background-color: #407fbf; color: white;">Email</th>
    <th style="background-color: #407fbf; color: white;">Role</th>
    <th style="background-color: #407fbf; color: white;">Status</th>
    <th style="background-color: #407fbf; color: white;">Creation Date</th>
    
  </tr>
    <% 
for (int i=0; i<searchResults2.size(); i++){%>
<tr>
    <td><a href=""><%=searchResults2.get(i).getName()%></a></td>
    <td><a href=""><%=searchResults2.get(i).getSurname()%></a></td>
    <td><a href=""><%=searchResults2.get(i).getEmail()%></a></td>
    <td><a href=""><%=searchResults2.get(i).getRole()%></a></td>
    <td><a href=""><%=searchResults2.get(i).getStatus()%></a></td>
    <td><a href=""><%=searchResults2.get(i).getCreationDate()%></a></td>
</tr>
        <%}
editUser="";
        %>
    
</table><%}%>
          
         </div>
         
     </div>
<% 
            if(request.getParameter("Submit")==null){}
            else{
                if(request.getParameter("Submit").equals("Save")){
                   userfacade2.SaveUser(request.getParameter("uname"),request.getParameter("usurname"),request.getParameter("uemail"),request.getParameter("upassword"),request.getParameter("urole"));
                }
                else if(request.getParameter("Submit").equals("Delete")){
                    userfacade2.deleteUser(request.getParameter("uid"));
                }
            
            }
            
             
            %>