package com.site.map;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.vo.StoreVo;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	private MapMapper mapMapper;
	
	@Override
	public ArrayList<StoreVo> storeList() {
		ArrayList<StoreVo> list =  mapMapper.storeListSelect();
		return list;
	}

}
