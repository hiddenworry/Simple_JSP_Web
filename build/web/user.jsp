<%-- 
    Document   : Home
    Created on : Jan 26, 2022, 9:40:15 AM
    Author     : ADMIN
--%>

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
            
        </div>
            <div class="nav-bar container-fluid row">

                <div class="logo col-md-2">
                    <a href=""> ORGANIC </a>
                </div>
                <div class="search col-md-7">
                    <form action="SearchServlet">
                        <input class="input-search" type="text" name="search" placeholder="Nhập sản phẩm bạn muốn mua"/>
                        <input type="submit" value="Tìm Kiếm"/>
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
                    <div class="col">
                        <div class="card" style="width: 20rem;">
                            <img class="card-img-top" src="http://www.azspagirls.com/files/2010/09/orange.jpg" alt="Card image cap">
                            <div class="card-block">
                                <h4 class="card-title">Orange</h4>
                                <p class="card-text">Price: $0.5</p>
                                <a href="#" data-name="Orange" data-price="0.5" class="add-to-cart btn btn-primary">Add to cart</a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 20rem;">
                            <img class="card-img-top" src="http://images.all-free-download.com/images/graphicthumb/vector_illustration_of_ripe_bananas_567893.jpg" alt="Card image cap">
                            <div class="card-block">
                                <h4 class="card-title">Banana</h4>
                                <p class="card-text">Price: $1.22</p>
                                <a href="#" data-name="Banana" data-price="1.22" class="add-to-cart btn btn-primary">Add to cart</a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 20rem;">
                            <img class="card-img-top" src="https://3.imimg.com/data3/IC/JO/MY-9839190/organic-lemon-250x250.jpg" alt="Card image cap">
                            <div class="card-block">
                                <h4 class="card-title">Lemon</h4>
                                <p class="card-text">Price: $5</p>
                                <a href="#" data-name="Lemon" data-price="5" class="add-to-cart btn btn-primary">Add to cart</a>
                            </div>
                        </div>
                    </div>
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
