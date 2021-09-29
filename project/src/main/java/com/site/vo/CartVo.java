package com.site.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class CartVo {
	
	private int id, product_id, amount, quantity;
	private String member_id, status;
	
	private String product_name, picture;
	private int price;
	
	
//	//Summary & List 용
//	private int refundAmount;
//	private int refundPrice;
//	
//	private String name;
//	private int totalAmount;
//	private int totalPrice;
//	
//	private String refund_flag;
	
	
}
