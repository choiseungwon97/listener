package com.mis.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mis.domain.FbCommentVO;
import com.mis.service.FbCommentService;

@RestController
@RequestMapping("/fbComment")
public class FbCommentController {

	@Inject
	private FbCommentService service;

	private static final Logger logger = LoggerFactory.getLogger(FbCommentController.class);

	// 1. 자유게시판 - 댓글 생성
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody FbCommentVO vo) {

		ResponseEntity<String> entity = null;

		try {
			service.add(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);

			logger.info("Comment get.,...........");
		}
		return entity;

	}

	// 2. 자유게시판 - 댓글 삭제
	@RequestMapping(value = "/{FbCommentNo}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("FbCommentNo") int fbCommentNo) {
		System.out.println("/{FbCommentNo} : " + fbCommentNo);
		ResponseEntity<String> entity = null;
		try {
			service.remove(fbCommentNo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 3.자유 게시판- 댓글 전체 보기
	@RequestMapping(value = "/all/{fbNo}", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity<List<FbCommentVO>> list(@PathVariable("fbNo") int fbNo) {

		System.out.println("/all/{fbNo} : " + fbNo);
		ResponseEntity<List<FbCommentVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.list(fbNo), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}