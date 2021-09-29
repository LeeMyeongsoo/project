package com.site.one_board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.vo.CommentsVo;
import com.site.vo.One_BoardVo;


@Service
public class One_BoardServiceImpl implements One_BoardService {

	@Autowired
	private One_BoardMapper one_boardmapper;

	// 리스트
	@Override
	public Map<String, Object> selectBoardList(String category, String category1, String searchword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("category1:" + category1);
		int listCount = one_boardmapper.selectListCount(category, category1, searchword);
		System.out.println("카운트" + listCount);

		ArrayList<One_BoardVo> list = one_boardmapper.selectBoardList(category, category1, searchword);

		System.out.println("사이즈" + list.size());

		map.put("listCount", listCount);
		map.put("list", list);
		map.put("category", category);
		map.put("category1", category1);
		map.put("searchword", searchword);

		return map;
	}

	// 글쓰기
	@Override
	public void insertBoardWrite(One_BoardVo one_BoardVo) {
		// TODO Auto-generated method stub
		one_boardmapper.insertBoardWrite(one_BoardVo);
		System.out.println(one_BoardVo.getBname());
		System.out.println(one_BoardVo.getBcategory());

	}

	@Override
	public One_BoardVo selectBoardView(int id) {
		// TODO Auto-generated method stub
		one_boardmapper.updateBhitAdd(id);
		One_BoardVo one_BoardVo = one_boardmapper.selectBoardView(id);
	
		return one_BoardVo;
	}

	@Override
	public One_BoardVo selectBoardViewPre(int id) {
		// TODO Auto-generated method stub
		One_BoardVo one_BoardVoPre = one_boardmapper.selectBoardViewPre(id);
		return one_BoardVoPre;
	}

	@Override
	public One_BoardVo selectBoardViewNext(int id) {
		// TODO Auto-generated method stub
		One_BoardVo one_BoardVoNext = one_boardmapper.selectBoardViewNext(id);
		return one_BoardVoNext;
	}

	@Override
	public void deleteBoardDelete(int id) {
		one_boardmapper.deleteBoardDelete(id);

	}

	@Override
	public int updateBoardModify(One_BoardVo one_boardVo) {
		int result = one_boardmapper.updateBoardModify(one_boardVo);
		return result;
	}

	@Override
	public void insertBoardReply(One_BoardVo one_BoardVo) {
		// 같은 bgroup에서 현재bstep보다 큰bstep은 1씩증가
		one_boardmapper.updateBoardReplyStepAdd(one_BoardVo);
		// 답변달기 저장
		one_boardmapper.insertBoardReply(one_BoardVo);

	}
	
	/*_______________________시원________________________*/
	@Override
	public ArrayList<One_BoardVo> MemberBoardList(String id) {
		ArrayList<One_BoardVo> list = one_boardmapper.memberBoardList(id);
		return list;
	}

}
