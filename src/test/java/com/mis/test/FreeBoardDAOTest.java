package com.mis.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mis.domain.FreeBoardVO;
import com.mis.domain.SearchCriteria;
import com.mis.persistence.FreeBoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class FreeBoardDAOTest {

	@Inject
	private FreeBoardDAO dao;

	/*@Test
	public void testCreate() throws Exception {

		FreeBoardVO vo = new FreeBoardVO();
		vo.setTitle("제목제목제목");
		vo.setContent("내용내용내용");
		vo.setYoutubeLink("링크링크");
		vo.setId("hello");
		dao.create(vo);

	}

	@Test
	public void testRead() throws Exception {
		
		System.out.println(dao.read(1));
	
	}*/
	
	@Test
	public void testUpdate() throws Exception {
		
		FreeBoardVO vo = new FreeBoardVO();
		vo.setTitle("자유게시판 제목 수정");
		vo.setContent("자유게시판 내용 수정");
		vo.setYoutubeLink("https://www.youtube.com/watch?v=_Vp4REuS6xk");
		vo.setId("hello");
		dao.create(vo);
		
	}
	
	/*@Test
	public void testDelete() throws Exception {
		
		dao.delete(1);
		
	}*/
	
	@Test
	public void testListSearch() throws Exception {
		
		SearchCriteria cri = new SearchCriteria();
		cri.setSearchType("n");
		cri.setKeyword("회장");
		
		List<FreeBoardVO> list = dao.listSearch(cri);
		int totalCnt = dao.listSearchCount(cri);
		
		System.out.println("====" + totalCnt);
		
		for(FreeBoardVO vo : list) {
			System.out.println(vo);
		}
		
	}
	
	@Test
	public void testViewCnt() throws Exception {
		
		dao.updateViewCount(5);
		
	}

}
