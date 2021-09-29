package com.site.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class MemberVo {
	
	private String id, pw, nickname, name, dob, gender, email, tel, addr, addr1, email_flag, sms_flag, rank, picture;
	private int point;

}