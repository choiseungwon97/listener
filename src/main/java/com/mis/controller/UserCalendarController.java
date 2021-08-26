package com.mis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserCalendarController {
   
   @RequestMapping("/user/calendar")
   public String Calendar() {
      return "/user/fullCalendar";
   }
}