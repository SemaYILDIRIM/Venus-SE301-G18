<%-- 
    Document   : newjsp
    Created on : Dec 4, 2015, 7:27:31 PM
    Author     : LinkTera
--%>

<%@page import="IssueManagement.Attachment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form action="newjsp.jsp">
  Select a file: <input type="file" name="img">
  <input type="submit" name="Submit" value="Deneme">
  <%Attachment a=new Attachment();
  if(request.getParameter("Submit")==null){ out.print("null");}
            else{
                if(request.getParameter("Submit").equals("Deneme")){
               a.setUploadedFile(request.getPart("img"));
               out.print("Done");
                }}
  
  %>
</form>
    </body>
</html>
