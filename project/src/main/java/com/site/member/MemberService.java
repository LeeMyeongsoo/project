package com.site.member;

import com.site.vo.MemberVo;

public interface MemberService {

//	멤버 로그인
	MemberVo login(String id, String pw);
	
//	멤버 회원가입 아이디 체크
	int registerCheckId(String id);

//	멤버 회원가입
	int register(MemberVo memberVo);

//★★★★★★★★★★★★★★★★★★★★★명수★★★★★★★★★★★★★★★★★★★★★
//	회원정보 수정페이지 이동
	MemberVo updateView(String id);

//	회원정보 수정
	int update(MemberVo memberVo);
//★★★★★★★★★★★★★★★★★★★★★끝★★★★★★★★★★★★★★★★★★★★★★

//__________________________기원________________________
	MemberVo memberInfoList(MemberVo memberVo);

}
