package com.site.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.order.OrderService;
import com.site.product.ProductService;
import com.site.vo.ProductVo;
import com.site.vo.ReviewVo;

@Controller
public class MainController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("index")
	public String index(Model model) {
		ArrayList<ProductVo> p_list = productService.productTopList();
		Map<String, Object> map = orderService.reviewTopList();
		model.addAttribute("p_list", p_list);
		model.addAttribute("map", map);
		return "/index";
	}
	
	@GetMapping("/login")
	public String login() {
		return "/login";
	}
	
	@GetMapping("/register")
	public String register() {
		return "/register";
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "/logout";
	}

}
