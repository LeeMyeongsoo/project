package com.site.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentsVo {
private int cno;
private String member_id;
private int board_id;
private Date cdate;
private String ccontent;

}



