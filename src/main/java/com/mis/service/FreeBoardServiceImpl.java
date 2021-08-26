package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.FbFileVO;
import com.mis.domain.FreeBoardVO;
import com.mis.domain.SearchCriteria;
import com.mis.persistence.FbCommentDAO;
import com.mis.persistence.FreeBoardDAO;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Inject
	FreeBoardDAO dao;
	
	@Inject
	FbCommentDAO fDao;

	@Override
	public void register(FreeBoardVO vo) throws Exception {

		// (1) 텍스트에어리어 줄바꿈 적용
		vo.setContent(vo.getContent().replace("\\r\\n", "<br>"));

		// (2) 기본 신청 내역 등록 (파일 등록 x) -> 등록된 신청내역의 PK 가져오기
		int fbNo = dao.create(vo);

		// (3) 추가 이미지 존재 여부 IF문
		if (vo.getFiles() != null) {

			// (4) 추가 이미지 저장 FOR문
			for (int i = 0; i < vo.getFiles().length; i++) {

				// (4-1) 추가 이미지 저장

				FbFileVO fVo = new FbFileVO();
				fVo.setFbNo(fbNo);
				fVo.setFilename(vo.getFiles()[i]);

				// (4-2) 추가 이미지 저장
				dao.insertFile(fVo);

			}
		}

		// dao.create(vo);

	}

	@Override
	public FreeBoardVO read(int fbNo) throws Exception {

		dao.updateViewCount(fbNo);

		return dao.read(fbNo);
	}

	@Override
	public void modify(FreeBoardVO vo) throws Exception {

		// (1) 텍스트에어리어 줄바꿈 적용
		vo.setContent(vo.getContent().replace("\\r\\n", "<br>"));

		// (2) 프로그램 게시글 수정
		dao.update(vo);

		// (3) 프로그램 소속된 첨부파일 삭제
		dao.deleteFile(vo.getFbNo());

		// (4) 추가 이미지 존재 여부 IF문
		if (vo.getFiles() != null) {

			// (5) 추가 이미지 저장 FOR문
			for (int i = 0; i < vo.getFiles().length; i++) {

				// (5-1)추가 이미지 저장

				FbFileVO fVo = new FbFileVO();
				fVo.setFbNo(vo.getFbNo());
				fVo.setFilename(vo.getFiles()[i]);

				// (5-2)추가 이미지 저장
				dao.insertFile(fVo);

			}
		}

		// dao.update(vo);

	}

	@Override
	public void remove(int fbNo) throws Exception {
		
		//게시글 삭제시 1.첨부파일 삭제 2.댓글 삭제 3. 게시글삭제 
		dao.deleteFile(fbNo);
		fDao.deleteAll(fbNo);
		dao.delete(fbNo);

	}

	@Override
	public List<FreeBoardVO> listSearch(SearchCriteria cri) throws Exception {

		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return dao.listSearchCount(cri);
	}

	@Override
	public List<FbFileVO> fileList(int fbNo) throws Exception {
		return dao.fileList(fbNo);
	}

}
