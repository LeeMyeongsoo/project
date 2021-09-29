package com.site.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.vo.CartVo;
import com.site.vo.ChartVo;
import com.site.vo.MemberVo;
import com.site.vo.OrderVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;

//	회원정보 리스트 출력
	@Override
	public Map<String, Object> memberList(int page, String category, String order, String searchWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		
//		회원정보 리스트 카운트
		int listCount = adminMapper.memberListCount(category, order, searchWord);
		int limit = 20;
		int numlimit= 5;
		int maxPage = (int)((double)listCount/limit+0.9999);
		int startPage = (((int)((double)page/numlimit+0.9999))-1)*numlimit+1;
		int endPage = startPage+numlimit-1;
		if(endPage>maxPage) endPage = maxPage;
		
		int startRow = (page-1)*limit+1;
		int endRow = startRow +limit-1;
		
		ArrayList<MemberVo> list = adminMapper.memberList(startRow, endRow, category, order, searchWord);
		if(list.isEmpty()) {
			map.put("flag", 1);
		}
		map.put("listCount", listCount);
		map.put("page", page);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("list", list);
		map.put("category", category);
		map.put("order", order);
		map.put("searchWord", searchWord);
		
		return map;
	}

//	회원정보 삭제
	@Override
	public int memberDelete(String id) {
		int result = adminMapper.memberDelete(id);
		return result;
	} 

	@Override
	public Map<String, Object> orderView() {
		Map<String, Object> orderView = new HashMap<String, Object>();
		ArrayList<ChartVo> list = adminMapper.orderView();
		ArrayList<ChartVo> tableList = adminMapper.tableList();
		ArrayList<ChartVo> tableSummary = adminMapper.tableSummary();
		orderView.put("list", list);
		orderView.put("tableList", tableList);
		orderView.put("tableSummary", tableSummary);
		return orderView;
	}

}
