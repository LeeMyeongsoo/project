package com.site.product;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.site.vo.ProductVo;
import com.site.vo.StoreVo;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Value("${fileUrlProduct}")
	private String fileUrl;
	
	@Autowired
	private ProductService productService;
	
//	상품 리스트
	@GetMapping("/product_list")
	public String productList(@RequestParam(value = "page", defaultValue = "1") int page, 
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord, 
			@RequestParam(value = "classification", defaultValue = "") String classification, 
			@RequestParam(value = "cook_time", defaultValue = "") String cook_time,
			@RequestParam(value= "category", defaultValue = "all") String category,
			Model model) {
		Map<String, Object> productList = productService.productList(page, searchWord, classification, cook_time,category);
		model.addAttribute("productList", productList);
		return "/product/product_list";
	}
	
//	상품 등록 get	
	@GetMapping("/product_register")
	public String productRegister() {
		return "/product/product_register";
	}
	
//	상품 등록 post
	@PostMapping("/productRegister")
	public String productRegister(ProductVo productVo,@RequestParam MultipartFile file) throws Exception {
		// 파일이 첨부가 되어 있으면
		if (file.getSize() != 0) {
			String originFileName = file.getOriginalFilename(); // 원본파일이름 저장
			long time = System.currentTimeMillis();
			// 파일이름
			String uploadFileName = String.format("%d_%s", time, originFileName);
			System.out.println("uploadFileName : " + uploadFileName);

			System.out.println("fileUrl : " + fileUrl);
			// 복사할 파일
			File f = new File(fileUrl + uploadFileName);
			// 파일 업로드
			file.transferTo(f);

			// db에 저장하기 위해 vo에 파일이름을 저장시킴.
			productVo.setPicture(uploadFileName);
		} else {
			productVo.setPicture(""); // 사진을 널값 처리
		}
		int result = productService.productRegister(productVo);
		System.out.println(result);
		return "redirect:/store/product_mypage";
	}
	
// 상품 수정 get
	@GetMapping("/product_modify")
	public String productModify(@RequestParam String id,Model model) {
		ProductVo pVo = productService.productOne(id);
		model.addAttribute("pVo", pVo);
		return "/product/product_modify";
	}
	
//  상품 수정 post
	@PostMapping("/product_modify")
	public String productModify(@RequestParam String id,ProductVo productVo, @RequestParam MultipartFile file) throws Exception {
		System.out.println("id: "+productVo.getId());
		if (file.getSize() != 0) {
			String originFileName = file.getOriginalFilename(); // 원본파일이름 저장
			long time = System.currentTimeMillis();
			// 파일이름
			String uploadFileName = String.format("%d_%s", time, originFileName);
			System.out.println("uploadFileName : " + uploadFileName);

			System.out.println("fileUrl : " + fileUrl);
			// 복사할 파일
			File f = new File(fileUrl + uploadFileName);
			// 파일 업로드
			file.transferTo(f);

			// db에 저장하기 위해 vo에 파일이름을 저장시킴.
			productVo.setPicture(uploadFileName);
		} else {
			productVo.setPicture(""); // 사진을 널값 처리
		}
		int result = productService.productModify(productVo);
		return "redirect:/store/product_mypage";
	}
	
//	상품 뷰
	@GetMapping("/product_view")
	public String productView(@RequestParam String id,Model model) {
		ProductVo productVo = productService.productOne(id);
		StoreVo storeVo = productService.storeOne(productVo.getStore_id());
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pVo", productVo);
		map.put("sVo", storeVo);
		list.add(map);
		model.addAttribute("list", list);
		
		return "/product/product_view";
	}
	
//  상품 삭제
	@RequestMapping("/product_delete")
	public String productDelete(@RequestParam String id) {
		int result =  productService.productDelete(id);
		return "redirect:/store/product_mypage";
	}
	
//  맵-> 상품뷰
	/*
	 * @GetMapping("/product_map_view") public String productMapView(@RequestParam
	 * String id,Model model) { ArrayList<ProductVo> ProductVo productVo =
	 * productService.productMapOne(id); StoreVo storeVo =
	 * productService.storeOne(productVo.getStore_id()); ArrayList<Map<String,
	 * Object>> list = new ArrayList<Map<String,Object>>(); Map<String, Object> map
	 * = new HashMap<String, Object>(); map.put("pVo", productVo); map.put("sVo",
	 * storeVo); list.add(map); model.addAttribute("list", list);
	 * 
	 * return "/product/product_view"; }
	 */

}
