//package com.example.demo.service;
//
//import com.example.demo.vo.AdminPageVO;
//import com.example.demo.vo.UserVO;
//
//import java.util.List;
//import java.util.Map;
//
//public interface IAdminService {
//
//    // 회원 삭제
//    public int deleteUser(String userId);
//
//    // 회원 정보 수정
//    public int updateUser(UserVO user);
//
//    // 회원 리스트 - 검색
//    public List<UserVO> selectById(Map<String, Object> map);
//
//    // 페이지별 정보 구하기 - paging 처리를 위한 것
//    public AdminPageVO pageInfo(int page, String stype, String sword);
//
//    // 전체 회원 수
//    public int totalCount(Map<String, Object> map);
//
//    // 조회할 회원 정보
//    public UserVO getUserById(String userId);
//
//    // 전체 회원 목록
//    public List<UserVO> getAllUsers();
//
//}
