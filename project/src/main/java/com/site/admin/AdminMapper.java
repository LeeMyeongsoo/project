package com.site.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.CartVo;
import com.site.vo.ChartVo;
import com.site.vo.MemberVo;
import com.site.vo.OrderVo;

@Mapper
public interface AdminMapper {

//	회원정보 리스트 카운트
	int memberListCount(String category, String order, String searchWord);

//	회원정보 리스트 출력
	ArrayList<MemberVo> memberList(int startRow, int endRow, String category, String order, String searchWord);

//	회원정보 삭제
	int memberDelete(String id);

//	챠트
	ArrayList<ChartVo> orderView();

//	합계 리스트
	ArrayList<ChartVo> tableList();

//	합계 서머리
	ArrayList<ChartVo> tableSummary();

}
