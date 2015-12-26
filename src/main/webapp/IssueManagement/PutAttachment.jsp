<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .thumb {
              height: 75px;
              border: 1px solid #000;
              margin: 10px 5px 0 0;
            }
        </style>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    </head>
    <body>
    <jsp:useBean id="attach"  class="IssueManagement.IssueManagementFacade"></jsp:useBean>
    <div style="float: left;">
<%
        String issueid2=request.getParameter("issueid");
        attach.getAttach(issueid2);
%>
          <table  class="table table-hover" style="width: 500px; margin-right: 60px;">
                <thead>
                        <th>Files</th>
                        <th>Delete</th>
                </thead>
                <tbody>
                        <c:forEach items="${attach.getAtch()}" var="element"> 
                            <tr>
                            <td><a href="${element.documentpath}"><img id="iii" src="${element.documentpath}" ></a></td>
                            <td> <form method="post" action="/A-Venus/Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=request.getParameter("issueid")%>&userid=<%=request.getParameter("userid")%>">
                               <input type="text" value="${element.id}" name="attachid" style="margin-top: -2500px; width: 0px; height: 0px;" >
                                    <input type="submit" value="Delete File" name="Submit" >
              
              </form></td>
                            </tr>
                        </c:forEach>
             </tbody>
        </table>
          <br><br>
        <form method="post" action="Issue.jsp?name=<%=request.getParameter("name")%>&issueid=<%=request.getParameter("issueid")%>&userid=<%=request.getParameter("userid")%>">  
                <input type="file" id="files" name="files[]" />
                <output id="list"></output>
                <input type="submit" name="Submit" value="Save">
                <input type="text" value="" id="d" name="d" style="margin-top: -2500px; width: 0px; height: 0px;">
        </form>
<script>
        function handleFileSelect(evt) {
          var files = evt.target.files;
          for (var i = 0, f; f = files[i]; i++) {
            if (!f.type.match('image.*')) {
              continue;
            }

            var reader = new FileReader();
            reader.onload = (function(theFile) {
              return function(e) {
                  document.getElementById("d").value=e.target.result;
              };
            })(f);
            reader.readAsDataURL(f);
          }
        }

        document.getElementById('files').addEventListener('change', handleFileSelect, false);
</script>

<%
        BufferedImage image = null;
        String src="";
        if(request.getParameter("Submit")==null){}
                    else{
                        if(request.getParameter("Submit").equals("Save")){

                            src=request.getParameter("d");
                        String iud=request.getParameter("issueid");
                        attach.saveattach(src,iud);
                        }
                        else if(request.getParameter("Submit").equals("Delete File")){
                                attach.deleteAttach(request.getParameter("attachid")+"",request.getParameter("issueid"));
                                
                            }
                        }
%>
      </div>
        </body>
</html>
