package com.mis.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mis.domain.MemberVO;
import com.mis.dto.LoginDTO;
import com.mis.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class MemberDAOTest {
	
	@Inject
	private MemberDAO dao;
	
	
	
	@Test 
	public void testUser00() throws Exception{
		LoginDTO dto = new LoginDTO();
	    dto.setId("user00");
	    dto.setPw("user00");
		
	System.out.println(dao.login(dto)); 
	}
	

	

	
}
