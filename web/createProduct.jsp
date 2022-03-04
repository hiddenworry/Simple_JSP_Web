<%-- 
    Document   : insertProduct
    Created on : Feb 26, 2022, 10:59:31 AM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Create Product</title>

        <style>
            .container{
                margin:auto;
            }



            span { display: table-cell; }

            .form {
                display: flex;
                justify-content: center;
                align-items: center;

            }
            .form div {
                flex-basis: 10%;
                margin-left: 5%;
            }
            .input {
                height: 25px;
                width: 300px;


            }

            .Error{
                
                color: red;
            }


        </style>
    </head>
    <body>

        <%
            ProductError error = (ProductError) request.getAttribute("ERROR");

            if (error == null) {
                error = new ProductError();

            }
        %>

        <div class="container">

            <h1 style="text-align: center; margin-top: 10%">Create new product</h1>
            <br>
            <form action="MainController" method="POST" class="form" enctype="multipart/form-data">
                <div>
                    <span>ProductID</span><input type="text" name="productID" required="" class="input"><span class="Error"><%=error.getProductIDError()%></span><br>
                    <span>ProductName</span><input type="text" name="productName" required="" class="input"><span class="Error"><%=error.getProductNameError()%></span><br>
                    <span>Price</span><input type="number" name="price" required="" class="input"><span class="Error"><%=error.getProductPrice()%></span><br>
                    <span>Quantity</span><input type="number" name="quantity" required="" class="input"> <span class="Error"><%=error.getProductQuantityError()%></span><br>
                    <span>Upload image<input name="imagePath" type="text" required=""></span>
                </div>
                <!--            Category-->
                <div>
                    <span>Category</span>
                    <select name="category">
                        <%
                            ProductDAO dao = new ProductDAO();
                            List<String> categoryList = (List<String>) dao.getProCateList();
                            if (categoryList != null) {
                                if (categoryList.size() > 0) {
                                    for (String category : categoryList) {
                        %>
                        <option  value="<%=category%>"><%=category%></option>



                        <%
                                    }

                                }
                            }


                        %>

                    </select>


                    <span class="Error"><%=error.getProductCateIDError()%></span><br>
                    <span>Import Date</span><input type="date" name="importDate" required=""><span class="Error"><%=error.getProductImportDateError() + " " + error.getInvalidDateError()%></span><br>
                    <span>Using Date</span><input type="date" name="usingDate" required=""><span class="Error"><%=error.getProductUsingDateError()%></span><br>
                    <br>
                    <input type="submit" name="action" value="CreateProduct">
                    <input type="reset" value="Reset">
                    <br>
                    <a href="admin.jsp" style="margin-top: 10px">Back to Admin Page </a>
                </div>
            </form>
                    <%
                            String message = (String)request.getAttribute("MESSAGE");
                            if (message == null) message = "";
                            %>
                            <div style="text-align: center; color: green;"><%=message%></div>  
        </div>

    </body>
</html>
