<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html> 
    <head> 
        <title>SELECT Operation</title> 
    </head> 
    <body> 
        <jsp:useBean id="user"  class="UserManagement.User"></jsp:useBean>
        <table border="1" width="100%"> <tr>
                <th>Emp ID</th> </tr> 
            <c:forEach var="row" items="${user.items}">
                <tr> <td style="height: 100px;">
                        <c:out value="${row}"/></td> 
        </tr>
                </c:forEach> </table> 
    </body> 
</html>