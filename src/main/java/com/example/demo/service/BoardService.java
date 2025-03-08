package com.example.demo.service;

import com.example.demo.vo.Board1_1VO;
import com.example.demo.vo.PageVO;
import com.example.demo.vo.Reply1_1VO;

import java.util.List;
import java.util.Map;

public interface BoardService {

    // 게시글 쓰기
    public int insertBoard(Board1_1VO boardVO);

    // 게시글 삭제
    public int deleteBoard(int board_id);

    // 게시글 수정
    public int updateBoard(Board1_1VO boardVo);

    // 게시글 리스트 - 검색 포함
    public List<Board1_1VO> selectByPage(Map<String, Object> map);

    // 게시글 보기
    public Board1_1VO getBoard(int board_id);

    //페이지별 정보구하기 - 페이지 처리 를 위한 정보 -
    public PageVO pageInfo(int page, String sword);

    //전체글 갯수 구하기
    public int totalCount(Map<String, Object> map) ;

    //---------------------------------------

    public Reply1_1VO getReply(int board_id);

    //댓글쓰기
    public int insertReply(Reply1_1VO replyVO);

    //댓글 삭제
    public int deleteReply(int reply_id);

    //댓글 수정
    public int updateReply(Reply1_1VO replyVO);


}
