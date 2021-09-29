package com.site.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class ProductVo {
	
	private String id, name, picture, store_id, classification, cook_time, content,store_name;
	private int price, quantity, serving;
	private double rate;

}
