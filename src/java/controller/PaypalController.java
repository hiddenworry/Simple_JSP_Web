/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import paypal.*;
import com.paypal.base.rest.PayPalRESTException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import order.Order;
import shopping.Cart;
import user.UserDTO;

/**
 *
 * @author ADMIN
 */
public class PaypalController extends HttpServlet {

    private static final String SUCCESS = "";
    private static final String ERROR = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER");
            Cart cart = (Cart) session.getAttribute("CART");
            Order order = new Order();

            String productName, subtotal, shipping, tax, total;
            productName = user.getUserID();// LAy ten san pham bang ten cua userID
            Double price = order.checkOrder(cart);
            if (price < 0) {
                request.setAttribute("ERROR", "Invalid Order!!!");
            } else {
                subtotal = String.valueOf(price);
                shipping = "0";
                tax = "0.1";
                total = String.valueOf(Double.parseDouble(subtotal)
                        + Double.parseDouble(tax) + Double.parseDouble(shipping));
                PaymentService paymentService = new PaymentService();
                OrderDetail orderDetail = new OrderDetail(productName, subtotal, shipping, tax, total);
                url = paymentService.authourizePayment(orderDetail);
            }
        } catch (Exception e) {
           e.printStackTrace();
        } finally {
            response.sendRedirect(url);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
