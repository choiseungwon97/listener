package com.mis.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mis.domain.MemberVO;

public class AuthInterceptor extends HandlerInterceptorAdapter {

   private static final String Login = "login"; // 로그인 정보를 저장할 key이름
   private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

   private void saveDest(HttpServletRequest req) {

      // 사용자가 마지막으로 접근 했던 경로 저장
      String uri = req.getRequestURI(); // 사용자 접속 경로 (ex, /sboard/list)
      String query = req.getQueryString(); // 사용자가 사용했던 QueryString(페이징, 검색정보) (ex, ?perPageNum=10&page=1)

      // 1)쿼리 스트링 전처리
      if (query == null || query.equals("null")) {
         query = "";
      } else {
         query = "?" + query;
      }

      // 2)최종 경로 session의 dest로 저장 --post방식은 저장안됨(ex. removePage는 post라 안된다)
      if (req.getMethod().equals("GET")) {
         logger.info("dest: " + (uri + query));
         req.getSession().setAttribute("dest", uri + query);
      }

   }

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {

      // 로그인 권한이 필요할 경우 로그인 화면 경로로(/user/login) 이동하도록 재정의

      HttpSession session = request.getSession();
      // 1)로그인 되어 있는지 확인
      if (session.getAttribute(Login) == null) {
         logger.info("current user is not logined");

         // 2)보고 있는 화면 경로 & 정보 저장
         saveDest(request);

         // 3)로그인 페이지로 이동
         response.sendRedirect("/login");
         return false;

      } else {

         // 로그인은 되어 있는데, 접근하지 말아야 하는 경로로 왔을 경우
         MemberVO checkAuth = (MemberVO) session.getAttribute(Login);

         if (checkAuth.getGrade().equals("1"))// 관리자
         {
            logger.info("admin main...........");

         } else {// 사용자
            logger.info("user main...........");

            // 접근 하지 말아야 할 경로 인지 확인
            saveDest(request);
            String dest = (String) session.getAttribute("dest");
            
            if (dest.contains("admin")) {
               logger.info("user 잘못된 접근일 경우 ...........");
               response.sendRedirect("/user/main");
            }

         }

      }

      return true;
   }

}