<%@page import="IssueManagement.Issue"%>
<div class="aa">
            <div id="openModal" class="modalbg">
                <div class="dialog">
                    <a href="#close" title="Close" class="close">X</a>
                    <div class="amainn">
                        <ul class="modlul" id="modlul">
                            <li class="block">
                                <div class="form12">
                                <div class="project">
                                        <form id="" method = "post" action = "Home.jsp" onsubmit="return validateForm()">
                                                <p class="n"><h3>Create Issue</h3></p>
                                                <p id="Creation fail"></p>
                                                <p class="n">Issue Subject</p>
                                                    <input class="imgp" type = "text" name = "issueSubject" placeholder="Issue Subject" required=""/>
                                                    <img class="imgp" id="img" src="https://dialectline.files.wordpress.com/2013/06/sign-error-icon.png" alt="Mountain View" style="width: 15px; height: 15px; visibility: hidden">
                                                        <br>
                                                <p id="pp" style="font-size: 11px; color: crimson"></p>
                                                <p class="na">Issue Description</p>
                                                    <input class="imgp" type = "text" name = "dsc" placeholder="Description" required=""/>
                                                        <br>
                                                        <br>
                                                <p class="na">Issue Type</p>
                                                    <select>
                                                        <option value="volvo">Type1</option>
                                                        <option value="saab">Type2</option>
                                                        <option value="mercedes">Type3</option>
                                                        <option value="audi">Type4</option>
                                                    </select>
                                                        <br>
                                                        <br>
                                                <br><br><br>
                                                <input class="btn" type = "submit" name = "Submit"
                                                value = "Create" />
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
                                Issue p= new Issue();
                                p.setDescription(request.getParameter("dsc"));
                                p.setSummary(request.getParameter("issueSubject"));                              
                                p.saveIssue();
    }}
            
             
            %>