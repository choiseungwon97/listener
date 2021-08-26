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

import com.mis.domain.PageMaker;
import com.mis.domain.SearchCriteria;
import com.mis.domain.TeamVO;
import com.mis.service.TeamService;

@Controller
@RequestMapping("/admin/team/*") //admin밑 tsBoard밑에 있음
public class AdminTeamController {

	@Inject
	TeamService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminTeamController.class);
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(TeamVO vo, Model model) throws Exception {
		logger.info("register get.......");
	}
	
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String registerPOST(TeamVO vo, RedirectAttributes rttr) throws Exception {
		
		service.register(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/admin/team/list";
		
	}
	
	
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("teamNo") int teamNo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.read(teamNo));
	}
	
	
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int teamNo, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("modify get.......");

		
		model.addAttribute(service.read(teamNo));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(TeamVO vo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		logger.info("modify post.......");

		
		service.modify(vo);
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/admin/team/list";
		
	}
	
	
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("teamNo") int teamNo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		service.remove(teamNo);
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/admin/team/list";
		
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
