package com.mis.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mis.domain.SearchCriteria;
import com.mis.domain.TeamVO;
import com.mis.persistence.TeamDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class TeamDAOTest {
	
	@Inject
	private TeamDAO dao;
	
	/*
	@Test
	public void testCreate() throws Exception {
		
		TeamVO vo = new TeamVO();
		vo.setTeamName("Gato1212");
		vo.setCaptain("연가을");
		vo.setGenre("pop");
		vo.setCaptainPh("01000000");
		vo.setVocal("이지은");
		vo.setVocal2("");
		vo.setGuitar("박해진");
		vo.setGuitar2("");
		vo.setDrum("양만홍");
		vo.setBass("연가을");
		vo.setSynth("장근우");
		vo.setExtra("");
		vo.setMentor(1);
		vo.setSong("여행");
		dao.create(vo);
		
	}
	
	@Test
	public void testRead() throws Exception {
		
		System.out.println(dao.read("ㅎㅇ"));
	
	}
	
	
	@Test
	public void testUpdate() throws Exception {
		
		TeamVO vo = new TeamVO();
		
		vo.setTeamName("ㅎㅇ");
		vo.setCaptain("연가을");
		vo.setCaptainPh("111");
		vo.setGenre("pop");
		vo.setVocal("이지은");
		vo.setVocal2("어피치");
		vo.setGuitar("박해진");
		vo.setGuitar2("미니언");
		vo.setDrum("양만홍");
		vo.setBass("연가을");
		vo.setSynth("장근우");
		vo.setExtra("2");
		vo.setMentor(0);
		vo.setSong("여행sssssssssss");
		dao.update(vo);
		
	}
	*/

	/*
	 * @Test public void testDelete() throws Exception {
	 * 
	 * dao.delete("ㅎㅇ");
	 * 
	 * }
	 * 
	 * @Test public void testListSearch() throws Exception {
	 * 
	 * SearchCriteria cri = new SearchCriteria(); cri.setSearchType("c");
	 * cri.setKeyword("가을");
	 * 
	 * List<TeamVO> list = dao.listSearch(cri); int totalCnt =
	 * dao.listSearchCount(cri);
	 * 
	 * System.out.println("=====" + totalCnt);
	 * 
	 * for(TeamVO vo : list) { System.out.println(vo); }
	 * 
	 * }
	 */
	


}
