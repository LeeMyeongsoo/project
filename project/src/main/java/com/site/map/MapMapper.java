package com.site.map;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import com.site.vo.StoreVo;

@Mapper
public interface MapMapper {

	ArrayList<StoreVo> storeListSelect();

}
