package com.site.notice_board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.vo.Notice_BoardVo;

@Service
public class Notice_BoardServiceImpl implements Notice_BoardService {

	@Autowired
	private Notice_BoardMapper notice_boardMapper;

	// 게시글전체리스트
	@Override
	public Map<String, Object> selectBoardList(int page, String category,String category1, String searchWord) {
		// db에서 전체게시글 가져옴.
		Map<String, Object> map = new HashMap<String, Object>();
		int listCount = notice_boardMapper.selectListCount(category,category1,searchWord); // 전체게시글 수
		System.out.println("listCount : " + listCount);
		int limit = 10; // 한페이지에 게시글 수
		int numlimit = 10; // 하단 넘버링 수
		int maxpage = (int) ((double) listCount / limit + 0.99); // 최대페이지 수
		int startpage = (((int) ((double) page / numlimit + 0.99)) - 1) * numlimit + 1; // 하단넘버링 첫번째 수
		int endpage = startpage + numlimit - 1; // 하단넘버링 마지막 수
		if (endpage > maxpage)
			endpage = maxpage; //

		int startrow = (page - 1) * limit + 1; // 페이지에서 게시글 첫번째 가져오는 수
		int endrow = startrow + limit - 1; // 페이지에서 게시글 마지막번째 가져오는 수

		// Mapper로 전달해서 데이터 가져옴.
		ArrayList<Notice_BoardVo> list = notice_boardMapper.selectBoardList(startrow, endrow, category,category1, searchWord);

		// map에 담음.
		map.put("listCount", listCount);
		map.put("page", page);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("list", list);
		map.put("category", category);
		map.put("category1", category1);
		map.put("searchWord", searchWord);
		System.out.println("category : " + category);
		System.out.println("searchWord : " + searchWord);

		return map;
	}

	/*
	 * // 게시글 검색
	 * 
	 * @Override public Map<String, Object> selectSearch(int page,String
	 * category,String searchWord) { //db에서 검색게시글 가져옴. Map<String, Object> map = new
	 * HashMap<String, Object>(); int listCount =
	 * notice_boardMapper.selectSearchCount(category,searchWord); // 전체게시글 수
	 * System.out.println("listCount : "+listCount);
	 * 
	 * int limit = 10; //한페이지에 게시글 수 int numlimit = 10; //하단 넘버링 수 int maxpage =
	 * (int)((double)listCount/limit+0.99); //최대페이지 수 int startpage =
	 * (((int)((double)page/numlimit+0.99))-1)*numlimit+1; //하단넘버링 첫번째 수 int endpage
	 * = startpage+numlimit-1; //하단넘버링 마지막 수 if(endpage>maxpage) endpage=maxpage; //
	 * 
	 * int startrow =(page-1)*limit+1; //페이지에서 게시글 첫번째 가져오는 수 int endrow =
	 * startrow+limit-1; //페이지에서 게시글 마지막번째 가져오는 수
	 * 
	 * //Mapper로 전달해서 데이터 가져옴. ArrayList<Notice_BoardVo> list =
	 * notice_boardMapper.selectBoardSearch(startrow,endrow,category,searchWord);
	 * 
	 * //map에 담음. map.put("listCount", listCount); map.put("page", page);
	 * map.put("maxpage", maxpage); map.put("startpage", startpage);
	 * map.put("endpage", endpage); map.put("list", list); map.put("category",
	 * category); map.put("searchWord", searchWord);
	 * 
	 * return map; }
	 */

	@Override // 뷰
	public Notice_BoardVo selectBoardView(int id) {
		// db에서 게시글 1개 가져옴.
		notice_boardMapper.updateBhitAdd(id);
		Notice_BoardVo notice_boardVo = notice_boardMapper.selectBoardView(id);
		return notice_boardVo;
	}

	@Override // 이전글
	public Notice_BoardVo selectBoardViewPre(int id) {
		Notice_BoardVo notice_boardVoPre = notice_boardMapper.selectBoardViewPre(id);
		return notice_boardVoPre;
	}

	@Override // 다음글
	public Notice_BoardVo selectBoardViewNext(int id) {
		Notice_BoardVo notice_boardVoNext = notice_boardMapper.selectBoardViewNext(id);
		return notice_boardVoNext;
	}

	@Override // 삭제
	public void deleteBoardDelete(int id) {
		notice_boardMapper.deleteBoardDelete(id);

	}

	@Override // 글쓰기
	public void insertBoardWrite(Notice_BoardVo notice_boardVo) {
		notice_boardMapper.insertBoardWrite(notice_boardVo);

	}

	@Override // 수정
	public int updateBoardModify(Notice_BoardVo notice_boardVo) {
		// 수정게시글을 db에 저장
		int result = notice_boardMapper.updateBoardModify(notice_boardVo);
		return result;
	}

	/*
	 * @Override //답글 public void insertBoardReply(Notice_BoardVo notice_boardVo) {
	 * //같은 bgroup에서 현재bstep보다 큰bstep은 1씩증가
	 * notice_boardMapper.updateBoardReplyStepAdd(notice_boardVo); //답변달기 저장
	 * notice_boardMapper.insertBoardReply(notice_boardVo);
	 * 
	 * }
	 */

}
