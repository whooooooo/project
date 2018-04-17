package com.mytest.myapp;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/memberReg")

public class Mymemberregcontroller {
	
	@Autowired
	MemberRegService service;
	

	// 회원가입 창을 뜨게 하기위해 만들어놓은 jsp 파일 출력하기위한
	// 메서드.
	@RequestMapping(method = RequestMethod.GET)
	public String memberregcon() {
		return "/form/memberRegForm";
	}

	// 회원가입 완료 창이 뜨기 위해 설정하는 메소드.
/*	@RequestMapping(method = RequestMethod.GET)
	public String member(Member member) {
		return "/form/memberReg";
	}
*/
	@RequestMapping(method = RequestMethod.POST)
	public String memberReg(Member member, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		// 서비스에 회원 데이터 저장 요청
		// 결과 : 1 / 0
		// model 에 저장
		System.out.println(member);

		int resultCnt = service.memberReg(member, request);

		String msg = "정상적으로 처리되었습니다.";

		if (resultCnt == 0)
			msg = "가입 처리가 되지 않았습니다. 담당자에게 문의 해주세요.";

		model.addAttribute("msg", msg);

		return "form/memberReg";
	}

}
