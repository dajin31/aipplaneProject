package com.example.demo.dao;

import com.example.demo.vo.Board1_1VO;
import com.example.demo.vo.Reply1_1VO;

import java.util.List;
import java.util.Map;

public interface BoardDao {
    public int insertBoard(Board1_1VO boardVO); //게시물 생성
    public int deleteBoard(int board_id); //게시물 삭제
    public Board1_1VO getBoard(int board_id); //게시글 보기
    public int updateBoard(Board1_1VO boardVO); // 게시글 수정

    public List<Board1_1VO> selectByPage(Map<String, Object> map); //게시글리스트 - 검색 포함

    public int totalCount(Map<String, Object> map); //전체 게시글 갯수 구하기

    // ------------------------------------------------------

    //답변 보기
    public Reply1_1VO getReply(int board_id);

    // 답변 쓰기
    public int insertReply(Reply1_1VO replyVO);

    // 답변 삭제
    public int deleteReply(int reply_id);

    // 답변 수정
    public int updateReply(Reply1_1VO reply11VO);


}
