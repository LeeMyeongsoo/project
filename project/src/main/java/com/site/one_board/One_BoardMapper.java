package com.site.one_board;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;


import com.site.vo.One_BoardVo;

@Mapper
public interface One_BoardMapper {

//count
	int selectListCount(String category, String category1, String searchword);

//list
	ArrayList<One_BoardVo> selectBoardList(String category, String category1, String searchword);

//write
	void insertBoardWrite(One_BoardVo one_boardVo);

//view
	One_BoardVo selectBoardView(int id);

//bhit 조회수 추가
	void updateBhitAdd(int id);

//이전글
	One_BoardVo selectBoardViewPre(int id);

//이후글
	One_BoardVo selectBoardViewNext(int id);

//삭제 
	void deleteBoardDelete(int id);

//수정
	int updateBoardModify(One_BoardVo one_boardVo);

// step 증가
	void updateBoardReplyStepAdd(One_BoardVo one_BoardVo);

//게시판 답변달기
	void insertBoardReply(One_BoardVo one_BoardVo);

/*_______________________시원________________________*/
	ArrayList<One_BoardVo> memberBoardList(String id);
}
