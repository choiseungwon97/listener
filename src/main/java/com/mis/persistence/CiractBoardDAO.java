package com.mis.persistence;

import java.util.List;

import com.mis.domain.CabFileVO;
import com.mis.domain.CiractBoardVO;
import com.mis.domain.SearchCriteria;

public interface CiractBoardDAO {

	// 신규 글쓰기
	public int create(CiractBoardVO vo) throws Exception;

	// 글 상세보기
	public CiractBoardVO read(int cabNo) throws Exception;

	// 게시글 수정
	public void update(CiractBoardVO vo) throws Exception;

	// 게시글 삭제
	public void delete(int cabNo) throws Exception;

	public List<CiractBoardVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	// 조회수
	public void updateViewCount(int cabNo) throws Exception;

	// 7. 파일 등록
	public void insertFile(CabFileVO fVo) throws Exception;

	// 8. 파일 삭제
	public void deleteFile(int cabFileNo) throws Exception;

	// 9. 관리자 :: 파일 목록
	public List<CabFileVO> fileList(int cabFileNo) throws Exception;

}
