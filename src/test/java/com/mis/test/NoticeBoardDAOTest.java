package com.mis.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mis.domain.NoticeBoardVO;
import com.mis.domain.SearchCriteria;
import com.mis.persistence.NoticeBoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**root-context.xml" })
public class NoticeBoardDAOTest {

	@Inject
	private NoticeBoardDAO dao;
/*
	@Test
	public void testCreate() throws Exception {

		NoticeBoardVO board = new NoticeBoardVO();
		board.setTitle("힘겨운 등장");
		board.setContent("메롱메롱.");
		board.setId("song9655");
		dao.create(board);
	}
	@Test
	public void testRead() throws Exception {

		System.out.println(dao.read(2));

	}
 */
	@Test
	public void testUpdate() throws Exception {

		NoticeBoardVO board = new NoticeBoardVO();
		board.setNbNo(22);
		board.setTitle("수정된 제목을 넣습니다2.");
		board.setContent("수정된 글을 넣습니다2.");
		board.setMustRead(1);
		dao.update(board);

	}
	/*

	@Test
	public void testDelete() throws Exception {
		dao.delete(7);
	}

	@Test
	public void testSearchList() throws Exception {

		SearchCriteria cri = new SearchCriteria();
		cri.setSearchType("t");
		cri.setKeyword("수정");

		List<NoticeBoardVO> list = dao.listSearch(cri);
		int totalCnt = dao.listSearchCount(cri);

		System.out.println("=======" + totalCnt);

		for (NoticeBoardVO vo : list) {
			System.out.println(vo);
		}
	}
	
	@Test
	public void testViewCnt() throws Exception {
		dao.updateViewCount(11);
	}
*/
}
