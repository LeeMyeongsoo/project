package com.site.business;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.vo.StoreVo;

@Service
public class BsSeviceImpl implements BsService {

	@Autowired
	BsMapper bsMapper;
	//업체 리스트 출력
	@Override
	public Map<String, Object> businessList(int page, String category, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		int listCount = bsMapper.businessListCount(category,searchWord);//업체 총 개수
		
		int limit = 5;//한페이지에 업체 수
		int numlimit = 5;//하단넘버링수
		int maxpage = (int)((double)listCount/limit+0.99);//최대페이지 수
		int startpage = (((int)((double)page/numlimit+0.99))-1)*numlimit+1; //하단넘버링 첫번째 수
		int endpage = startpage+numlimit-1; //하단넘버링 마지막 수
		if(endpage>maxpage) endpage=maxpage; // 
		int startrow =(page-1)*limit+1; //페이지에서 게시글 첫번째 가져오는 수
		int endrow = startrow+limit-1;  //페이지에서 게시글 마지막번째 가져오는 수
		//업체 리스트
		ArrayList<StoreVo> list = bsMapper.businessList(startrow,endrow,category,searchWord);
		map.put("listCount", listCount);
		map.put("page", page);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("list", list);
		map.put("category", category);
		map.put("searchWord", searchWord);
		return map;
	}
	//업체상세보기
	@Override
	public Map<String, Object> businessView(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<StoreVo> list = bsMapper.businessView(id);
		map.put("list", list);
		return map;
	}

}
