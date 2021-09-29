package com.site.one_board;

import java.util.ArrayList;
import java.util.Map;

import com.site.vo.One_BoardVo;

public interface One_BoardService {

	Map<String, Object> selectBoardList(String category, String category1, String searchword);

	void insertBoardWrite(One_BoardVo one_boardVo);

	One_BoardVo selectBoardView(int id);

	One_BoardVo selectBoardViewPre(int id);

	One_BoardVo selectBoardViewNext(int id);

	void deleteBoardDelete(int id);

	int updateBoardModify(One_BoardVo one_boardVo);

	void insertBoardReply(One_BoardVo one_BoardVo);
	
	/*_______________________시원________________________*/
	ArrayList<One_BoardVo> MemberBoardList(String id);

}
