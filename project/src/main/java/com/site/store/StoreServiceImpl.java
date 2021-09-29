package com.site.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.site.vo.ProductVo;
import com.site.vo.StoreVo;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreMapper storeMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

//	업체 로그인
	@Override
	public StoreVo login(String id, String pw) {
		StoreVo storeVo = storeMapper.selectId(id);
		if(passwordEncoder.matches(pw, storeVo.getPw())) {
			//로그인 되었다는 logger 하나 두면 좋을듯?
		} else {
			storeVo = null;
		}
		return storeVo;
	}

//	업체 회원가입 아이디 체크
	@Override
	public int registerCheckId(String id) {
		int result = storeMapper.registerCheckId(id);
		return result;
	}
	
//	업체 회원가입
	@Override
	public int register(StoreVo storeVo) {
		storeVo.setPw(passwordEncoder.encode(storeVo.getPw()));
		int result = storeMapper.register(storeVo);
		return result;
	}
	
//○○○○○○○○○○○○○○○○○○○○○○○○○○○시원○○○○○○○○○○○○○○○○○○○○○○○○○○○
	@Override
	public Map<String, Object> storeProductList(String id) {
		Map<String,Object> map = new HashMap<String, Object>();
		ArrayList<ProductVo> pList = storeMapper.storeProductList(id);
		map.put("pList", pList);
		return map;
	}

	@Override
	public ArrayList<ProductVo> searchProduct(String id,String searchWord) {
		ArrayList<ProductVo> list = storeMapper.searchListSelect(id,searchWord);
		return list;
	}
//○○○○○○○○○○○○○○○○○○○○○○○○○○○끝○○○○○○○○○○○○○○○○○○○○○○○○○○○○

//★★★★★★★★★★★★★★★★★★★★★명수★★★★★★★★★★★★★★★★★★★★★
//	판매자정보 수정페이지 이동
	@Override
	public StoreVo updateView(String id) {
		StoreVo storeVo = storeMapper.selectId(id);
		return storeVo;
	}

//	판매자정보 수정
	@Override
	public int update(StoreVo storeVo) {
		int rs = storeMapper.update(storeVo);
		return rs;
	}
//★★★★★★★★★★★★★★★★★★★★★끝★★★★★★★★★★★★★★★★★★★★★★

}
