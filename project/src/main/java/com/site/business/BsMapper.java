package com.site.business;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.StoreVo;

@Mapper
public interface BsMapper {
	
	//업체 총 개수
	int businessListCount(String category, String searchWord);

	//업체 리스트
	ArrayList<StoreVo> businessList(int startrow, int endrow, String category, String searchWord);

	//업체 상세보기
	ArrayList<StoreVo> businessView(String id);

}
