package com.example.demo.controller;

import com.example.demo.service.IMemberService;
import com.example.demo.service.MemberServiceImp;

public class Test01 {
    public static void main(String[] args) {
        //		서비스 객체 생성
        IMemberService service = MemberServiceImp.getInstance();

//		db에서 처리한 결과 받기
        int count = service.memberIdCount("a001");
        System.out.println(count);
    }
}
