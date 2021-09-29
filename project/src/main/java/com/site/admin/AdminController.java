package com.site.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.member.MemberService;
import com.site.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
//	회원정보리스트
	@GetMapping("/memberList")
	public String memberList() {
		return "/admin/member_list";
	}
	
	@PostMapping("/memberList")
	@ResponseBody
	public Map<String, Object> memberList(@RequestParam(value = "page", defaultValue = "1") int page , @RequestParam @Nullable String category, @RequestParam(value = "order", defaultValue = "asc") String order, @RequestParam @Nullable String searchWord){
		Map<String, Object> map = adminService.memberList(page, category, order, searchWord);
		return map;
	}
	
//	회원정보 수정
	@GetMapping("/memberUpdate")
	public String memberUpdate(@RequestParam String id, Model model) {
		MemberVo memberVo = memberService.updateView(id);
		model.addAttribute(memberVo);
		return "/admin/member_update";
	}
	
	@PostMapping("/memberUpdate")
	@ResponseBody
	public int memberUpdate(MemberVo memberVo) {
		int result = memberService.update(memberVo);
		return result;
	}
	
//	회원정보 수정 아이디 체크
	@RequestMapping("/memberCheckId")
	@ResponseBody
	public int memberCheckId(@RequestParam String id) {
		int result = memberService.registerCheckId(id);
		return result;
	}
	
//	회원정보 삭제
	@RequestMapping("/memberDelete")
	public String memberDelete(@RequestParam String id) {
		int result = adminService.memberDelete(id);
		return "/admin/member_list";
	}

	@GetMapping("/chart")
	public String chart(Model model) {
		Map<String, Object> orderView = adminService.orderView();
		model.addAttribute("orderView", orderView);
		return "/admin/chart";
	}
	
}
