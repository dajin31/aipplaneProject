package com.example.demo.dao;

import com.example.demo.vo.AircraftVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AircraftDAOImpl implements AircraftDAO {

    private Connection conn;

    public AircraftDAOImpl(Connection conn) {
        if(conn == null) {
            throw new NullPointerException("conn is null");
        }
        this.conn = conn;
    }


    @Override
    public AircraftVO getAircraftByCode(int airCode) {
        String sql = "SELECT * FROM AIRCRAFT WHERE AIR_CODE = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, airCode);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new AircraftVO(
                        rs.getInt("AIR_CODE"),
                        rs.getString("AIR_NAME"),
                        rs.getString("AIR_MODEL")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<AircraftVO> getAllAircrafts() {
        List<AircraftVO> aircrafts = new ArrayList<>();
        String sql = "SELECT * FROM AIRCRAFT";
        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                aircrafts.add(new AircraftVO(
                        rs.getInt("AIR_CODE"),
                        rs.getString("AIR_NAME"),
                        rs.getString("AIR_MODEL")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return aircrafts;

    }
}
