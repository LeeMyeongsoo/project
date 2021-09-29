package com.site.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderVo {

	private int id, product_id, product_number;
	
	private String member_id,
					refund_flag,//환불상태
					status,//주문상태
					recipient,//받는사람
					sender,//보내는사람
					payment_way,//결제방법
					delivery_area; // 배송지
	
	private Timestamp order_date;//주문날짜
	
	
	private int price, amount;
	private String picture, name, delivery_num, orderdate;
	
//	private String totalAmount, totalPrice, month, year;
//	
//	
//	
//	private String product_name;
//	private int amount; 
//	private int quantity; 
}
