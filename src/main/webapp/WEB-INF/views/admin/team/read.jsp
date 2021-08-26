<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>LISTENER 팀 상세보기</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<!-- 폰트적용하려면 아래링크넣어야함 -->
<link
   href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
   rel="stylesheet">
</head>
<style>
.box-body {
   width: 1000px;
   margin-bottom: 20px;
}
</style>

<body class="is-preload">

   <!-- Wrapper -->
   <div id="wrapper">

      <!-- Main -->
      <div id="main">
         <div class="inner">
            <!-- Header -->
            <header id="header">
               <a href="/admin/main" class="logo"> <img class="logo"
                  src="/resources/images/logo2.png"></a>
               <ul class="icons">
                  <li>
                     <div class="pull-right">
                        <c:if test="${null ne login.id}">
                           <span class="hidden-xs">${login.name}님</span>
                           <a href="/logout" class="btn btn-default btn-flat">로그아웃</a>
                        </c:if>
                        <c:if test="${null eq login.id}">
                           <a href="/login" class="btn btn-default btn-flat">회원가입/로그인</a>
                        </c:if>
                     </div>
                  </li>

                  <li><a href="https://www.facebook.com/listenerforever/"
                     target="_blank" class="icon brands fa-facebook-f"><span
                        class="label">Facebook</span></a></li>

                  <li><a
                     href="https://instagram.com/li2tener?utm_medium=copy_link"
                     target="_blank" class="icon brands fa-instagram"><span
                        class="label">Instagram</span></a></li>
               </ul>
            </header>





            <div class="box box-primary">
               <div class="box-header"
                  style="font-weight: bold; font-size: 50px; line-height: 1.0em; font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif; color: black">
                  팀 상세보기</div>
               &nbsp;&nbsp;&nbsp;&nbsp;
               <!-- /.box-header -->

               <form role="form" action="modify" method="post">

                  <input type='hidden' name='teamNo' value="${teamVO.teamNo}">
                  <input type='hidden' name='page' value="${cri.page}"> <input
                     type='hidden' name='perPageNum' value="${cri.perPageNum}">
                  <input type='hidden' name='searchType' value="${cri.searchType}">
                  <input type='hidden' name='keyword' value="${cri.keyword}">
               

               <div class="box-body">
                  <div class="form-group">
                     <label for="exampleInputEmail1">팀명</label> <input type="text"
                      class="form-control" value="${teamVO.teamName}"
                        readonly="readonly">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputEmail1">장르</label> <input type="text"
                         class="form-control" value="${teamVO.genre}" readonly="readonly">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputEmail1">팀장</label> <input type="text"
                         class="form-control" value="${teamVO.captain}" readonly="readonly">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputEmail1">팀장번호</label> <input type="text"
                         class="form-control" value="${teamVO.captainPh}" readonly="readonly">
                  </div>
                  
                  <div class="form-group">
                     <label for="exampleInputEmail1">보컬</label> <input type="text"
                         class="form-control" value="${teamVO.vocal}" readonly="readonly">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputEmail1">보컬2</label> <input type="text"
                         class="form-control" value="${teamVO.vocal2}" readonly="readonly">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputEmail1">기타</label> <input type="text"
                         class="form-control" value="${teamVO.guitar}" readonly="readonly">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputEmail1">기타2</label> <input type="text"
                         class="form-control" value="${teamVO.guitar2}" readonly="readonly">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputEmail1">드럼</label> <input type="text"
                        class="form-control" value="${teamVO.drum}" readonly="readonly">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputEmail1">베이스</label> <input type="text"
                         class="form-control" value="${teamVO.bass}" readonly="readonly">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputEmail1">신디</label> <input type="text"
                         class="form-control" value="${teamVO.synth}" readonly="readonly">
                  </div>
                  
                  <div class="form-group">
                     <label for="exampleInputEmail1">extra</label> <input type="text"
                         class="form-control" value="${teamVO.extra}" readonly="readonly">
                  </div>
                  
            
                  <div class="form-group">
                     <label for="exampleInputEmail1">합주곡</label> <input type="text"
                         class="form-control" value="${teamVO.song}" readonly="readonly">
                  </div>
                  &nbsp;
                  <div class="form-group">
                  <label for="exampleInputEmail1">팀 멘토 여부:
                     <c:if test="${1 eq teamVO.mentor}">
            YES
            </c:if>
               <c:if test="${0 eq teamVO.mentor}">
            NO
            </c:if></label>
                  </div>
               
               </div>
               <!-- /.box-body -->
</form>
               <div class="box-footer" align="right">
                  <button type="submit" class="btn btn-warning">수정</button>
                  <button type="submit" class="btn btn-danger">삭제</button>
                  <button type="submit" class="btn btn-primary">목록</button>
               </div>




            </div>
         </div>



      </div>

      <!-- Sidebar -->
      <div id="sidebar">
         <div class="inner">



            <!-- Menu -->
            <nav id="menu">
               <header class="major">
                  <h2>Menu</h2>
               </header>
               <ul>
                  <li><a href="/admin/noticeBoard/list">공지사항</a></li>
                  <li><a href="/admin/ciractboard/list">동아리활동 게시판</a></li>
                  <li><a href="/admin/team/list">팀 구인구직 게시판</a></li>
                  <li><a href="/admin/freeBoard/list">자유게시판</a></li>
                  <li><a href="/admin/calendar">합주실 시간표</a></li>
                  <li><a href="/admin/mypage/myInfo">마이페이지</a></li>
                  <li><a href="/admin/management/list">회원관리</a></li>

               </ul>
            </nav>
            
            <!-- Footer -->
            <footer id="footer">
               <p class="copyright">
                  &copy; Untitled. All rights reserved. Demo Images: <a
                     href="https://unsplash.com">Unsplash</a>. Design: <a
                     href="https://html5up.net">HTML5 UP</a>.
               </p>
            </footer>

         </div>
      </div>

   </div>

   <!-- Scripts -->
   <script src="/resources/assets/js/jquery.min.js"></script>
   <script src="/resources/assets/js/browser.min.js"></script>
   <script src="/resources/assets/js/breakpoints.min.js"></script>
   <script src="/resources/assets/js/util.js"></script>
   <script src="/resources/assets/js/main.js"></script>

</body>
<script>
   var result = '${msg}';

   if(result != '' ) {
      alert(result);
   }

</script>

   <script>
      $(document).ready(function() {

         var formObj = $("form[role='form']");

         console.log(formObj);

         $(".btn-warning").on("click", function() {
            formObj.attr("action", "/admin/team/modify");
            formObj.attr("method", "get");
            formObj.submit();
         });

         $(".btn-danger").on("click", function() {
            formObj.attr("action", "/admin/team/remove");
            formObj.submit();
         });

         $(".btn-primary").on("click", function() {
            formObj.attr("method", "get");
            formObj.attr("action", "/admin/team/list");
            formObj.submit();
         });

      });
   </script>
</html>