package com.example.demo.service;

import com.example.demo.dao.BoardDao;
import com.example.demo.dao.BoardDaoImpl;
import com.example.demo.vo.Board1_1VO;
import com.example.demo.vo.PageVO;
import com.example.demo.vo.Reply1_1VO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardServiceImpl implements BoardService {
    private BoardDao dao;

    private static BoardService service;


    private BoardServiceImpl() {
        dao = BoardDaoImpl.getInstance();
    }

    public static BoardService getInstance() {
        if(service == null) service = new BoardServiceImpl();
        return service;
    }
    @Override
    public int insertBoard(Board1_1VO boardVO) {
        return dao.insertBoard(boardVO);
    }

    @Override
    public int deleteBoard(int board_id) {
        return dao.deleteBoard(board_id);
    }

    @Override
    public int updateBoard(Board1_1VO boardVo) {
        return dao.updateBoard(boardVo);
    }

    @Override
    public List<Board1_1VO> selectByPage(Map<String, Object> map) {
        return dao.selectByPage(map);
    }

    @Override
    public Board1_1VO getBoard(int board_id) {
        return dao.getBoard(board_id);
    }

    @Override
    public PageVO pageInfo(int page, String sword) {
        Map<String, Object> map = new HashMap<>();
        map.put("sword", sword);

        int count = this.totalCount(map);

        int totalPage = (int) Math.ceil((double)count / PageVO.getPerList());

        //시작 게시글 , 끝 게시글 구하기
        int start = (page - 1) * PageVO.getPerList() + 1;
        int end = start + PageVO.getPerList() -1 ;
        if(end > count){
            end = count;
        }


        //시작 페이지, 끝 페이지 구하기

        int perPage =  PageVO.getPerPage(); // 한 페이지에 보여줄 페이지 수
        int startPage = ((page - 1) / perPage*perPage) + 1;
        int endPage = startPage + perPage -1;
        if(endPage > totalPage){
            endPage = totalPage;
        }

        PageVO pageVO = new PageVO();
        pageVO.setCurrentPage(page);
        pageVO.setStart(start);
        pageVO.setEnd(end);

        pageVO.setTotalPage(totalPage);
        pageVO.setStartPage(startPage);
        pageVO.setEndPage(endPage);

        return pageVO;
    }

    @Override
    public int totalCount(Map<String, Object> map) {
        return dao.totalCount(map);
    }

    @Override
    public Reply1_1VO getReply(int board_id) {
        return dao.getReply(board_id);
    }

    @Override
    public int insertReply(Reply1_1VO replyVO) {
        return dao.insertReply(replyVO);
    }

    @Override
    public int deleteReply(int reply_id) {
        return dao.deleteReply(reply_id);
    }

    @Override
    public int updateReply(Reply1_1VO replyVO) {
        return dao.updateReply(replyVO);
    }
}
