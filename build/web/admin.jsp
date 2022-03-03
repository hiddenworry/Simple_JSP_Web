<%-- 
    Document   : admin.jsp
    Created on : Feb 19, 2022, 10:09:09 AM
    Author     : ADMIN
--%>

<%@page import="product.ProductError"%>
<%@page import="product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <style>
            td, tr, th {
                text-align: center;
                border: solid 1px;
                padding: 1px;

            }
            

        </style>
    </head>
    <body>
        <% UserDTO admin = (UserDTO) session.getAttribute("USER");
            if (admin == null || !admin.isAdmin()) {
                response.sendRedirect("login.jsp");
                return;
            }
            String searchStr = request.getParameter("Search");
            if (searchStr == null) {
                searchStr = "";
            }
        %>
        <h1>Hello <%=admin.getFullName()%> </h1>

        <form action="MainController" method="POST">
            <input type="text" name="Search" value=<%=searchStr%>>
            <input type="submit" name="action" value="Search">   

        </form>
        <a href="MainController?action=LogOut">LogOut</a>    
        <button><a href="createProduct.jsp">Insert new Product</a></button>
        <% int count = 1;
            List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
            if (productList != null) {
                if (!productList.isEmpty()) {


        %>
        <table style="margin-top: 20px">
            <thead>

                <tr>
                    <th>Row</th>
                    <th>productID</th>
                    <th>productName</th>
                    <th>price</th>
                    <th>quantity</th>
                    <th>categoryID</th>
                    <th>importDate</th>
                    <th>usingDate</th>
                    <th>Image</th>

                </tr>


            </thead>
            <tbody>
                <%   for (ProductDTO product : productList) {

                %>
                <tr>
            <form action="MainController" method="POST" enctype="multipart/form-data">
           
                <td>
                    <input type="hidden" name="position" value="<%=count%>">

                    <%=count++%>

                </td>

                <td> <%=product.getProductID()%>
                    <input type="hidden" name="productID" value="<%=product.getProductID()%>">

                </td>
                <td> 
                    <input type="text" value="<%=product.getProductName()%>" name="productName"> 
                    <input type="hidden" name="Search"value="<%=searchStr%>">
                </td>
                <td> <input type="number" value="<%=product.getPrice()%>" name="price" step="any"></td>
                <td> <input type="number" value="<%=product.getQuantity()%>" name="quantity"></td>
                <td> <%=product.getCategoryID()%></td>
                <td> <input type="text" value="<%=product.getImportDate()%>" name="importDate"></td>
                <td> <input type="text" value="<%=product.getUsingDate()%>" name="usingDate"></td>
                <td> <a href="viewImg.jsp?imgUrl=<%=product.getImageLink()%>" style="text-align: center">  View</a><input name="imagePath" type="file" style="margin-left: 20px"value="<%= product.getImageLink()%>"></td>
                <td>
                    <input type="submit" name="action" value="Update">
                </td>
           
            </form>
                
                
            <td>
                <form action="MainController" method="POST">
                    <input type="hidden" name="productID" value="<%=product.getProductID()%>" >
                    <input type="hidden" name="Search"value="<%=searchStr%>">
                    <input type="submit" name="action" value="Delete">
                </form>
            </td>

        </tr>

    </tbody>

    <%

                }
            }
        }
    %>


</table>
<%
    ProductError error = (ProductError) request.getAttribute("ERROR");

    String errorMessage;
    if (error == null) {
        errorMessage = "";

    } else {

        errorMessage = "Update Error at row " + error.getLine() + ":" + error.getProductIDError() + "<br>"
                + "<br>" + error.getProductNameError() + "<br>" + error.getProductPrice() + "<br>" + error.getProductQuantityError()
                + "<br>" + error.getProductCateIDError() + "<br>" + error.getProductImportDateError() + "<br>" + error.getProductUsingDateError()
                + "<br>" + error.getInvalidDateError()+ "<br>" + error.getImageError();
    }
%>
<br>
<span style="color: red"><%=errorMessage%></span>
</body>
</html>
