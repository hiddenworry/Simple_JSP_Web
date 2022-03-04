<%-- 
    Document   : viewcart
    Created on : Mar 4, 2022, 7:59:50 PM
    Author     : ADMIN
--%>

<%@page import="product.ProductDTO"%>
<%@page import="shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
    </head>
    <body>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
                if (cart.getCart().size() > 0) {
        %>
        <table border="1" cellpadding="1">
            <thead>
                <tr>
                    <th>ProductID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Edit</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
            <form method="POST" action="MainController"
                  <%
                      for (ProductDTO product : cart.getCart().values()) {


                  %>
                  <tr>
                    <td>
                        <%=product.getProductID()%>
                        <input type="hidden" name="productID" value="<%=product.getProductID()%>"/>
                    </td>
                    <td><%=product.getProductName()%></td>
                    <td><%=product.getPrice()%></td>
                    <td><input type="number" value="<%=product.getQuantity()%>" name="ProductQuantity"></td>
                    <td>
                        <input type="submit" value="EditCart" name="action">                                           
                    </td>
                    <td>
                        <input type="submit" value="RemoveCart" name="action">                                           
                    </td>
                </tr>






                <%          }
                    
                %>
                <input type="submit" value="CheckOut" name="action">
                <a href="MainController?action=Search&Search=">Back To Shopping</a>

                <%      }
                    }
                %>  
            </form>
        </tbody>
    </table>

    <%
        String message = (String) request.getAttribute("MESSAGE");
        if (cart == null || message != null) {
            message = "Your Cart is empty";


    %>
    <div>
        <h1 style="text-align: center"><%=message%></h1>
        <h2 style="text-align: center"><a href="MainController?action=Search&Search=">Continue Shopping</a></h2>
    </div>
    <% } %>

</body>
</html>
