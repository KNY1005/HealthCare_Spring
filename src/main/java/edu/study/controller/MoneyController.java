package edu.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping(value="/shot",produces="text/plain;charset=UTF-8")
@Controller
public class MoneyController {
	@ResponseBody	//ajax 응답데이터 만들어서 넘김(화면에 뿌림),ResponseBody 어노테이션 필수
	@RequestMapping(value="/payments/complete", method = RequestMethod.GET)
	public String callStr() {
		return "shot/shotMoney3";	//스프링이 알아서 출력
	}
}
