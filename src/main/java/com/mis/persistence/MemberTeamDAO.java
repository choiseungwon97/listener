package com.mis.persistence;

import java.util.List;

import com.mis.domain.MemberTeamVO;
import com.mis.domain.TeamVO;

public interface MemberTeamDAO {

	// 1. 학생 :: 팀 선택 팝업창 -> 팀명 검생 결과 페이지
	public List<TeamVO> searchTeam(String teamName) throws Exception;

	// 2. 학생 :: myPage/myTeam -> 팀 목록 팝업창
	public List<TeamVO> teamList(String id) throws Exception;

	// 3. 학생 :: 선택한 팀 목록
	public List<MemberTeamVO> everyMtList(String id) throws Exception;

	// 4. 학생 :: myPage/myScore -> 학생 팀 등록
	public int create(MemberTeamVO vo) throws Exception;

	// 5. 학생 :: myPage -> 선택한 팀 삭제
	public void delete(int mtNo) throws Exception;

}
