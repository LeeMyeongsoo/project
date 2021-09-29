package com.site.cart;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.CartVo;

@Mapper
public interface CartMapper {

//	장바구니 담기
	int cartSelectOne(CartVo cartVo);
	int cartInsert(CartVo cartVo);
	int cartUpdateOne(CartVo cartVo);

//	장바구니 리스트 출력
	ArrayList<CartVo> memberCartList(String member_id);

//	장바구니 수량 변경 업데이트
	void cartAmountUpdate(CartVo cartVo);

//	장바구니 하나 삭제
//	장바구니 선택 삭제
	void cartOneDel(CartVo cartVo);

//	장바구니 전체 삭제
	int cartAllDel(CartVo cartVo);
	
//	선택한상품만 주문 리스트 출력
	CartVo orderCartList(String list);

}
