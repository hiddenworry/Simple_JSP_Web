<%-- 
    Document   : Home
    Created on : Jan 26, 2022, 9:40:15 AM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="product.ProductDTO"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        Bootrap link-->

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/homestyles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Organic Store</title>
    </head>
    <body>

        <div class="container-fluid">

            <div class="Shopping-icon">
                <i class="fa fa-shopping-cart" style="font-size:50px"></i>
                <a id="view-cart-btn" href="viewcart.jsp">View Cart</a>

            </div>

            <div class="nav-bar container-fluid row">

                <div class="logo col-md-2">
                    <a href=""> ORGANIC </a>
                </div>
                <div class="search col-md-7">
                    <%
                        String searchStr = request.getParameter("Search");
                        if (searchStr == null || searchStr.isEmpty()) {
                            searchStr = "%";
                        }
                    %>
                    <form action="MainController">
                        <input class="input-search" type="text" name="Search" placeholder="Nhập sản phẩm bạn muốn mua"/>

                        <input type="submit" name="action" value="Search"/>
                    </form>
                </div>
                <div class="login col-md-2"> 
                    <%
                        String link = "login.jsp";
                        String value = "Login";
                        UserDTO user = (UserDTO) session.getAttribute("USER");
                        if (user == null || user.isAdmin()) {
                            response.sendRedirect("login.jsp");
                            return;
                        }
                        String userFullName = user.getFullName();
                        link = "###";
                        value = userFullName;


                    %>

                    <a href="<%=link%>"> <%=value%></a>
                </div>
                <div class="sign-up col-md-1">
                    <a href="MainController?action=LogOut">Log Out</a>
                </div>

            </div>

            <!-- Main -->
            <div class="container shopping-cart">
                <div class="row">
                    <%

                        List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
                        if (productList != null) {
                    %>

                    <%
                        if (!productList.isEmpty()) {
                            for (ProductDTO product : productList) {

                    %>

                    <div class="card" style="width: 20rem;">
                        <img class="card-img-top" src="<%= product.getImageLink()%>" alt="Card image cap">
                        <div class="card-block">
                            <form method="POST" action="MainController">
                                <h4 class="card-title"><%=product.getProductName()%></h4>
                                <p class="card-text">Price: $<%=product.getPrice()%></p>
                                <input hidden="" value="<%=product.getProductID()%>" type="text" name="productID">
                                <input hidden="" value="1" type="number" name="quantity">
                                <input  type="submit" name="action" value="AddToCart" class="add-to-cart btn btn-primary">
                                <input type="text"  hidden="" name="Search" value="<%=searchStr%>">
                            </form>
                        </div>
                    </div>


                    <%           }
                            }
                        }


                    %>

                    <%                    String error = (String) request.getAttribute("ERROR");
                        if (error == null) {
                            error = "";
                        }
                    %>
                    <div style="color: graytext"><%=error%></div>
                </div>
            </div>



        </div> 

    </style>

</div>


<!--        Bootrap link-->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
