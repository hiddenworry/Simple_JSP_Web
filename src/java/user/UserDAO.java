/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class UserDAO {

    private static final String LOGIN = "SELECT fullName, roleID, status from tblUsers WHERE userID =? AND password=?";
    private static final String SEARCH = "SELECT userID, fullName, birthday, address, phone,roleID, status from tblUsers WHERE fullName=?";

    public UserDTO login(String userID, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserDTO user = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ps = conn.prepareStatement(LOGIN);
                ps.setString(1, userID);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getNString("fullName");
                    boolean roleID = rs.getBoolean("roleID");
                    boolean status = rs.getBoolean("status");
                    user = new UserDTO(fullName, roleID, status);

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
        return user;
    }

    // Search
    public List<UserDTO> search(String fullName) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<UserDTO> rsList = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(SEARCH);
            ps.setString(1, "%" + fullName + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                String userID = rs.getString("userID");
                String name = rs.getNString("fullName");
                String address = rs.getNString("address");
                boolean roleID = rs.getBoolean("roleID");
                String birthday = rs.getString("birthday");
                String phone = rs.getString("phone");
                boolean status = rs.getBoolean("status");
                UserDTO user = new UserDTO(userID, "****", fullName, roleID, address, birthday, phone, status);
                rsList.add(user);
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
        return rsList;
    }

}
