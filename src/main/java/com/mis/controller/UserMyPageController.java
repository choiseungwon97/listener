package com.mis.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mis.domain.MemberTeamVO;
import com.mis.domain.MemberVO;
import com.mis.service.MemberTeamService;
import com.mis.service.MyPageService;

@Controller
@RequestMapping("/user/mypage/*")
public class UserMyPageController {

	private static final Logger logger = LoggerFactory.getLogger(UserMyPageController.class);

	@Inject
	MyPageService service;
	
	 @Inject
     private MemberTeamService MTservice;

	// 1. 내정보확인 페이지
	   @RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	   public void myInfoGET(HttpServletRequest request, Model model) throws Exception {

	     // logger.info("user myPageGET..............");

	      HttpSession session = request.getSession();

	      MemberVO vo = (MemberVO) session.getAttribute("login");

	      String id = vo.getId();
	      System.out.println(id);

	      model.addAttribute(service.myInfo(id));
	      model.addAttribute(MTservice.everyMtList(id));
	      model.addAttribute("everyMtList", MTservice.everyMtList(id));

	   }

	   // 2. 내정보 수정폼으로 이동
	   @RequestMapping(value = "/myInfoUpdate", method = RequestMethod.GET)
	   public void myInfoUpdateGET(@RequestParam("id") String id, Model model) throws Exception {


	      model.addAttribute(service.myInfo(id));
	   }

	   // 3. 내정보 수정
	   @RequestMapping(value = "/myInfoUpdate", method = RequestMethod.POST)
	   public String myInfoUpdatePOST(MemberVO vo, RedirectAttributes rttr, Model model) throws Exception {


	      service.myInfoModify(vo);

			rttr.addFlashAttribute("msg", "SUCCESS");

	      return "redirect:/user/mypage/myInfo";
	   }
	   
	// 4. 팀  - 삭제하기   
	   @RequestMapping(value = "/mtremove", method = RequestMethod.GET)
	   public String uscarremove(@RequestParam("mtNo") int mtNo, MemberTeamVO mt, RedirectAttributes rttr) throws Exception {

	      logger.info("mtremove post.................");
	      logger.info(mt.toString());
	      MTservice.remove(mtNo);

	      rttr.addFlashAttribute("msg", "REMOVE");
	      return "redirect:/user/mypage/myInfo";
	   }
}