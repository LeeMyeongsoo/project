package com.site.order;

import java.util.ArrayList;
import java.util.Map;

import com.site.vo.ReviewVo;

public interface OrderService {

	//결제완료 배송지,상품번호
	void orderSuccessInsert(String cart_id, String delivery_area, String recipient, String sender);
	//결제완료시 cart테이블 status변경
	void cartStatusUpdate(String cart_id);
	//product의 Quantity(cart의 수량만큼 -1)
	void productQuantityUpdate(String string);
	//member mypage 주문리스트 출력
	Map<String, Object> selectOrderList(String id);
	//store mypage 주문리스트 출력
	Map<String, Object> selectStoreOrderList(String id);
	//주문 status 2 로 수정, 송장번호 추가
	void deliveryStartupdate(String id, String delivery_num);
	
	//구매 확정 버튼 클릭시
	void buyAccessUpdate(String id);
	
	/** 리뷰시작 **/
	//사진을 제외한 review 정보 등록
	void reviewWriteInsert(ReviewVo reviewVo);
	
	//사진 저장
	void reviewPictureInsert(String safeFile, int product_id);
	
	//상위 3개 리뷰 들고오기
	Map<String, Object> reviewTopList();

}
