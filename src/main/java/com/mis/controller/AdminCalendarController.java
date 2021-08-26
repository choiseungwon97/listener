package com.mis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCalendarController {
   
   @RequestMapping("/admin/calendar")
   public String Calendar() {
      return "/admin/fullCalendar";
   }
}