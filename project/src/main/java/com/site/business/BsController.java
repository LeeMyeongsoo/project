package com.site.business;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BsController {

	@Autowired
	private BsService bsService;
	
	//업체 리스트 출력
	@RequestMapping("businessManager")
	public String businessManager(
			@RequestParam(value="page",defaultValue = "1") int page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String searchWord,
			Model model) {
		Map<String, Object> map = bsService.businessList(page,category,searchWord);
		System.out.println(map);
		model.addAttribute("map",map);
		return "/admin/businessManager";
	}
	
	//업체 상세보기
	@RequestMapping("businessmanView")
	public String businessmanView(@RequestParam String id,Model model) {
		System.out.println(id);
		Map<String, Object> map = bsService.businessView(id);
		System.out.println("map : "+map);
		model.addAttribute("map",map);
		return "/admin/businessmanView";
	}
}
