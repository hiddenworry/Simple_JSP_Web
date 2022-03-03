<%-- 
    Document   : error
    Created on : Feb 25, 2022, 3:41:52 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String error = request.getParameter("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%=error%>
    </body>
</html>
