package com.example.demo.service;


import com.example.demo.dao.IMemberDAO;
import com.example.demo.dao.MemberDaoImp;
import com.example.demo.vo.MemVO;

public class MemberServiceImp implements IMemberService {
	private IMemberDAO dao;
	
	private static MemberServiceImp service;
	
	private MemberServiceImp() {
		dao = MemberDaoImp.getInstance();
	}
	
	public static MemberServiceImp getInstance() {
		if(service == null) service = new MemberServiceImp();
		return service;
	}
	
	@Override
	public int memberIdCount(String memId) {
		return dao.memberIdCount(memId);
	}

	@Override
	public int insertMember(MemVO memVO) {
		return dao.insertMember(memVO);
	}

}
