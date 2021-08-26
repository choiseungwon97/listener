package com.mis.controller;

import java.util.List;

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
import com.mis.domain.TeamVO;
import com.mis.service.MemberTeamService;
import com.mis.service.TeamService;

@Controller
@RequestMapping("user/mypage/myTeam/*")
public class MemberTeamController {

   private static final Logger logger = LoggerFactory.getLogger(MemberTeamController.class);

   @Inject
   private MemberTeamService MTservice;

   @Inject
   private TeamService service;

   // 팀 선택 팝업창 -> 팀명 검생 결과 페이지
   @RequestMapping(value = "/searchTeam", method = RequestMethod.GET)
   public void searchCar(@RequestParam("teamName") String teamName, Model model) throws Exception {

      List<TeamVO> searchTeamList = MTservice.searchTeam(teamName);

      logger.info("searchTeam : " + searchTeamList.toString());
      model.addAttribute("searchTeamList", searchTeamList);

   }

   // 팀 목록 팝업창
   @RequestMapping(value = "/searchPopup", method = RequestMethod.GET)
   public void searchPopup(@RequestParam("id") String id, Model model) throws Exception {
      logger.info("saerchPopup......");
      List<TeamVO> teamList = MTservice.teamList(id);
      model.addAttribute("teamList", teamList);

   }

   // 선택한 팀 목록 
   @RequestMapping(value = "/memberTeam", method = RequestMethod.GET)
   public void myScore(HttpServletRequest request, Model model) throws Exception {
      HttpSession session = request.getSession();
      MemberVO mVo = (MemberVO) session.getAttribute("login");
     String id = mVo.getId();

      //logger.info("show all list......");
      model.addAttribute(service.listAll());
      model.addAttribute("listAll", service.listAll());
   }


   // 팀 등로 등록 GET
   @RequestMapping(value = "", method = RequestMethod.GET)
   public void registerGET() throws Exception {

      logger.info("register get ......");
   }

   

   // 팀등로 등록 POST
   @RequestMapping(value = "", method = RequestMethod.POST)
   public String registerPOST(MemberTeamVO mt, RedirectAttributes rttr) throws Exception {

      logger.info("MT Register POST .......");

      logger.info("mt : " + mt);

      MTservice.register(mt);

      rttr.addFlashAttribute("msg", "처리 완료되었습니다.");

      return "redirect:/user/mypage/myInfo";
   }

  

}