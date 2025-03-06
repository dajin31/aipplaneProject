package com.example.demo.dao;


import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PaymentDAOImpl implements PaymentDAO {
    private static final Logger LOGGER = Logger.getLogger(PaymentDAOImpl.class.getName());
    private Connection conn;

    public PaymentDAOImpl(Connection conn) {
        if(conn == null) {
            throw new IllegalArgumentException("conn is null");
        }
        this.conn = conn;
    }

    public PaymentDAOImpl() {

    }

    @Override
    public boolean processPayment(int resCode, int amount) {
        String sql = "INSERT INTO PAYMENT (RES_CODE, AMOUNT, STATUS) VALUES (?, ?, 'COMPLETED')";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, resCode);
            pstmt.setInt(2, amount);

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                LOGGER.log(Level.WARNING, "결제 처리 실패: {0}", resCode);
                return false;
            }
            return true;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "결제 처리 중 오류 발생", e);
        }

        return false;
    }

    @Override
    public boolean refundPayment(int  resCode) {
        String sql = "UPDATE PAYMENT SET STATUS = 'REFUNDED' WHERE RES_CODE = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, resCode);

            if(pstmt.executeUpdate() == 0) {
                LOGGER.log(Level.WARNING, "결제 취소 실패: RES_CODE={0}", resCode);
                return false;
            }
            return true;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "결제 취소 처리 중 오류 발생", e);
        }

        return false;
    }


}
