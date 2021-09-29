package com.site.store;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.site.vo.ProductVo;
import com.site.vo.StoreVo;

@Mapper
public interface StoreMapper {

//	업체 로그인
	StoreVo selectId(String id);
	
//	업체 회원가입 아이디 체크
	int registerCheckId(String id);

//	업체 회원가입
	int register(StoreVo storeVo);
	
//○○○○○○○○○○○○○○○○○○○○○○○○○○○시원○○○○○○○○○○○○○○○○○○○○○○○○○○○
	ArrayList<ProductVo> storeProductList(String id);

	int storeProductCount(String id);

	ArrayList<ProductVo> searchListSelect(String id,String searchWord);
//○○○○○○○○○○○○○○○○○○○○○○○○○○○끝○○○○○○○○○○○○○○○○○○○○○○○○○○○○

//★★★★★★★★★★★★★★★★★★★★★명수★★★★★★★★★★★★★★★★★★★★★
//	판매자정보 수정
	int update(StoreVo storeVo);
//★★★★★★★★★★★★★★★★★★★★★끝★★★★★★★★★★★★★★★★★★★★★★

}
