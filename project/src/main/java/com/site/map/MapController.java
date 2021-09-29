package com.site.map;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.vo.StoreVo;

@Controller
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	@RequestMapping("map")
	public String map(Model model) {
		ArrayList<StoreVo> list = mapService.storeList();
		model.addAttribute("list", list);
		return "/map/map";
	}
}
