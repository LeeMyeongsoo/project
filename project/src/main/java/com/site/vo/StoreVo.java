package com.site.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class StoreVo {
	
	private String id, pw, nickname, name, dob, gender, email, tel, store_name, store_addr, store_tel, open_hour, close_day, order_way, delivery_area, store_picture, email_flag, sms_flag;
	private int sid, delivery_fee;
	
	private String picture, price;

}