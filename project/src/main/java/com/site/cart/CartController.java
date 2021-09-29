package com.site.cart;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.vo.CartVo;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;
	
//	장바구니 담기
	@RequestMapping("/cartInsert")
	@ResponseBody
	public int cartInsert(CartVo cartVo, HttpSession session) {
		String member_id = (String) session.getAttribute("session_id");
		cartVo.setMember_id(member_id);
		int result = cartService.cartInsert(cartVo);
		return result;
	}
	
//	장바구니 리스트 출력
	@RequestMapping("/memberCartList")
	public String memberCartList(HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("session_id");
		Map<String, Object> map = cartService.memberCartList(member_id);
		model.addAttribute("map", map);
		System.out.println(model);
		return "/member/cart";
	}
	
//	장바구니 수량 변경 업데이트
	@RequestMapping("/cartAmountUpdate")
	@ResponseBody
	public void cartAmountUpdate(CartVo cartVo) {
		cartService.cartAmountUpdate(cartVo);
	}
	
//	장바구니 하나 삭제
	@RequestMapping("/cartOneDel")
	@ResponseBody
	public void cartOneDel(CartVo cartVo) {
		cartService.cartOneDel(cartVo);
	}
	
//	장바구니 선택 삭제
	@RequestMapping("/cartSelectDel")
	@ResponseBody
	public int cartSelectDel(@RequestParam int[] id, HttpSession session) {
		String member_id = (String) session.getAttribute("session_id");
		CartVo cartVo = new CartVo();
		cartVo.setMember_id(member_id);
		for(int i=0; i<id.length; i++) {
			cartVo.setId(id[i]);
			cartService.cartSelectDel(cartVo);
		}
		return id.length;
	}
	
//	장바구니 전체 삭제
	@RequestMapping("/cartAllDel")
	@ResponseBody
	public int cartAllDel(HttpSession session) {
		String member_id = (String) session.getAttribute("session_id");
		CartVo cartVo = new CartVo();
		cartVo.setMember_id(member_id);
		int result = cartService.cartAllDel(cartVo);
		return result;
	}

}
