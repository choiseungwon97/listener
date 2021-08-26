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

import com.mis.domain.NoticeBoardVO;
import com.mis.domain.PageMaker;
import com.mis.domain.SearchCriteria;
import com.mis.service.NoticeBoardService;

@Controller
@RequestMapping("/admin/noticeBoard/*")
public class AdminNoticeBoardController {

	private static final Logger logger = LoggerFactory.getLogger(AdminNoticeBoardController.class);

	@Inject
	NoticeBoardService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void ListPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info("listPage" + cri.toString());

		// 1) cri에 맞는 게시글 정보 담아서 화면으로 전달
		model.addAttribute("list", service.listSearch(cri));

		// 2) 페이징 정보를 담아서 화면으로 전달
		// 2-1) 페이징 정보(cri) 설정
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		// 2-2) 검색과 페이지 정보에 따른 totalCount(-> calcData() 실행) 설정
		pageMaker.setTotalCount(service.listSearchCount(cri));

		// 2-3 화면으로 전달
		model.addAttribute("pageMaker", pageMaker);

	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("nbNo") int nbNo, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		// requestParam으로 전달받은 nbNo의 상세 정보 가져와서 화면으로 전달
		model.addAttribute(service.read(nbNo));

		// 업로드한 파일 리스트
		logger.info("readPage.FileVO: " + service.fileList(nbNo).size());

		model.addAttribute("nbFileVO", service.fileList(nbNo));

		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());

	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyPageGET(@RequestParam("nbNo") int nbNo, Model model, @ModelAttribute("cri") SearchCriteria cri)
			throws Exception {

		// modelAttribute는 다른 페이지로 갈때 정보를 주면서 가는 것

		model.addAttribute(service.read(nbNo));
		model.addAttribute("nbFileVO", service.fileList(nbNo));
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPagePOST(NoticeBoardVO vo, RedirectAttributes rttr, @ModelAttribute("cri") SearchCriteria cri)
			throws Exception {

		// RedirectAttributes rttr은 return redirect시 정보를 담아오는 역할을 해주는 것 (rttr이 없으면
		// redirect는 정보를 초기화해서 가져옴)

		logger.info("nb modifyPOST.....");
		logger.info(cri.toString());

		service.modify(vo);

		//rttr.addFlashAttribute("msg", "SUCCESS"); // <- return에 있는 jsp에 script가 있으면됨 // flash에 담은 이유는 일회용이여서(새로고침하면 안뜸)
													// addAttribute는 새로고침해도 정보가 사라지지 않는다
		rttr.addFlashAttribute("vo", vo);

		logger.info(rttr.toString());

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("SearchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");


		return "redirect:/admin/noticeBoard/list";
	}

	// 삭제 POST

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String modifyPagePOST(@RequestParam("nbNo") int nbNo, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr) throws Exception {
		
		logger.info("remove post.....");

		service.remove(nbNo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("SearchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/noticeBoard/list";
	}

	// 등록 GET
	@RequestMapping(value = "/register", method = RequestMethod.GET) // 등록 화면으로 이동
	public void registerGET(HttpServletRequest request) {
		// board/register get방식 호출 되면 -> register.jsp실행
		logger.info("regist get.....");

	}

	// 등록 POST
	@RequestMapping(value = "/register", method = RequestMethod.POST) // 게시글 데이터베이스에 등록
	public String registerPOST(NoticeBoardVO vo, RedirectAttributes rttr) throws Exception {
		
		// board/register POST방식 호출 되면 -> 게시글 정보를 받아와서 DB 저장
		logger.info("notice Register POST .......");
		logger.info("vo : " + vo);

		service.register(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");

		// return "/board/success";
		return "redirect:/admin/noticeBoard/list";
		// 게시글 저장 후 목록 화면으로 강제 이동

	}

}
