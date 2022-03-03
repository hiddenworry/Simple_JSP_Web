<%-- 
    Document   : vewImage
    Created on : Mar 3, 2022, 4:29:57 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View image page</title>
    </head>
    <body>
        <%
            String url = request.getParameter("imgUrl");
            if (url == null){
                url = "";
            }
        %>
        <img src="<%=url%>" alt="The link is not avalable now!!!" style="height: 25%;width: 25%; text-align: center;"/>
    </body>
</html>
