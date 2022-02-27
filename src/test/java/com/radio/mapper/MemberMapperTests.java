package com.radio.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

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
@ContextConfiguration(
		{"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Test
	public void testExist() {
		assertNotNull(mapper);
	}
	
	@Test
	public void testInsert() {
		MemberVO vo = new MemberVO();
		vo.setId("yoopang");
		String pw = pwencoder.encode("yoopang123");
		vo.setPassword(pw);
		vo.setName("유팡");
		vo.setEmail("abc@abc");
		vo.setAdd1("ny");
		vo.setAdd2("seoul");
		vo.setAdd3("incheon");
		vo.setAdd4("bada");
		
		assertEquals(1, mapper.register(vo));
		
	}
	
	@Test
	public void testInsertAuth() {
		com.radio.domain.AuthVO authVo = new AuthVO();
		authVo.setId("yoopang");
		authVo.setAuth("ROLE_MEMBER");
		mapper.registerAuth(authVo);
		
		
		
	}
	@Test
	public void testRead() {
		
		MemberVO vo = mapper.read("admin9");
		log.info(vo);
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}

}