package com.mis.persistence;

import java.util.List;

import com.mis.domain.FbFileVO;
import com.mis.domain.FreeBoardVO;
import com.mis.domain.SearchCriteria;

public interface FreeBoardDAO {

	public int create(FreeBoardVO vo) throws Exception;

	public FreeBoardVO read(int fbNo) throws Exception;

	public void update(FreeBoardVO vo) throws Exception;

	public void delete(int fbNo) throws Exception;

	public List<FreeBoardVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void updateViewCount(int fbNo) throws Exception;

	// 7. 파일 등록
	public void insertFile(FbFileVO fVo) throws Exception;

	// 8. 파일 삭제
	public void deleteFile(int fbFileNo) throws Exception;

	// 9. 관리자 :: 파일 목록
	public List<FbFileVO> fileList(int fbFileNo) throws Exception;

}
