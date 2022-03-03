/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class ProductDAO {

    private static final String GET_PRODUCT_CATE_LIST = "SELECT categoryID, categoryName from tblCategory";
    private static final String SEARCH_PRODUCT = "SELECT productID, productName, price, quantity, categoryID, importDate, usingDate, image from tblProduct WHERE productName like ?";
    private static final String DELETE_PRODUCT = "DELETE tblProduct WHERE productID=?";
    private static final String UPDATE_PRODUCT = "UPDATE tblProduct SET productName=?, price=?, quantity=?, importDate=?, usingDate=?, image=? WHERE productID=?";
    private static final String INSERT_PRODUCT = "INSERT INTO tblProduct (productID, productName, price, quantity, categoryID, importDate, usingDate, image) VALUES (?, ? , ? , ? , ?, ?, ?, ? )";
    private static final String CHECK_DUPLICATED = "SELECT productID FROM tblProduct where productID =?";

    public boolean checkDuplicated(String productID) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(CHECK_DUPLICATED);
                ps.setString(1, productID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    check = true;

                }

            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;

    }

    public List<ProductDTO> searchProductByName(String searchStr) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ProductDTO> list = new ArrayList<>();

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(SEARCH_PRODUCT);
                ps.setString(1, "%" + searchStr + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getNString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String imageLink = rs.getString("image");
                    ProductDTO product = new ProductDTO(productID, productName, price, quantity, categoryID, importDate, usingDate, imageLink);
                    list.add(product);
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return list;
    }

    //Delete
    public boolean delete(String productID) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(DELETE_PRODUCT);
                ps.setString(1, productID);
                check = ps.executeUpdate() > 0 ? true : false;

            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }

    //Update
    public boolean update(ProductDTO product) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(UPDATE_PRODUCT);
                ps.setString(1, product.getProductName());
                ps.setDouble(2, product.getPrice());
                ps.setInt(3, product.getQuantity());
                //Convert Date to String
                Date importDate = Date.valueOf(product.getImportDate());
                Date usingDate = Date.valueOf(product.getUsingDate());
                ps.setDate(4, importDate);
                ps.setDate(5, usingDate);
                ps.setString(6, product.getImageLink());
                ps.setString(7, product.getProductID());
                
                check = ps.executeUpdate() > 0 ? true : false;

            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }

    //Insert new product
    public boolean insert(ProductDTO product) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(INSERT_PRODUCT);
                ps.setString(1, product.getProductID());
                ps.setString(2, product.getProductName());
                ps.setDouble(3, product.getPrice());
                ps.setInt(4, product.getQuantity());
                ps.setString(5, product.getCategoryID());

                //Convert Date to String
                Date importDate = Date.valueOf(product.getImportDate());
                Date usingDate = Date.valueOf(product.getUsingDate());
                ps.setDate(6, importDate);
                ps.setDate(7,usingDate);
                ps.setString(8,product.getImageLink());
                check = ps.executeUpdate() > 0 ? true : false;

            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }

    public List<String> getProCateList() throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<String> cateList = new ArrayList<>();

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(GET_PRODUCT_CATE_LIST);
                rs = ps.executeQuery();
                while (rs.next()) {
                    cateList.add(rs.getString("CategoryID") + "-" + rs.getNString("CategoryName"));

                }
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (rs != null) {
                rs.close();
            }
            if ((ps != null)) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return cateList;
    }
}
