package com.example.demo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.demo.service.FAQBoardServiceImpl;
import com.example.demo.service.IFAQBoardService;
import com.example.demo.service.IUserService;
import com.example.demo.service.UserServiceImp;
import com.example.demo.vo.FAQBoardVO;
import com.example.demo.vo.FAQPageVO;

import com.example.demo.vo.UserVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//request{category=reservation, question=질문있어요, answer=답변이에요}
@WebServlet("/FAQBoard")
public class FAQBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser"); // 세션에 로그인 사용자 정보 가져오기

        //Controller -> Service를 호출
        IFAQBoardService fqaboardService = FAQBoardServiceImpl.getInstance();
        IUserService userService = UserServiceImp.getInstance();

		int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        String stype = request.getParameter("stype");
        stype = stype == null ? "" : stype;

        String sword = request.getParameter("sword");
        sword = sword == null ? "" : sword;

        // 기본 카테고리 설정
        String category = request.getParameter("category");
        category = category == null ? "all" : category;

        //service메소드 호출하기 -  - 페이지 처리에 필요값들을 계산
        FAQPageVO faqpageVO = fqaboardService.pageInfo(page, stype, sword);

        // 카테고리 추가
        if (faqpageVO != null) {
            request.setAttribute("faqpageVO", faqpageVO);
        } else {
            request.setAttribute("errorMessage", "페이지 정보를 불러오는 데 실패했습니다.");
        }

		// service메소드 호출 - parameter로 map을 설정
        Map<String, Object> map = new HashMap<>();
        map.put("start", faqpageVO.getStart());
        map.put("end", faqpageVO.getEnd());
        map.put("stype", stype);
        map.put("sword", sword);
        // 카테고리 추가
        map.put("category", category);

		// 메소드 호출결과로   list를  받기
        List<FAQBoardVO> faqList = fqaboardService.selectByPage(map);
        int totalCount = fqaboardService.totalCount(map);

		//결과값을 request에 저장 - 페이지처리에 필요한 요소들
        request.setAttribute("faqList", faqList);
        // 전체 게시글 수
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("stype", stype);
        request.setAttribute("sword", sword);
        // 카테고리 추가
        request.setAttribute("category", category);

		request.getRequestDispatcher("/FAQ/faqBoardView.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
