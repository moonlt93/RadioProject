package com.radio.service;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.radio.domain.AuthVO;
import com.radio.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberServiceTests {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	
	@Test
	public void registerTest() {
		MemberVO vo = new MemberVO();
		vo.setId("yoochae");
		String pw = pwencoder.encode("yoochae123");
		vo.setPassword(pw);
		vo.setName("유채");
		vo.setEmail("def@def");
		vo.setAdd1("ny");
		vo.setAdd2("seoul");
		vo.setAdd3("incheon");
		vo.setAdd4("bada");
		
		service.register(vo);
		
	}
	
	@Test
	public void registerAuthTest() {
		AuthVO authVo = new AuthVO();
		authVo.setId("yoochae");
		authVo.setAuth("ROLE_ADMIN");
		
		service.registerAuth(authVo);
	}

}
