package com.site.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.vo.ProductVo;
import com.site.vo.StoreVo;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;

//	상품 리스트
	@Override
	public Map<String, Object> productList(int page, String searchWord, String classification, String cook_time,String category) {
		Map<String, Object> productList = new HashMap<String, Object>();
		System.out.println("category: "+category);
		
//		상품 리스트 카운트
		int listCount = productMapper.productCountSelect(searchWord, classification, cook_time,category);
		
		int limit = 8; // 목록에 나타날 게시글 최대 수
		int pageLimit = 10; // 하단 페이지 넘버의 최대 수
		int maxPage = (int)((double)listCount/limit+0.99); // 총게시글/목록최대수+0.99 = 총 페이지
		int startPage = (((int)((double)page/pageLimit+0.99))-1)*limit+1; // 설명 힘듬. 현재페이지가 하단페이지최대수를 넘지않았다면 1 넘는다면 넘은 배수만큼
		int endPage = startPage+pageLimit-1; // 시작페이지에서 하단페이지최대수 만큼 더한 후에 1뺌(1빼는 이유는 10개를 내보내는거지 11개를 내보내는게 아님)
		if(endPage>maxPage) endPage=maxPage; // 만약 끝페이지가 최대페이지를 넘었을 경우
		int startRow = (page-1)*limit+1; // 목록 최대 수 * 현재페이지 + 1 = 해당 시작 레코드
		int endRow = startRow+limit-1; // 시작레코드 + 목록 최대 수 -1
		
		ArrayList<ProductVo> list = productMapper.productList(startRow, endRow, searchWord, classification, cook_time,category);

		productList.put("page", page);
		productList.put("limit", limit);
		productList.put("maxPage", maxPage);
		productList.put("startPage", startPage);
		productList.put("endPage", endPage);
		productList.put("searchWord", searchWord);
		productList.put("classification", classification);
		productList.put("cook_time", cook_time);
		productList.put("category", category);
		productList.put("list", list);
		
		return productList;
	}

//	상품 등록
	@Override
	public int productRegister(ProductVo productVo) {
		int result = productMapper.productRegister(productVo); 
		return result;
	}
//	상품 수정
	@Override
	public int productModify(ProductVo productVo) {
		int result = productMapper.productModify(productVo);
		return result;
	}

//  상품 1개 조회
	@Override
	public ProductVo productOne(String id) {
		ProductVo PVo = productMapper.productOneSelect(id);
		return PVo;
	}

//  상품 1개 조회한 store 정보
	@Override
	public StoreVo storeOne(String id) {
		StoreVo storeVo = productMapper.storeOneSelect(id);
		return storeVo;
	}

	@Override
	public int productDelete(String id) {
		int result = productMapper.productDelete(id);
		return result;
	}

	@Override
	public void productRateUpdate(int product_id) {
		productMapper.productRateUpdate(product_id);
	}

	@Override
	public ArrayList<ProductVo> productTopList() {
		ArrayList<ProductVo> p_list = productMapper.productTopList();
		return p_list;
	}

}
