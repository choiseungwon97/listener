package com.mis.service;

import java.util.List;

import com.mis.domain.MemberTeamVO;
import com.mis.domain.TeamVO;

public interface MemberTeamService {

	 // 1. 학생 :: 진로 선택 팝업창 -> 진로명 검생 결과 페이지
	   public List<TeamVO> searchTeam(String teamName) throws Exception;

	   // 2. 학생 :: myPage/myScore -> 진로 목록 팝업창
	   public List<TeamVO> teamList(String id) throws Exception;

	   // 3. 학생 :: 선택한 진로 목록
	   public List<MemberTeamVO> everyMtList(String id) throws Exception;

	   // 4. 학생 :: myPage/myScore -> 학생 진로 등록
	   public void register(MemberTeamVO vo) throws Exception;

	   // 5. 학생 :: myPage -> 선택한 진로 삭제
	   public void remove(int mtNo) throws Exception;
	
}
