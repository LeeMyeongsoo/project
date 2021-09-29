package com.site.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.one_board.One_BoardService;
import com.site.order.OrderService;
import com.site.vo.One_BoardVo;
import com.site.vo.ProductVo;
import com.site.vo.StoreVo;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	@Autowired
	private One_BoardService one_boardService;
	
	@Autowired
	private OrderService orderService;

//	사업자 로그인
	@PostMapping("/login")
	@ResponseBody
	public int login(@RequestParam String id, @RequestParam String pw, HttpSession session) {
		int result = 0;
		StoreVo storeVo = storeService.login(id, pw);
		if (storeVo != null) {
			session.setAttribute("session_nickname", storeVo.getNickname());
			session.setAttribute("session_flag", "success");
			session.setAttribute("session_id", id);
			session.setAttribute("session_user", "store");
			result = 1;
		}
		return result;
	}

//	사업자 회원가입 아이디 체크
	@PostMapping("/registerCheckId")
	@ResponseBody
	public int registerCheckId(@RequestParam String id) {
		int result = storeService.registerCheckId(id);
		return result;
	}

//	사업자 회원가입
	@PostMapping("/register")
	@ResponseBody
	public int register(StoreVo storeVo) {
		int result = storeService.register(storeVo);
		return result;
	}

//○○○○○○○○○○○○○○○○○○○○○○○○○○○시원○○○○○○○○○○○○○○○○○○○○○○○○○○○
//	마이페이지
	@GetMapping("/product_mypage")
	public String p_mypage(HttpSession session, Model model) {
		// 상품 출력 DB 접근
		String id = (String) session.getAttribute("session_id");
		Map<String, Object> map = storeService.storeProductList(id);
		StoreVo storeVo = storeService.updateView(id);
		model.addAttribute("sVo", storeVo);
		model.addAttribute("map", map);
		// 게시판 출력 DB접근
		ArrayList<One_BoardVo> list = one_boardService.MemberBoardList(id);
		model.addAttribute("sbList", list);
		return "/store/product_mypage";
	}

	@RequestMapping("/product_search")
	@ResponseBody
	public Map<String, Object> search(HttpSession session, Model model,
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord) {
		String id = (String) session.getAttribute("session_id");
		ArrayList<ProductVo> list = storeService.searchProduct(id, searchWord);
		System.out.println("list count" + list.size());
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("searchWord : " + searchWord);
		map.put("list", list);
		return map;
	}

	@GetMapping("/order_mypage")
	public String o_mypage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("session_id");
		//주문 출력 DB 접근
		Map<String, Object> order_map = orderService.selectStoreOrderList(id);
		//게시판 출력 DB 접근
		ArrayList<One_BoardVo> list = one_boardService.MemberBoardList(id);
		model.addAttribute("order_map", order_map);
		model.addAttribute("sbList", list);
		return "/store/order_mypage";
	}
	
//○○○○○○○○○○○○○○○○○○○○○○○○○○○끝○○○○○○○○○○○○○○○○○○○○○○○○○○○○

//★★★★★★★★★★★★★★★★★★★★★명수★★★★★★★★★★★★★★★★★★★★★
//	판매자정보 수정페이지 이동
	@GetMapping("/update")
	public String storeupdate(HttpSession session, Model model) {
		String id = (String) session.getAttribute("session_id");
		StoreVo storeVo = storeService.updateView(id);
		model.addAttribute("storeVo", storeVo);

		return "store/storeupdate";
	}

//	판매자정보 수정
	@PostMapping("/update")
	@ResponseBody
	public int storeupdate(StoreVo storeVo) {
		int result = storeService.update(storeVo);
		return result;
	}
//★★★★★★★★★★★★★★★★★★★★★끝★★★★★★★★★★★★★★★★★★★★★★

}
