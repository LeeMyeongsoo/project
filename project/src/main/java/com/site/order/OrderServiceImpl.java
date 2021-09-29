package com.site.order;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.vo.OrderVo;
import com.site.vo.ReviewVo;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;

	
	//결제완료 배송지,상품번호
	@Override
	public void orderSuccessInsert(String cart_id, String delivery_area, String recipient, String sender) {
		orderMapper.orderSuccessInsert(cart_id,delivery_area,recipient,sender);
	}

	//결제완료시 cart테이블 status변경
	@Override
	public void cartStatusUpdate(String cart_id) {
		orderMapper.cartStatusUpdate(cart_id);
	}

	//product의 Quantity(cart의 수량만큼 -1)
	@Override
	public void productQuantityUpdate(String cart_id) {
		orderMapper.productQuantityUpdate(cart_id);
	}
	
	//member mypage 주문리스트 출력
	@Override
	public Map<String, Object> selectOrderList(String id) {
		Map<String, Object> order_map = new HashMap<String, Object>();
		ArrayList<OrderVo> order_list= orderMapper.selectOrderList(id);
		order_map.put("order_list", order_list);
		return order_map;
	}
	
	//store mypage 주문리스트 출력
	@Override
	public Map<String, Object> selectStoreOrderList(String id) {
		Map<String, Object> order_map = new HashMap<String, Object>();
		ArrayList<OrderVo> order_list = orderMapper.selectStoreOrderList(id);
		order_map.put("order_list", order_list);
		return order_map;
	}
	
	//주문 status 2 로 수정, 송장번호 추가
	@Override
	public void deliveryStartupdate(String id,String delivery_num) {
		orderMapper.deliveryStartupdate(id,delivery_num);
	}
	
	//구매 확정 버튼 클릭시
	@Override
	public void buyAccessUpdate(String id) {
		orderMapper.buyAccessUpdate(id);
	}
	
	/** 리뷰시작 **/
	//사진을 제외한 review 정보 등록
	@Override
	public void reviewWriteInsert(ReviewVo reviewVo) {
		orderMapper.reviewWriteInsert(reviewVo);
	}
	
	//사진 저장
	@Override
	public void reviewPictureInsert(String safeFile, int product_id) {
		orderMapper.reviewPicetureInsert(safeFile,product_id);
	}
	
	
	
	@Override
	public Map<String, Object> reviewTopList() {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ReviewVo> r_list = orderMapper.reviewTopList(); //별점 4개이상 리스트 받아오기
		ArrayList<ReviewVo> r_list2 = new ArrayList<ReviewVo>(); //랜덤 3개 리뷰 담을 list
		ArrayList<String> p_list = new ArrayList<String>(); //랜덤3개 사진 받을 list
		Set<Integer> set = new HashSet<Integer>();
		
		if(r_list.size()>=3) {
			for(int i=0;set.size()<3;i++) {
				set.add((int)(Math.random()*r_list.size())+1);
			}
			List<Integer> list = new LinkedList<Integer>(set);
			Collections.sort(list);
			for(int i=0;i<list.size();i++) {
				int index = list.get(i)-1;
				r_list2.add(r_list.get(index));
				String r_topPicture = orderMapper.reviewTopPicture(r_list.get(index).getId());
				System.out.println(r_topPicture);
				p_list.add(r_topPicture);
			}
			map.put("r_list", r_list2);
			map.put("p_list", p_list);
		}else {
			for(int i =0;i<r_list.size();i++) {
				String r_topPicture = orderMapper.reviewTopPicture(r_list.get(i).getId());
				p_list.add(r_topPicture);
			}
			map.put("r_list",r_list);
			map.put("p_list", p_list);
		}
		return map;
	}
}
