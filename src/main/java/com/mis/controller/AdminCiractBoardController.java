package com.mis.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mis.domain.CiractBoardVO;
import com.mis.domain.PageMaker;
import com.mis.domain.SearchCriteria;
import com.mis.service.CiractBoardService;

@Controller
@RequestMapping("/admin/ciractboard/*")
public class AdminCiractBoardController {

	@Inject
	CiractBoardService service;

	private static final Logger logger = LoggerFactory.getLogger(AdminCiractBoardController.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info("listPage" + cri.toString());

		// 1) cri에 맞는 게시글 정보 담아서 화면으로 전달
		model.addAttribute("list", service.listSearch(cri));
		logger.info("list size: " + service.listSearch(cri).size());

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

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("cabNo") int cabNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		logger.info("cab modifyGET....");

		model.addAttribute(service.read(cabNo));
		model.addAttribute("cabFileVO", service.fileList(cabNo));


	}

	/*
	 * // 수정하려면 로그인한 정보와 글의 작성자의 정보가 동일할 때만 수정 page로 이동
	 * 
	 * // 1) 로그인 정보 가져오기 MemberVO member = (MemberVO) session.getAttribute("login");
	 * 
	 * // 2) 게시글 작성자와 로그인 정보를 비교 // 2-1) 게시글 정보 가져오기 CiractBoardVO vo =
	 * service.read(cabNo);
	 * 
	 * // 2-2) 게시글 작성자와 로그인 정보 비교 if (member.getId().equals(vo.getId())) { // 작성자와
	 * 로그인 정보 같은 경우 model.addAttribute(vo); // 수정 페이지로 이동 return
	 * "/ciractboard/modifyPage";
	 * 
	 * } else { // 로그인 정보와 게시글 작성자가 일치하지 않는 경우->강제 이동 rttr.addAttribute("cabNo",
	 * cabNo); rttr.addAttribute("page", cri.getPage());
	 * rttr.addAttribute("perPageNum", cri.getPerPageNum());
	 * rttr.addAttribute("searchType", cri.getSearchType());
	 * rttr.addAttribute("keyword", cri.getKeyword()); rttr.addFlashAttribute("msg",
	 * "로그인 정보가 일치하지 않아 수정 불가능합니다.");
	 * 
	 * return "redirect:/ciractboard/readPage";
	 * 
	 * }
	 */

	@RequestMapping(value = "/modify", method = RequestMethod.POST) // 실제 게시글 데이터베이스 수정
	public String modifyPOST(CiractBoardVO vo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		logger.info("cab modifyPOST.....");
		logger.info(cri.toString());

		service.modify(vo);

		rttr.addFlashAttribute("msg", "MODIFY");
		rttr.addFlashAttribute("vo", vo);

		logger.info(rttr.toString());

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");


		return "redirect:/admin/ciractboard/list";

	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("cabNo") int cabNo, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr) throws Exception {

		service.remove(cabNo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/ciractboard/list";

		/*
		 * // 수정하려면 로그인한 정보와 글의 작성자의 정보가 동일할 때만 수정 page로 이동
		 * 
		 * // 1) 로그인 정보 가져오기 MemberVO member = (MemberVO) session.getAttribute("login");
		 * 
		 * rttr.addAttribute("page", cri.getPage()); rttr.addAttribute("perPageNum",
		 * cri.getPerPageNum()); rttr.addAttribute("searchType", cri.getSearchType());
		 * rttr.addAttribute("keyword", cri.getKeyword());
		 * 
		 * // 2) 게시글 작성자와 로그인 정보를 비교 // 2-1) 게시글 정보 가져오기 CiractBoardVO vo =
		 * service.read(cabNo);
		 * 
		 * // 2-2) 게시글 작성자와 로그인 정보 비교 if (member.getId().equals(vo.getId())) { // 작성자와
		 * 로그인 정보 같은 경우->삭제 service.remove(cabNo); rttr.addFlashAttribute("msg",
		 * "SUCCESS"); return "redirect:/ciractboard/list";
		 * 
		 * } else { // 로그인 정보와 게시글 작성자가 일치하지 않는 경우-> 삭제하지 않고 강제 이동
		 * rttr.addAttribute("cabNo", cabNo); rttr.addFlashAttribute("msg",
		 * "로그인 정보가 일치하지 않아 삭제 불가능합니다.");
		 * 
		 * return "redirect:/ciractboard/readPage";
		 * 
		 * }
		 */
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET) // 등록 화면으로 이동
	public void registerGet(HttpServletRequest request) throws Exception {

		logger.info("register get.........");
	}

	/*
	 * // 1) 로그인 정보 가져오기 MemberVO member = (MemberVO) session.getAttribute("login");
	 * 
	 * // 2) 게시글 작성자와 로그인 정보를 비교 // 2-1) 게시글 정보 가져오기 CiractBoardVO vo =
	 * service.read(cabNo);
	 * 
	 * // 2-2) 게시글 작성자와 로그인 정보 비교 if (member.getId().equals(vo.getId())) { // 작성자와
	 * 로그인 정보 같은 경우 model.addAttribute(vo); logger.info("register get........."); //
	 * 수정 페이지로 이동 return "/ciractboard/register";
	 * 
	 * } else { // 로그인 정보와 게시글 작성자가 일치하지 않는 경우->강제 이동 rttr.addAttribute("cabNo",
	 * cabNo); rttr.addAttribute("page", cri.getPage());
	 * rttr.addAttribute("perPageNum", cri.getPerPageNum());
	 * rttr.addAttribute("searchType", cri.getSearchType());
	 * rttr.addAttribute("keyword", cri.getKeyword()); rttr.addFlashAttribute("msg",
	 * "로그인 정보가 일치하지 않아 등록 불가능합니다.");
	 * 
	 * return "redirect:/ciractboard/list";
	 * 
	 * }
	 */

	@RequestMapping(value = "/register", method = RequestMethod.POST) // 게시글 데이터베이스에 등록
	public String registerPOST(CiractBoardVO vo, RedirectAttributes rttr) throws Exception {

		logger.info("notice Register POST .......");
		logger.info("vo : " + vo);

		service.register(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");

		// return "/board/success";
		return "redirect:/admin/ciractboard/list";
		// 게시글 저장 후 목록 화면으로 강제 이동

	}

}
