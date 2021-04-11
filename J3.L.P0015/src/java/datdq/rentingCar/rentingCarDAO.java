/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datdq.rentingCar;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import datdq.ulties.DBHelpers;

/**
 *
 * @author Asus
 */
public class rentingCarDAO implements Serializable {

    List<rentingCarDTO> listRenting;

    public List<rentingCarDTO> getListRenting() {
        return listRenting;
    }

    public boolean insertCarRenting(rentingCarDTO dto) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO rentingCar(userID, createDate, discountID, totalPrice, status) "
                        + "VALUES(?, ?, ?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, dto.getUserID());
                ps.setDate(2, dto.getCreateDate());
                ps.setString(3, dto.getDiscountID());
                ps.setFloat(4, dto.getTotalPrice());
                ps.setBoolean(5, true);
                int rs = ps.executeUpdate();
                if (rs > 0) {
                    return true;
                }
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public int getLastRecord() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "SELECT TOP 1 rentingID FROM rentingCar ORDER BY rentingID DESC";
                ps = con.prepareStatement(sql);

                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt("rentingID");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return -1;
    }

    public void loadOrderByEmail(String email) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "SELECT rentingID, userID,createDate, discountID,totalPrice,status "
                        + "FROM rentingCar WHERE userID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, email);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (listRenting == null) {
                        listRenting = new ArrayList<>();
                    }
                    listRenting.add(new rentingCarDTO(rs.getInt("rentingID"), rs.getString("userID"),
                             rs.getDate("createDate"), rs.getString("discountID"),
                            rs.getFloat("totalPrice"), rs.getBoolean("status")));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
