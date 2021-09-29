package com.site.kakaoPay;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class kakaoPayController {
	
	@RequestMapping("/kakao/kakaoPay")
	@ResponseBody
	public String kakakoPay(@RequestParam int total,
							@RequestParam int count,
							@RequestParam String cart_id,
							@RequestParam(value = "delivery_area",defaultValue = "") String delivery_area,
							@RequestParam String recipient,
							@RequestParam String sender
							) throws Exception {
		System.out.println(delivery_area);
		URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
		System.out.println(delivery_area);
		HttpURLConnection hconn = (HttpURLConnection)url.openConnection();
		hconn.setRequestMethod("POST");
		hconn.setRequestProperty("Authorization", "KakaoAK 2967ecd66fa6a1349ca54a0f6d2e5729");
		hconn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		hconn.setDoOutput(true); // 연결을통해서 서버에 넣어야될께 있는지 아닌지 output 은 디폴트가 false임
		
		//카카오 페이 url 에 담을 파라미터 값들
		String param= "cid=TC0ONETIME";
		param+="&partner_order_id=partner_order_id";
		param+="&partner_user_id=partner_user_id";
		param+="&item_name=product"; //상품 이름
		param+="&quantity="+count; //상품 수량
		param+="&total_amount="+(total+3000); // 상품 총액
		param+="&tax_free_amount=0";
		String encodeResult = URLEncoder.encode("http://localhost:8000/order/success?delivery_area="+delivery_area+"&cart_id="+cart_id+"&recipient="+recipient+"&sender="+sender, "UTF-8");//delivery_area,cart_id 인코딩
		param+="&approval_url="+encodeResult;//인코딩해서 delivery_area, cart_id 받아옴
		param+="&fail_url=http://localhost:8000/";
		param+="&cancel_url=http://localhost:8000/";
		
		OutputStream output = hconn.getOutputStream(); //주는애
		DataOutputStream ds = new DataOutputStream(output);
		ds.writeBytes(param);
		ds.close(); // 
		
		int resultData = hconn.getResponseCode();
		
		InputStream input; //받는애
		
		if(resultData == 200) {
			input = hconn.getInputStream();
		}else {
			input = hconn.getErrorStream();
		}
		
		InputStreamReader reader = new InputStreamReader(input); //받는걸 읽는애
		BufferedReader bReader = new BufferedReader(reader); // 형변환
		
		return bReader.readLine();
	}
}
