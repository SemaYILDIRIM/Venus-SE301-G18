<%@page import="UserManagement.User"%>
<%@page import="UserManagement.User"%>
<%@page import="proman.Project"%>
<jsp:useBean id="projectt"  class="proman.Project" scope="session">
   <jsp:setProperty name="projectt" property="name"
                    param="proname" />
   <jsp:setProperty name="projectt" property="discription" 
                    param="dsc" />
   <jsp:setProperty name="projectt" property="type" 
                    value="dsfgds"  />
</jsp:useBean>
<div class="aa">
            <div id="openModal" class="modalbg">
                <div class="dialog">
                    <a href="#close" title="Close" class="close">X</a>
                    <div class="amainn">
                        <ul class="modlul" id="modlul">
                            <li class="block">
                                <div class="form12">
                                <div class="project">
                                        <form method = "post" action = "Home.jsp" onsubmit="return validateForm()">
                                                <p class="n"><h3>Create Project</h3></p>
                                                <p id="Creationfail"></p>
                                                <p class="n">Project Name:</p>
                                                    <input class="imgp" type = "text" name = "proname" placeholder="Project Name" required=""/>
                                                    <img class="imgp" id="img" src="https://dialectline.files.wordpress.com/2013/06/sign-error-icon.png" alt="Mountain View" style="width: 15px; height: 15px; visibility: hidden">
                                                        <br>
                                                <p id="pp" style="font-size: 11px; color: crimson"></p>
                                                <p class="na">Project Description</p>
                                                    <input class="imgp" type = "text" name = "dsc" placeholder="Description" required=""/>
                                                        <br>
                                                        <br>
                                                <p class="na">Project Type</p>
                                                <select name="projectid">
                                                        <option value="volvo">Volvo</option>
                                                        <option value="saab">Type2</option>
                                                        <option value="mercedes">Type3</option>
                                                        <option value="audi">Type4</option>
                                                    </select>
                                                        <br>
                                                        <br>
                                                <p class="na">DueDate</p>
                                                 <input type="date" name="dday">
                                                <br><br><br>
                                                <input class="btn" type = "submit" name = "Submit"
                                                value = "Create" />
                                                <input class="btn2" type = "reset" value = "Reset" />
                                        </form>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div> 

<%  HttpSession ss= request.getSession();
            if(request.getParameter("Submit")==null){}
            else{
                            if(request.getParameter("Submit").equals("Create")){
                               //Date date = new Date();
                                Project p= new Project();
                                p.setDiscription(request.getParameter("dsc"));
                                User u=new User();
                                u.setId(u.getId(ss.getAttribute("email").toString()));
                                p.setUser(u);
                                p.setName(request.getParameter("proname"));
                                p.saveProject();
    }}
            
             
            %>