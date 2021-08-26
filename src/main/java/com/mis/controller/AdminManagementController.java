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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mis.domain.MemberVO;
import com.mis.domain.PageMaker;
import com.mis.domain.SearchCriteria;
import com.mis.service.ManagementService;

@Controller
@RequestMapping("/admin/management/*")
public class AdminManagementController { //회원관리의 경우 관리자만 가능하니 일반사용자 컨트롤러는 필요X?

	@Inject
	ManagementService service;

	private static final Logger logger = LoggerFactory.getLogger(AdminManagementController.class);

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

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("id") String id, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		// requestParam으로 전달받은 cabNo의 상세 정보 가져와서 화면으로 전달
		model.addAttribute(service.read(id));

	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyGET(String id, //HttpSession session, @ModelAttribute("cri") SearchCriteria cri,RedirectAttributes rttr,
			Model model) throws Exception {
		
		 model.addAttribute(service.read(id));
		 
	}

		/*// 수정하려면 로그인한 정보와 글의 작성자의 정보가 동일할 때만 수정 page로 이동

		// 1) 로그인 정보 가져오기
		MemberVO member = (MemberVO) session.getAttribute("login");

		// 2) 게시글 작성자와 로그인 정보를 비교
		// 2-1) 게시글 정보 가져오기
		CiractBoardVO vo = service.read(cabNo);

		// 2-2) 게시글 작성자와 로그인 정보 비교
		if (member.getId().equals(vo.getId())) {
			// 작성자와 로그인 정보 같은 경우
			model.addAttribute(vo);
			// 수정 페이지로 이동
			return "/ciractboard/modifyPage";

		} else {
			// 로그인 정보와 게시글 작성자가 일치하지 않는 경우->강제 이동
			rttr.addAttribute("cabNo", cabNo);
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("perPageNum", cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword", cri.getKeyword());
			rttr.addFlashAttribute("msg", "로그인 정보가 일치하지 않아 수정 불가능합니다.");

			return "redirect:/ciractboard/readPage";

		}
*/
	

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST) // 실제 게시글 데이터베이스 수정
	public String modifyPOST(MemberVO vo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		service.modify(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/management/list";

	}

	
}
