package com.example.demo.dao;

import com.example.demo.vo.Notice_BoardVO;

import java.util.List;
import java.util.Map;

public interface Notice_BoardDao {

    public int insertBoard(Notice_BoardVO nboardVO); //게시물 생성
    public int updateBoard(Notice_BoardVO nboardVO); //게시물 수정
    public int deleteBoard(int ntc_board); //게시물 삭제
    public Notice_BoardVO getBoard(int ntc_board); //게시글 보기

    public List<Notice_BoardVO> selectByPage(Map<String, Object> map); //게시글리스트 - 검색 포함


    public int totalCount(Map<String, Object> map); //전체 게시글 갯수 구하기

}
