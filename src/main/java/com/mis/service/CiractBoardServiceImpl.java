package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.CabFileVO;
import com.mis.domain.CiractBoardVO;
import com.mis.domain.SearchCriteria;
import com.mis.persistence.CabCommentDAO;
import com.mis.persistence.CiractBoardDAO;

@Service
public class CiractBoardServiceImpl implements CiractBoardService{
	
	@Inject
	CiractBoardDAO dao;
	
	@Inject
	CabCommentDAO cDao;

	@Override
	public void register(CiractBoardVO vo) throws Exception {
		
		 // (1) 텍스트에어리어 줄바꿈 적용
	      vo.setContent(vo.getContent().replace("\\r\\n", "<br>"));
	      
	      // (2) 기본 신청 내역 등록 (파일 등록 x) -> 등록된 신청내역의 PK 가져오기
	      int cabNo = dao.create(vo);
	     
	      
	      // (3) 추가 이미지 존재 여부 IF문
	         if (vo.getFiles() != null) {

	            // (4) 추가 이미지 저장 FOR문
	            for (int i = 0; i < vo.getFiles().length; i++) {

	               // (4-1) 추가 이미지 저장

	               CabFileVO fVo = new CabFileVO();
	               fVo.setCabNo(cabNo);
	               fVo.setFilename(vo.getFiles()[i]);

	            
	               // (4-2) 추가 이미지 저장
	               dao.insertFile(fVo);

	            }
	         }
		
		//dao.create(vo);
		
	}

	@Override
	public CiractBoardVO read(int cabNo) throws Exception {
		
		dao.updateViewCount(cabNo);
		
		return dao.read(cabNo);
	}

	@Override
	public void modify(CiractBoardVO vo) throws Exception {
		
		 // (1) 텍스트에어리어 줄바꿈 적용
	      vo.setContent(vo.getContent().replace("\\r\\n", "<br>"));
	      
	      // (2) 프로그램 게시글 수정
	      dao.update(vo);

	      // (3) 프로그램 소속된 첨부파일 삭제
	      dao.deleteFile(vo.getCabNo());
	      
	      // (4) 추가 이미지 존재 여부 IF문
	         if (vo.getFiles() != null) {

	            // (5) 추가 이미지 저장 FOR문
	            for (int i = 0; i < vo.getFiles().length; i++) {

	               // (5-1)추가 이미지 저장

	               CabFileVO fVo = new CabFileVO();
	               fVo.setCabNo(vo.getCabNo());
	               fVo.setFilename(vo.getFiles()[i]);

	              

	               // (5-2)추가 이미지 저장
	               dao.insertFile(fVo);

	            }
	         }
		
		
		//dao.update(vo);
	}

	@Override
	public void remove(int cabNo) throws Exception {
		
		//1)공지사항에 속해있는 첨부 파일 삭제
		dao.deleteFile(cabNo);
		cDao.deleteAll(cabNo);
		dao.delete(cabNo);
		
	}

	@Override
	public List<CiractBoardVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<CabFileVO> fileList(int cabNo) throws Exception {
		return dao.fileList(cabNo);
	}
	
	
	
	

}
