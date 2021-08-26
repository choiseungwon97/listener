package com.mis.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mis.domain.MemberVO;
import com.mis.domain.PageMaker;
import com.mis.domain.SearchCriteria;
import com.mis.dto.LoginDTO;
import com.mis.service.MemberService;
import com.mis.service.NoticeBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private MemberService service;
	
	@Inject
	private NoticeBoardService Nservice;

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		
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

		return "user/main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) throws Exception {
		logger.info("login Page........");

	}

	/*
	 * @RequestMapping(value = "/loginPost", method = RequestMethod.POST) public
	 * void loginPost(LoginDTO dto, HttpSession session, Model model,
	 * RedirectAttributes rttr) throws Exception {
	 * 
	 * MemberVO vo = service.login(dto);
	 * 
	 * if (vo == null) { rttr.addFlashAttribute("msg", "정보가 일치하지 않습니다."); return ; }
	 * 
	 * logger.info("MemberVO : " + vo.toString());
	 * 
	 * model.addAttribute("vo", vo);
	 * 
	 * }
	 */
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPost(LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {

		MemberVO vo = service.login(dto);

		if (vo == null) {
			rttr.addFlashAttribute("msg", "정보가 일치하지 않습니다");
			return "redirect:/login";
		}

		logger.info("MemberVO : " + vo.toString());

		model.addAttribute("vo", vo);

		return "loginPost";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		Object obj = session.getAttribute("login");

		if (obj != null) {
			logger.info("logout: session.invalidate() ");

			session.removeAttribute("login");
			session.invalidate();

		}

		return "redirect:/login";
	}

	@RequestMapping(value = "/memberRegister", method = RequestMethod.GET)
	public void memberRegistGET(MemberVO member, Model model) throws Exception {

		// /register get 방식이 호출 되면 -> memberRegister.jsp 실행
		logger.info("register get....");

	}

	
	  @RequestMapping(value = "/memberRegister", method = RequestMethod.POST)
	  public String memberRegistPOST(MemberVO member, RedirectAttributes rttr)
	 throws Exception {
	  
	  // /register post 방식이 호출 되면 -> 게시글 정보를 받아와서 db 저장
	  logger.info("regist post..."); logger.info(member.toString());
	  
	 service.register(member);
	  
	 rttr.addFlashAttribute("msg", "회원가입 성공!");
	  
	 return "redirect:/login"; }
	 
	  // Id 중복등록 체크
	   @RequestMapping(value = "/checkId", method = RequestMethod.GET)
	   @ResponseBody
	   public boolean checkCarName(@RequestParam("id") String id) throws Exception {
	      logger.info("Check id");
	      boolean check = false;
	      int count = service.checkId(id);

	      if (count == 0) {
	         check = true;
	      } else {
	         check = false;
	      }

	      logger.info("Check Val : " + check);

	      return check;
	   }

}
