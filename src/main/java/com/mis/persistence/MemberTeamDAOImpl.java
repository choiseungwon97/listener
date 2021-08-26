package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.MemberTeamVO;
import com.mis.domain.TeamVO;

@Repository
public class MemberTeamDAOImpl implements MemberTeamDAO {

	 @Inject
	   private SqlSession session;

	   private static String namespace = "com.mis.mapper.MemberTeamMapper";

	@Override
	public List<TeamVO> searchTeam(String teamName) throws Exception {
		return session.selectList(namespace + ".searchTeam", teamName);
	}

	@Override
	public List<TeamVO> teamList(String id) throws Exception {
		 return session.selectList(namespace + ".teamList", id);
	}

	@Override
	public List<MemberTeamVO> everyMtList(String id) throws Exception {
	      return session.selectList(namespace + ".everyMtList", id);

	}

	@Override
	public int create(MemberTeamVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	      return vo.getMtNo();
	}

	@Override
	public void delete(int mtNo) throws Exception {
		 session.delete(namespace + ".delete", mtNo);
		
	}

	}
