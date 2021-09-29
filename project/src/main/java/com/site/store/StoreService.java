package com.site.store;

import java.util.ArrayList;
import java.util.Map;

import com.site.vo.ProductVo;
import com.site.vo.StoreVo;

public interface StoreService {

//	사업자 로그인
	StoreVo login(String id, String pw);
	
//	사업자 회원가입 아이디 체크
	int registerCheckId(String id);

//	사업자 회원가입
	int register(StoreVo storeVo);
	
//○○○○○○○○○○○○○○○○○○○○○○○○○○○시원○○○○○○○○○○○○○○○○○○○○○○○○○○○
	Map<String, Object> storeProductList(String id);

	ArrayList<ProductVo> searchProduct(String id, String searchWord);
//○○○○○○○○○○○○○○○○○○○○○○○○○○○끝○○○○○○○○○○○○○○○○○○○○○○○○○○○○

//★★★★★★★★★★★★★★★★★★★★★명수★★★★★★★★★★★★★★★★★★★★★
//	판매자정보 수정페이지 이동
	StoreVo updateView(String id);

//	판매자정보 수정
	int update(StoreVo storeVo);
//★★★★★★★★★★★★★★★★★★★★★끝★★★★★★★★★★★★★★★★★★★★★★

}
