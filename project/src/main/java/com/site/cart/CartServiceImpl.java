package com.site.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.vo.CartVo;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartMapper cartMapper;

//	장바구니 담기
	@Override
	public int cartInsert(CartVo cartVo) {
		int result = 0;
		if(cartMapper.cartSelectOne(cartVo)==1) { // 카트에 동일 상품 있는지 확인
			result = cartMapper.cartUpdateOne(cartVo); // 카트에 동일 상품 있을 시 업데이트
		} else {
			result = cartMapper.cartInsert(cartVo); // 카트에 동일 상품 없을 시 추가
		}
		return result; // 추가 또는 변경 성공 시 1, 실패 시 0
	}

//	장바구니 리스트 출력
	@Override
	public Map<String, Object> memberCartList(String member_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<CartVo> list = cartMapper.memberCartList(member_id);
		map.put("list", list);
		return map;
	}

//	장바구니 수량 변경 업데이트
	@Override
	public void cartAmountUpdate(CartVo cartVo) {
		cartMapper.cartAmountUpdate(cartVo);
	}

//	장바구니 하나 삭제
	@Override
	public void cartOneDel(CartVo cartVo) {
		cartMapper.cartOneDel(cartVo);
	}

//	장바구니 선택 삭제
	@Override
	public void cartSelectDel(CartVo cartVo) {
		cartMapper.cartOneDel(cartVo);
	}

//	장바구니 전체 삭제
	@Override
	public int cartAllDel(CartVo cartVo) {
		int result = cartMapper.cartAllDel(cartVo);
		return result;
	}

//	선택한상품만 주문 리스트 출력
	@Override
	public Map<String, Object> orderCartList(List<String> list){
        Map<String, Object> map = new HashMap<String, Object>();
        ArrayList<CartVo> lists = new ArrayList<CartVo>();
        CartVo cartVo = null;
        String cart_id="";
        for(int i=0; i<list.size(); i++){
            cartVo = cartMapper.orderCartList(list.get(i));
            lists.add(cartVo);
            if(i==0) {
            	cart_id+=cartVo.getId();
            }else {
            	cart_id+="/"+cartVo.getId();
            }
        }
        map.put("lists_count", lists.size());
        map.put("lists", lists);
        map.put("cart_id", cart_id);
        return map;
    }
	
}
