package com.radio.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.radio.domain.CenterVO;
import com.radio.domain.Criteria;
import com.radio.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		{"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class CenterMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private CenterMapper mapper;
	
	@Test
	public void registerMapper() {
		CenterVO vo = new CenterVO(); 
		vo.setMember_id("yura1");
		vo.setCenter_name("장유라"); 
		vo.setCenter_email("dbfk931@naver.com");
		vo.setCenter_type("로그인/회원");
		vo.setCenter_title("----로그인-----");
		vo.setCenter_content("---- 잘되용-----");
		
		assertEquals(1, mapper.register(vo));
	}
	
	@Test
	public void pagingMapper() {	
		Criteria cri = new Criteria(1, 5);
		
		List<CenterVO> list = mapper.center_list(cri);
		
		assertEquals(5, list.size()); 
		log.info(list);
	}
	
	@Test
	public void readMapper() {
		Long bno = 28L;
		CenterVO vo = new CenterVO();		
		vo = mapper.getRead(bno);	
		
		assertNotNull(vo);
		
		log.info(vo);
		
	}

	@Test
	public void deleteMapper() {
		Long bno = 82L;
		int a = mapper.delete(bno);
		log.info(a);
		assertEquals(1,a);
	}
	
	@Test
	public void com_RegisterTest(){
		CenterVO vo = new CenterVO();
		vo.setMember_id("yura1");
		vo.setCenter_name("장유라"); 
		vo.setCenter_email("dbfk931@naver.com");
		vo.setCenter_type("로그인/회원");
		vo.setCenter_title("----로그인-----");
		vo.setCenter_content("---- 잘되용-----");
		vo.setCenter_reply("꺄르륵");

		mapper.com_register(vo);
		
	}
	
}
