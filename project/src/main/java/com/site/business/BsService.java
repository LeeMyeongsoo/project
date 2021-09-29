package com.site.business;

import java.util.Map;

public interface BsService {

	//업체 리스트 출력
	Map<String, Object> businessList(int page, String category, String searchWord);

	//업체상세보기
	Map<String, Object> businessView(String id);


}
