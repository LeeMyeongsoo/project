package com.site.product;

import java.util.ArrayList;
import java.util.Map;

import com.site.vo.ProductVo;
import com.site.vo.StoreVo;

public interface ProductService {

	Map<String, Object> productList(int page, String searchWord, String classification, String cook_time, String category);

	int productRegister(ProductVo productVo);

	ProductVo productOne(String id);

	StoreVo storeOne(String id);

	int productModify(ProductVo productVo);

	int productDelete(String id);

	void productRateUpdate(int product_id);

	ArrayList<ProductVo> productTopList();

}
