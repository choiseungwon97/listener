package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.MemberTeamVO;
import com.mis.domain.TeamVO;
import com.mis.persistence.MemberTeamDAO;

@Service
public class MemberTeamServiceImpl implements MemberTeamService {

	@Inject
	private MemberTeamDAO dao;
	
	@Override
	public List<TeamVO> searchTeam(String teamName) throws Exception {
		return dao.searchTeam(teamName);
	}

	@Override
	public List<TeamVO> teamList(String id) throws Exception {
		  return dao.teamList(id);
	}

	@Override
	public List<MemberTeamVO> everyMtList(String id) throws Exception {
		return dao.everyMtList(id);
	}

	@Override
	public void register(MemberTeamVO vo) throws Exception {
		 // 기본 신청 내역 등록 (파일 등록 x) -> 등록된 신청내역의 PK 가져오기
	      int mtNo = dao.create(vo);
	      System.out.println("mtNo =====> " + mtNo);
	   }
	@Override
	public void remove(int mtNo) throws Exception {
		   dao.delete(mtNo);
		
	}


}
