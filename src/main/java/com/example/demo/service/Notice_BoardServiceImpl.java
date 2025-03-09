package com.example.demo.service;

import com.example.demo.dao.Notice_BoardDao;
import com.example.demo.dao.Notice_BoardDaoImpl;
import com.example.demo.vo.Notice_BoardVO;
import com.example.demo.vo.PageVO;

import javax.swing.plaf.metal.DefaultMetalTheme;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Notice_BoardServiceImpl implements Notice_BoardService {

    private Notice_BoardDao notice_boardDao;
    private static Notice_BoardService notice_boardService;


    public Notice_BoardServiceImpl() {
        notice_boardDao = Notice_BoardDaoImpl.getInstance();
    }

    public static Notice_BoardService getInstance() {
        if(notice_boardService == null){
            notice_boardService = new Notice_BoardServiceImpl();
        }
        return notice_boardService;
    }

    @Override
    public int insertBoard(Notice_BoardVO nboardVO) {
        System.out.println(nboardVO.getNtc_title());
        return notice_boardDao.insertBoard(nboardVO);
    }

    @Override
    public int updateBoard(Notice_BoardVO nboardVO) {
        return notice_boardDao.updateBoard(nboardVO);
    }

    @Override
    public int deleteBoard(int ntc_board) {
        return notice_boardDao.deleteBoard(ntc_board);
    }

    @Override
    public Notice_BoardVO getBoard(int ntc_board) {
        return notice_boardDao.getBoard(ntc_board);
    }

    @Override
    public List<Notice_BoardVO> selectByPage(Map<String, Object> map) {
        return notice_boardDao.selectByPage(map);
    }

    @Override //게시글리스트 - 검색 포함
    public PageVO pageInfo(int page, String sword) {

        Map<String, Object> map = new HashMap<String, Object>();
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

    @Override //전체 글 갯수
    public int totalCount(Map<String, Object> map) {
        return notice_boardDao.totalCount(map);
    }

    @Override
    public List<Notice_BoardVO> getRecentNotices(int limit) {
        return List.of();
    }
}
