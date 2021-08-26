package com.mis.persistence;

import java.util.List;

import com.mis.domain.NbFileVO;
import com.mis.domain.NoticeBoardVO;
import com.mis.domain.SearchCriteria;

public interface NoticeBoardDAO {

	// 공지사항 게시글 작성
	public int create(NoticeBoardVO vo) throws Exception;

	// 공지사항 게시글 상세보기
	public NoticeBoardVO read(int nbNo) throws Exception;

	// 공지사항 게시글 수정
	public void update(NoticeBoardVO vo) throws Exception;

	// 공지사항 게시글 삭제
	public void delete(int nbNo) throws Exception;

	// 페이징, 검색 기능을 제공하는 list 가져오는 기능
	public List<NoticeBoardVO> listSearch(SearchCriteria cri) throws Exception;

	// 페이징, 검색 기능 게시글 수 가져오는 기능
	public int listSearchCount(SearchCriteria cri) throws Exception;

	// 게시글의 조회수 업데이트 기능
	public void updateViewCount(int nbNo) throws Exception;

	// 7. 파일 등록
	public void insertFile(NbFileVO fVo) throws Exception;

	// 8. 파일 삭제
	public void deleteFile(int nbFileNo) throws Exception;

	// 9. 관리자 :: 파일 목록
	public List<NbFileVO> fileList(int nbFileNo) throws Exception;

}