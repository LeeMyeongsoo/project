package com.site.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class One_BoardVo {
	private int id;
	private String member_id;
	private String btitle;
	private String bcontent;
	private String bname;
	private Date bdate;
	private String bupload;
	private int bhit;
	private int bgroup;
	private int bstep;
	private int bindent;
	private String bcategory;
	private String member_type;
}
