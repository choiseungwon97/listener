package com.mis.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mis.domain.PageMaker;
import com.mis.domain.SearchCriteria;
import com.mis.service.CiractBoardService;

@Controller
@RequestMapping("/user/ciractboard/*")
public class UserCiractBoardController {

	@Inject
	CiractBoardService service;

	private static final Logger logger = LoggerFactory.getLogger(UserCiractBoardController.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info("listPage" + cri.toString());

		// 1) cri에 맞는 게시글 정보 담아서 화면으로 전달
		model.addAttribute("list", service.listSearch(cri));

		// 2) 페이징 정보를 담아서 화면으로 전달
		// 2-1) 페이징 정보(cri) 설정
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		// 2-2) 검색과 페이징 정보(cri)에 따른 totalCount 설정
		pageMaker.setTotalCount(service.listSearchCount(cri));

		// 2-3) 화면으로 전달
		model.addAttribute("pageMaker", pageMaker);

	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("cabNo") int cabNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		logger.info("readPage.........");

		// requestParam으로 전달받은 cabNo의 상세 정보 가져와서 화면으로 전달
		model.addAttribute(service.read(cabNo));

		// 업로드한 파일 리스트
		logger.info("readPage.FileVO: " + service.fileList(cabNo).size());

		model.addAttribute("cabFileVO", service.fileList(cabNo));

		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());

	}

	

}
