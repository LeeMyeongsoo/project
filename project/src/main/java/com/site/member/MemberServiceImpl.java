package com.site.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.site.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

//	멤버 로그인
	@Override
	public MemberVo login(String id, String pw) {
		MemberVo memberVo = memberMapper.selectId(id);
		if(passwordEncoder.matches(pw, memberVo.getPw())) { // login form의 pw와 db의 pw 비교
			
		} else { // pw가 같지 않을 경우
			memberVo = null;
		}
		return memberVo;
	}
	
//	멤버 회원가입 아이디 체크
	@Override
	public int registerCheckId(String id) {
		int result = memberMapper.registerCheckId(id);
		return result;
	}

//	멤버 회원가입
	@Override
	public int register(MemberVo memberVo) {
		memberVo.setPw(passwordEncoder.encode(memberVo.getPw())); // bcryt로 pw를 인코딩해서 db에 저장
		int result = memberMapper.register(memberVo);
		return result;
	}

//★★★★★★★★★★★★★★★★★★★★★명수★★★★★★★★★★★★★★★★★★★★★
//	회원정보 수정페이지 이동
	@Override
	public MemberVo updateView(String id) {
		MemberVo memberVo = memberMapper.selectId(id);
		return memberVo;
	}

//	회원정보 수정
	@Override
	public int update(MemberVo memberVo) {
		memberVo.setPw(passwordEncoder.encode(memberVo.getPw())); // bcryt로 pw 인코딩
		int rs = memberMapper.update(memberVo);
		return rs;
	}
//★★★★★★★★★★★★★★★★★★★★★끝★★★★★★★★★★★★★★★★★★★★★★

//____________________________기원______________________
	@Override
	public MemberVo memberInfoList(MemberVo memberVo) {
		MemberVo mVo = memberMapper.memberInfoList(memberVo);
		return mVo;
	}

}
