package com.mis.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mis.domain.PageMaker;
import com.mis.domain.SearchCriteria;
import com.mis.dto.LoginDTO;
import com.mis.service.MemberService;
import com.mis.service.NoticeBoardService;

@Controller
@RequestMapping("/admin")
public class AdminMainController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMainController.class);
	
	@Inject
	private MemberService service;
	
	@Inject
	private NoticeBoardService Nservice;
	
	@RequestMapping("/main")
	public void main(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("Member Main.......");
		
		// 1) cri에 맞는 게시글 정보 담아서 화면으로 전달
				model.addAttribute("list", Nservice.listSearch(cri));

				// 2) 페이징 정보를 담아서 화면으로 전달
				// 2-1) 페이징 정보(cri) 설정
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCri(cri);

				// 2-2) 검색과 페이지 정보에 따른 totalCount(-> calcData() 실행) 설정
				pageMaker.setTotalCount(Nservice.listSearchCount(cri));

				// 2-3 화면으로 전달
				model.addAttribute("pageMaker", pageMaker);
	}
	

}
