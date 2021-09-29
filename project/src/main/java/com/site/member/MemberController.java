package com.site.member;

import java.util.ArrayList;
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
import com.site.vo.MemberVo;
import com.site.vo.One_BoardVo;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private One_BoardService one_boardService;
	
	@Autowired
	private OrderService orderService;

//	멤버 로그인
	@PostMapping("/login")
	@ResponseBody
	public int login(@RequestParam String id, @RequestParam String pw, HttpSession session) {
		int result = 0; // 로그인 실패 시
		MemberVo memberVo = memberService.login(id, pw);
		if (memberVo != null) {
			session.setAttribute("session_nickname", memberVo.getNickname());
			session.setAttribute("session_id", id);
			session.setAttribute("session_flag", "success");
			session.setAttribute("session_user", "member");
			session.setAttribute("session_rank", memberVo.getRank());
			result = 1; // 로그인 성공 시
		}
		return result;
	}

//	멤버 회원가입 아이디 체크
	@PostMapping("/registerCheckId")
	@ResponseBody
	public int registerCheckId(@RequestParam String id) {
		int result = memberService.registerCheckId(id);
		return result;
	}
	
//	멤버 회원가입
	@PostMapping("/register")
	@ResponseBody
	public int register(MemberVo memberVo) {
		int result = memberService.register(memberVo);
		return result;
	}

//○○○○○○○○○○○○○○○○○○○○○○○○○○○시원○○○○○○○○○○○○○○○○○○○○○○○○○○○
//	배송조회 팝업
	@GetMapping("/popup")
	public String popup(@RequestParam String delivery_num,Model model) {
		model.addAttribute("delivey_num", delivery_num);
		return "popup/popup";
	}

//  마이페이지
	@RequestMapping("/mypage")
	public String mypage(HttpSession session,Model model) {
		String id = (String)session.getAttribute("session_id");
		// 주문리스트 출력 db 접근
		Map<String, Object> order_map = orderService.selectOrderList(id);
		
		// 게시판리스트 출력 db 접근
		ArrayList<One_BoardVo> list = one_boardService.MemberBoardList(id);
		
		model.addAttribute("mbList", list);
		model.addAttribute("order_map", order_map);
		return "/member/mypage";
	}
//○○○○○○○○○○○○○○○○○○○○○○○○○○○끝○○○○○○○○○○○○○○○○○○○○○○○○○○○○

//★★★★★★★★★★★★★★★★★★★★★명수★★★★★★★★★★★★★★★★★★★★★
//	회원정보 수정페이지 이동
	@GetMapping("/update")
	public String update(HttpSession session, Model model) {
		String id = (String) session.getAttribute("session_id");
		MemberVo memberVo = memberService.updateView(id);
		model.addAttribute("memberVo", memberVo);
		return "member/update";
	}

//	회원정보 수정
	@PostMapping("/update")
	@ResponseBody
	public int update(MemberVo memberVo) {
		int result = memberService.update(memberVo);
		return result;
	}
//★★★★★★★★★★★★★★★★★★★★★끝★★★★★★★★★★★★★★★★★★★★★★

}
