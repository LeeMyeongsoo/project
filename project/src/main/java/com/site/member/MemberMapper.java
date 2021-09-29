package com.site.member;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.MemberVo;

@Mapper
public interface MemberMapper {

//	멤버 로그인
	MemberVo selectId(String id);
	
//	멤버 회원가입 아이디 체크
	int registerCheckId(String id);
	
//	멤버 회원가입
	int register(MemberVo memberVo);

//★★★★★★★★★★★★★★★★★★★★★명수★★★★★★★★★★★★★★★★★★★★★
//	회원정보 수정
	int update(MemberVo memberVo);
//★★★★★★★★★★★★★★★★★★★★★끝★★★★★★★★★★★★★★★★★★★★★★

	MemberVo memberInfoList(MemberVo memberVo);

}
