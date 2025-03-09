package com.example.demo.controller;

import com.example.demo.service.AdminReservationServiceImpl;
import com.example.demo.service.AdminServiceImpl;
import com.example.demo.service.IAdminReservationService;
import com.example.demo.service.IAdminService;
import com.example.demo.vo.AdminReservationVO;
import com.example.demo.vo.UserVO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

@WebServlet("/AdminUser/AdminReservationDetail")
public class AdminReservationDetail extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 서비스 객체 생성
        IAdminService adminService = AdminServiceImpl.getInstance();
        IAdminReservationService reservationService = AdminReservationServiceImpl.getInstance();

        // 요청 파라미터에서 회원 ID와 항공편 코드 가져오기
        String userId = request.getParameter("userId");
        String fltCodeStr = request.getParameter("fltCode");

        if (userId != null && !userId.isEmpty() && fltCodeStr != null && !fltCodeStr.isEmpty()) {
            try {
                int fltCode = Integer.parseInt(fltCodeStr);

                // 회원 정보 조회
                UserVO user = adminService.getUserById(userId);
                request.setAttribute("user", user);

                // 예약 상세 정보 조회 (승객 목록)
                List<AdminReservationVO> passengers = reservationService.getReservationPassengers(userId, fltCode);
                request.setAttribute("passengers", passengers);

                // 첫 번째 승객 정보를 기본 정보로 사용
                if (passengers != null && !passengers.isEmpty()) {
                    request.setAttribute("reservation", passengers.get(0));
                }

                // 좌석 등급 목록 조회
                List<Map<String, String>> seatClasses = reservationService.getSeatClasses();
                request.setAttribute("seatClasses", seatClasses);

            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "유효하지 않은 항공편 코드입니다.");
            }
        } else {
            request.setAttribute("errorMessage", "유효하지 않은 요청 파라미터입니다.");
        }

        // JSP로 포워딩
        request.getRequestDispatcher("/admin/adminReservationDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        IAdminReservationService reservationService = AdminReservationServiceImpl.getInstance();
        Gson gson = new Gson();

        if ("update".equals(action)) {
            // 승객 정보 수정
            try {
                int pNum = Integer.parseInt(request.getParameter("pNum"));
                String userId = request.getParameter("userId");
                int fltCode = Integer.parseInt(request.getParameter("fltCode"));
                String dptDateStr = request.getParameter("dptDate");
                String dptTimeStr = request.getParameter("dptTime");
                String arrDateStr = request.getParameter("arrDate");
                String arrTimeStr = request.getParameter("arrTime");
                String seatClass = request.getParameter("seatClass");
                String seatPosition = request.getParameter("seatPosition");

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

                AdminReservationVO vo = new AdminReservationVO();
                vo.setPNum(pNum);
                vo.setUserId(userId);
                vo.setFltCode(fltCode);

                if (dptDateStr != null && !dptDateStr.isEmpty() && dptTimeStr != null && !dptTimeStr.isEmpty()) {
                    Date dptDate = dateFormat.parse(dptDateStr);
                    Date dptTime = timeFormat.parse(dptTimeStr);
                    vo.setDptDate(dptDate);
                    vo.setDptTime(dptTime);
                }

                if (arrDateStr != null && !arrDateStr.isEmpty() && arrTimeStr != null && !arrTimeStr.isEmpty()) {
                    Date arrDate = dateFormat.parse(arrDateStr);
                    Date arrTime = timeFormat.parse(arrTimeStr);
                    vo.setArrDate(arrDate);
                    vo.setArrTime(arrTime);
                }

                vo.setSeatClass(seatClass);
                vo.setSeatPosition(seatPosition);

                int result = reservationService.updatePassenger(vo);

                if (result > 0) {
                    request.setAttribute("message", "승객 정보가 성공적으로 수정되었습니다.");

                    // 업데이트 후 최신 데이터 다시 조회
                    IAdminService adminService = AdminServiceImpl.getInstance();
                    UserVO user = adminService.getUserById(userId);
                    request.setAttribute("user", user);

                    List<AdminReservationVO> passengers = reservationService.getReservationPassengers(userId, fltCode);
                    request.setAttribute("passengers", passengers);

                    if (passengers != null && !passengers.isEmpty()) {
                        request.setAttribute("reservation", passengers.get(0));
                    }

                    List<Map<String, String>> seatClasses = reservationService.getSeatClasses();
                    request.setAttribute("seatClasses", seatClasses);

                    // JSP로 포워딩
                    request.getRequestDispatcher("/admin/adminReservationDetail.jsp").forward(request, response);
                    return;
                } else {
                    request.setAttribute("errorMessage", "승객 정보 수정에 실패했습니다.");
                }
            } catch (Exception e) {
                request.setAttribute("errorMessage", "승객 정보 수정 중 오류가 발생했습니다: " + e.getMessage());
                e.printStackTrace();
            }
        } else if ("delete".equals(action)) {
            // 승객 정보 삭제
            try {
                int pNum = Integer.parseInt(request.getParameter("pNum"));
                String userId = request.getParameter("userId");
                int fltCode = Integer.parseInt(request.getParameter("fltCode"));

                int result = reservationService.deletePassenger(pNum);

                if (result > 0) {
                    request.setAttribute("message", "승객 정보가 성공적으로 삭제되었습니다.");

                    // 삭제 후 최신 데이터 다시 조회
                    IAdminService adminService = AdminServiceImpl.getInstance();
                    UserVO user = adminService.getUserById(userId);
                    request.setAttribute("user", user);

                    List<AdminReservationVO> passengers = reservationService.getReservationPassengers(userId, fltCode);
                    request.setAttribute("passengers", passengers);

                    if (passengers != null && !passengers.isEmpty()) {
                        request.setAttribute("reservation", passengers.get(0));
                    } else {
                        // 모든 승객이 삭제된 경우 창 닫기
                        response.setContentType("text/html;charset=UTF-8");
                        PrintWriter out = response.getWriter();
                        out.println("<script>");
                        out.println("alert('모든 승객 정보가 삭제되었습니다.');");
                        out.println("window.close();");
                        out.println("</script>");
                        return;
                    }

                    List<Map<String, String>> seatClasses = reservationService.getSeatClasses();
                    request.setAttribute("seatClasses", seatClasses);

                    // JSP로 포워딩
                    request.getRequestDispatcher("/admin/adminReservationDetail.jsp").forward(request, response);
                    return;
                } else {
                    request.setAttribute("errorMessage", "승객 정보 삭제에 실패했습니다.");
                }
            } catch (Exception e) {
                request.setAttribute("errorMessage", "승객 정보 삭제 중 오류가 발생했습니다: " + e.getMessage());
                e.printStackTrace();
            }
        } else if ("getSeatPositions".equals(action)) {
            // AJAX 요청 처리: 좌석 등급에 따른 좌석 위치 목록 반환
            try {
                String seatClass = request.getParameter("seatClass");
                int fltCode = Integer.parseInt(request.getParameter("fltCode"));
                String pNumStr = request.getParameter("pNum");
                int pNum = 0;
                if (pNumStr != null && !pNumStr.isEmpty()) {
                    pNum = Integer.parseInt(pNumStr);
                }

                System.out.println("getSeatPositions 요청 - 좌석 등급: " + seatClass + ", 항공편: " + fltCode + ", 승객번호: " + pNum);

                List<Map<String, String>> seatPositions;

                if (pNum > 0) {
                    // 승객 번호가 있는 경우 현재 좌석도 포함하여 조회
                    seatPositions = reservationService.getAvailableSeatPositions(fltCode, seatClass, pNum);
                } else {
                    // 승객 번호가 없는 경우 빈 좌석만 조회
                    seatPositions = reservationService.getAvailableSeatPositions(fltCode, seatClass);
                }

                // 데이터가 없는 경우 기본 데이터 생성
                if (seatPositions == null || seatPositions.isEmpty()) {
                    seatPositions = new ArrayList<>();
                    Map<String, String> defaultPosition = new HashMap<>();
                    defaultPosition.put("value", "1A");
                    defaultPosition.put("label", "1A");
                    seatPositions.add(defaultPosition);
                }

                System.out.println("조회된 좌석 위치 개수: " + seatPositions.size());

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                PrintWriter out = response.getWriter();
                out.print(gson.toJson(seatPositions));
                out.flush();
                return;
            } catch (Exception e) {
                System.err.println("getSeatPositions 오류: " + e.getMessage());
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

                // 오류 발생 시 기본 데이터 반환
                List<Map<String, String>> defaultPositions = new ArrayList<>();
                Map<String, String> defaultPosition = new HashMap<>();
                defaultPosition.put("value", "1A");
                defaultPosition.put("label", "1A");
                defaultPositions.add(defaultPosition);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(gson.toJson(defaultPositions));
                out.flush();
                return;
            }
        } else if ("getDepartureTimes".equals(action)) {
            // AJAX 요청 처리: 특정 날짜의 출발 시간 목록 반환
            try {
                String dptDate = request.getParameter("dptDate");
                int fltCode = Integer.parseInt(request.getParameter("fltCode"));

                System.out.println("getDepartureTimes 요청 - 날짜: " + dptDate + ", 항공편: " + fltCode);

                List<Map<String, Object>> departureTimes = reservationService.getDepartureTimes(dptDate, fltCode);

                // 데이터가 없는 경우 기본 데이터 생성
                if (departureTimes == null || departureTimes.isEmpty()) {
                    departureTimes = new ArrayList<>();
                    Map<String, Object> defaultTime = new HashMap<>();
                    defaultTime.put("value", "00:00");
                    defaultTime.put("label", "00:00");
                    departureTimes.add(defaultTime);
                }

                System.out.println("조회된 출발 시간 개수: " + departureTimes.size());

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                PrintWriter out = response.getWriter();
                out.print(gson.toJson(departureTimes));
                out.flush();
                return;
            } catch (Exception e) {
                System.err.println("getDepartureTimes 오류: " + e.getMessage());
                e.printStackTrace();

                // 오류 발생 시 기본 데이터 반환
                List<Map<String, Object>> defaultTimes = new ArrayList<>();
                Map<String, Object> defaultTime = new HashMap<>();
                defaultTime.put("value", "00:00");
                defaultTime.put("label", "00:00");
                defaultTimes.add(defaultTime);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(gson.toJson(defaultTimes));
                out.flush();
                return;
            }
        } else if ("getArrivalDateTime".equals(action)) {
            // AJAX 요청 처리: 특정 출발 일시에 해당하는 도착 일시 반환
            try {
                String dptDate = request.getParameter("dptDate");
                String dptTime = request.getParameter("dptTime");
                int fltCode = Integer.parseInt(request.getParameter("fltCode"));

                System.out.println("getArrivalDateTime 요청 - 날짜: " + dptDate + ", 시간: " + dptTime + ", 항공편: " + fltCode);

                Map<String, Object> arrivalDateTime = reservationService.getArrivalDateTime(dptDate, dptTime, fltCode);

                // 데이터가 없는 경우 기본 데이터 생성
                if (arrivalDateTime == null || arrivalDateTime.isEmpty()) {
                    arrivalDateTime = new HashMap<>();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    arrivalDateTime.put("arrDate", dateFormat.format(new Date()));
                    arrivalDateTime.put("arrTime", "00:00");
                }

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                PrintWriter out = response.getWriter();
                out.print(gson.toJson(arrivalDateTime));
                out.flush();
                return;
            } catch (Exception e) {
                System.err.println("getArrivalDateTime 오류: " + e.getMessage());
                e.printStackTrace();

                // 오류 발생 시 기본 데이터 반환
                Map<String, Object> defaultDateTime = new HashMap<>();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                defaultDateTime.put("arrDate", dateFormat.format(new Date()));
                defaultDateTime.put("arrTime", "00:00");

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(gson.toJson(defaultDateTime));
                out.flush();
                return;
            }
        }

        // 업데이트 후 상세 페이지로 리다이렉트
        String userId = request.getParameter("userId");
        String fltCode = request.getParameter("fltCode");
        response.sendRedirect(request.getContextPath() + "/AdminUser/AdminReservationDetail?userId=" + userId + "&fltCode=" + fltCode);
    }
}

