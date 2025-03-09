//package com.example.demo.service;
//
//import com.example.demo.dao.AdminReservationDAOImpl;
//import com.example.demo.dao.IAdminReservationDAO;
//import com.example.demo.vo.AdminReservationVO;
//import java.util.List;
//import java.util.Map;
//
//public class AdminReservationServiceImpl implements IAdminReservationService {
//
//    private IAdminReservationDAO dao;
//    private static AdminReservationServiceImpl service;
//
//    private AdminReservationServiceImpl() {
//        dao = AdminReservationDAOImpl.getInstance();
//    }
//
//    public static AdminReservationServiceImpl getInstance() {
//        if (service == null) service = new AdminReservationServiceImpl();
//        return service;
//    }
//
//    @Override
//    public List<AdminReservationVO> getUserReservations(String userId) {
//        return dao.getUserReservations(userId);
//    }
//
//    @Override
//    public List<AdminReservationVO> getReservationPassengers(String userId, int fltCode) {
//        return dao.getReservationPassengers(userId, fltCode);
//    }
//
//    @Override
//    public int updatePassenger(AdminReservationVO vo) {
//        return dao.updatePassenger(vo);
//    }
//
//    @Override
//    public int deletePassenger(int pNum) {
//        return dao.deletePassenger(pNum);
//    }
//
//    @Override
//    public List<Map<String, String>> getSeatClasses() {
//        return dao.getSeatClasses();
//    }
//
//    @Override
//    public List<Map<String, String>> getSeatPositions(String seatClass) {
//        return dao.getSeatPositions(seatClass);
//    }
//
//    @Override
//    public List<Map<String, Object>> getDepartureTimes(String dptDate, int fltCode) {
//        return dao.getDepartureTimes(dptDate, fltCode);
//    }
//
//    @Override
//    public Map<String, Object> getArrivalDateTime(String dptDate, String dptTime, int fltCode) {
//        return dao.getArrivalDateTime(dptDate, dptTime, fltCode);
//    }
//
//    @Override
//    public List<Map<String, String>> getAvailableSeatPositions(int fltCode, String seatClass) {
//        return dao.getAvailableSeatPositions(fltCode, seatClass);
//    }
//}
//
