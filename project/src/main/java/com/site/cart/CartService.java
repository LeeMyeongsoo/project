package com.site.cart;

import java.util.List;
import java.util.Map;

import com.site.vo.CartVo;

public interface CartService {

	int cartInsert(CartVo cartVo);

	Map<String, Object> memberCartList(String member_id);

	void cartAmountUpdate(CartVo cartVo);

	void cartOneDel(CartVo cartVo);

	void cartSelectDel(CartVo cartVo);

	int cartAllDel(CartVo cartVo);

	//선택한상품만 주문 리스트 출력
	Map<String, Object> orderCartList(List<String> list);

}
