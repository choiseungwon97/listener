package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.NbFileVO;
import com.mis.domain.NoticeBoardVO;
import com.mis.domain.SearchCriteria;
import com.mis.persistence.NoticeBoardDAO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Inject
	private NoticeBoardDAO dao;

	@Override
	public void register(NoticeBoardVO vo) throws Exception {

		// (1) 텍스트에어리어 줄바꿈 적용
		vo.setContent(vo.getContent().replace("\\r\\n", "<br>"));

		// (2) 기본 신청 내역 등록 (파일 등록 x) -> 등록된 신청내역의 PK 가져오기
		int nbNo = dao.create(vo);

		// (3) 추가 이미지 존재 여부 IF문
		if (vo.getFiles() != null) {

			// (4) 추가 이미지 저장 FOR문
			for (int i = 0; i < vo.getFiles().length; i++) {

				// (4-1) 추가 이미지 저장

				NbFileVO fVo = new NbFileVO();
				fVo.setNbNo(nbNo);
				fVo.setFilename(vo.getFiles()[i]);

				// (4-2) 추가 이미지 저장
				dao.insertFile(fVo);

			}
		}

		// dao.create(vo);

	}

	@Override
	public NoticeBoardVO read(int nbNo) throws Exception {
		// 1. read 호출 시 조회 수 +1
		dao.updateViewCount(nbNo);

		// 2. 게시글 정보 return
		return dao.read(nbNo);
	}

	@Override
	public void modify(NoticeBoardVO vo) throws Exception {

		// (1) 텍스트에어리어 줄바꿈 적용
		vo.setContent(vo.getContent().replace("\\r\\n", "<br>"));

		// (2) 프로그램 게시글 수정
		dao.update(vo);

		// (3) 프로그램 소속된 첨부파일 삭제
		dao.deleteFile(vo.getNbNo());

		// (4) 추가 이미지 존재 여부 IF문
		if (vo.getFiles() != null) {

			// (5) 추가 이미지 저장 FOR문
			for (int i = 0; i < vo.getFiles().length; i++) {

				// (5-1)추가 이미지 저장

				NbFileVO fVo = new NbFileVO();
				fVo.setNbNo(vo.getNbNo());
				fVo.setFilename(vo.getFiles()[i]);

				// (5-2)추가 이미지 저장
				dao.insertFile(fVo);

			}
		}

		// dao.update(vo);

	}

	@Override
	public void remove(int nbNo) throws Exception {
		
		dao.deleteFile(nbNo);
		dao.delete(nbNo);

	}

	@Override
	public List<NoticeBoardVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<NbFileVO> fileList(int nbNo) throws Exception {
		return dao.fileList(nbNo);
	}

}
