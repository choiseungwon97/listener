package com.mis.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mis.domain.FreeBoardVO;
import com.mis.domain.MemberVO;
import com.mis.domain.PageMaker;
import com.mis.domain.SearchCriteria;
import com.mis.service.FreeBoardService;

@Controller
@RequestMapping("/user/freeBoard/*")
public class UserFreeBoardController {

	@Inject
	FreeBoardService service;

	private static final Logger logger = LoggerFactory.getLogger(UserFreeBoardController.class);

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(HttpServletRequest request) throws Exception {
		logger.info("register get.......");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(FreeBoardVO vo, RedirectAttributes rttr) throws Exception {

		service.register(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/user/freeBoard/list";

	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("fbNo") int fbNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		logger.info("readPage.........");

		// requestParam으로 전달받은 cabNo의 상세 정보 가져와서 화면으로 전달
		model.addAttribute(service.read(fbNo));

		// 업로드한 파일 리스트
		logger.info("readPage.FileVO: " + service.fileList(fbNo).size());

		model.addAttribute("fbFileVO", service.fileList(fbNo));

		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());

	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("fbNo") int fbNo, @ModelAttribute("cri") SearchCriteria cri, Model model,
			HttpSession session, RedirectAttributes rttr) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("login");

		FreeBoardVO fb = service.read(fbNo);

		if (member.getId().equals(fb.getId())) {
			// 작성자와 로그인 정보 같음
			model.addAttribute(fb);
			model.addAttribute("fbFileVO", service.fileList(fbNo));
			// 수정 페이지로 이동
			return "/user/freeBoard/modify";

		} else {
			// 로그인 정보와 게시글 작성자가 일치 하지 않은 경우 -> 강제이동
			rttr.addAttribute("fbNo", fbNo);
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("perPageNum", cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword", cri.getKeyword());
			rttr.addFlashAttribute("msg", "로그인 정보가 일치하지 않아 수정 불가능합니다.");

			return "redirect:/user/freeBoard/read";

		}

	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(FreeBoardVO vo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		service.modify(vo);

		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/user/freeBoard/list";

	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("fbNo") int fbNo, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr, HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("login");

		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());

		FreeBoardVO fb = service.read(fbNo);

		if (member.getId().equals(fb.getId())) {
			service.remove(fbNo);
			rttr.addFlashAttribute("msg", "SUCCESS");
			return "redirect:/user/freeBoard/list";
		} else {
			rttr.addAttribute("fbNo", fbNo);
			rttr.addFlashAttribute("msg", "로그인 정보가 일치하지 않아 수정 불가능합니다.");

			return "redirect:/user/freeBoard/read";
		}

	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("list" + cri.toString());

		model.addAttribute("list", service.listSearch(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
}
