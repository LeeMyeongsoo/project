package com.site.notice_board;

import java.util.Map;

import com.site.vo.Notice_BoardVo;

public interface Notice_BoardService {

	// 게시판 리스트
	Map<String, Object> selectBoardList(int page, String category, String searchWord, String category1);

	// 게시판 뷰
	Notice_BoardVo selectBoardView(int id);

	// 이전글
	Notice_BoardVo selectBoardViewPre(int id);

	// 다음글
	Notice_BoardVo selectBoardViewNext(int id);

	// 게시판 수정
	int updateBoardModify(Notice_BoardVo notice_boardVo);

	// 게시판 삭제
	void deleteBoardDelete(int id);

	// 게시판 글쓰기
	void insertBoardWrite(Notice_BoardVo notice_boardVo);

	/*
	 * //게시판 답변달기 void insertBoardReply(Notice_BoardVo notice_boardVo);
	 * 
	 * Map<String, Object> selectSearch(int page, String category, String
	 * searchWord);
	 */

}
