package com.site.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor
public class ReviewVo {
	int id,product_id,rate;
	String member_id,about,review_date,name;
}
