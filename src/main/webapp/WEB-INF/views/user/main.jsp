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
<title>LISTENER</title>
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

* {
   box-sizing: border-box
}

body {
   font-family: Verdana, sans-serif;
   margin: 0
}

.mySlides {
   display: none
}

img {
   vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
   max-width: 1400px;
   position: relative;
   margin: auto;
}

/* Next & previous buttons */
.prev, .next {
   cursor: pointer;
   position: absolute;
   top: 50%;
   width: auto;
   padding: 16px;
   margin-top: -22px;
   color: white;
   font-weight: bold;
   font-size: 18px;
   transition: 0.6s ease;
   border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
   right: 0;
   border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
   background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.text {
   color: #f2f2f2;
   font-size: 15px;
   padding: 8px 12px;
   position: absolute;
   bottom: 8px;
   width: 100%;
   text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
   color: #f2f2f2;
   font-size: 12px;
   padding: 8px 12px;
   position: absolute;
   top: 0;
}

/* The dots/bullets/indicators */
.dot {
   cursor: pointer;
   height: 15px;
   width: 15px;
   margin: 0 2px;
   background-color: #bbb;
   border-radius: 50%;
   display: inline-block;
   transition: background-color 0.6s ease;
}

.active, .dot:hover {
   background-color: #717171;
}

/* Fading animation */
.fade {
   -webkit-animation-name: fade;
   -webkit-animation-duration: 1.5s;
   animation-name: fade;
   animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
   from {opacity: .4
}

to {
   opacity: 1
}

}
@
keyframes fade {
   from {opacity: .4
}

to {
   opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
   .prev, .next, .text {
      font-size: 11px
   }
}
</style>
<link href='/resources/fullcalendar-5.8.0/lib/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar-5.8.0/lib/main.js'></script>
<script type='text/javascript'>
document
.addEventListener(
		'DOMContentLoaded',
		function() {
			var calendarEl = document.getElementById('calendar');

			var calendar = new FullCalendar.Calendar(
					calendarEl,
					{

						googleCalendarApiKey : 'AIzaSyAIAiUKoxhuZVTn0JbziIzpVzt2oFIwGBo',
						eventSources : [
								{
									googleCalendarId : 'imavdj0c4g3vg27epn43h39eog@group.calendar.google.com',
									className : 'LISTENER',
									color : '#be5683', //rgb,#ffffff 등의 형식으로 할 수 있어요.
									textColor : 'black'
								}/* ,
								{
									googleCalendarId : 'tmddnjsdk@gmail.com',
									className : '최승원',
									color : '#204051',
									textColor : 'black'
								}  */]
					});
			calendar.render();
		});
</script>
<body class="is-preload">


   <!-- Wrapper -->
   <div id="wrapper">
      <!-- Main -->
      <div id="main">
         <div class="inner">

            <!-- Header -->
            <header id="header">
               <a href="/user/main" class="logo"> <img class="logo"
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

            <div class="content" align="left">
               <div class='box-body'>
                  <div style="float: left; width: 25%;"></div>
                  <div style="float: left; width: 25%;"></div>
                  <div style="float: left; width: 25%;"></div>
                  <div style="float: right; width: 25%;"></div>


                  <%--  <div>
                     <span class="hidden-xs">${login.name}님</span> <a href="/logout"
                        class="btn btn-default btn-flat">Sign out</a>
                  </div> --%>
               </div>
            </div>
            <br>
            <div class="slideshow-container">

               <div class="mySlides fade">
                  <img src="/resources/images/duck.png" style="width: 100%">
               </div>

               <div class="mySlides fade">
                  <img src="/resources/images/kifirefuck.png" style="width: 100%">
               </div>

               <div class="mySlides fade">
                  <img src="/resources/images/killerbee2.png" style="width: 100%">
               </div>


            </div>
            <br>

            <div style="text-align: center">
               <span class="dot" onclick="currentSlide(1)"></span> <span
                  class="dot" onclick="currentSlide(2)"></span> <span class="dot"
                  onclick="currentSlide(3)"></span>
            </div>
            <hr>
            <h2>
               <font>필독 공지사항</font>
            </h2>
            <table>
               <colgroup>
                  <col style="width: 5%">
                  <col style="width: 30%">
                  <col style="width: 5%">
               </colgroup>
               <thead>
                  <tr>
                     <th>작성자</th>
                     <th>제목</th>
                     <th>작성일</th>
                  </tr>
               </thead>
               <tbody>
               <tbody>
                  <c:forEach items="${list}" var="NoticeBoardVO" varStatus="status">
                     <c:if test="${ 1 eq  NoticeBoardVO.mustRead}">
                        <tr>
                           <td>${NoticeBoardVO.nickname}</td>
                           <td><a
                              href='/user/noticeBoard/read${pageMaker.makeSearch(pageMaker.cri.page) }&nbNo=${NoticeBoardVO.nbNo}'>
                                 ${NoticeBoardVO.title} </a></td>

                           <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                 value="${NoticeBoardVO.regdate}" /></td>

                        </tr>
                     </c:if>
                  </c:forEach>
               </tbody>
            </table>
            <hr>
            <div class="row">

               <div class="col-6 col-12-small">

                  <iframe width="700" height="605"
                     src="https://www.youtube.com/embed/MJZXxSWvMqI?autoplay=1&mute=1"
                     title="YouTube video player" frameborder="0"
                     allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                     allowfullscreen></iframe>
               </div>

               <div class="col-6 col-12-small" id='calendar'></div>
            </div>
         </div>



         <div class="text-center">
            <br>
            <br>
            <div style="float: center; text-align: center;"></div>

            <!-- /.box-footer-->
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
                  <li><a href="/user/noticeBoard/list">공지사항</a></li>
                  <li><a href="/user/ciractboard/list">동아리활동 게시판</a></li>
                  <li><a href="/user/team/list">팀 구인구직 게시판</a></li>
                  <li><a href="/user/freeBoard/list">자유게시판</a></li>
                  <li><a href="/user/calendar">합주실 시간표</a></li>
                  <li><a href="/user/mypage/myInfo">마이페이지</a></li>
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
   <script>
      var slideIndex = 0;
      showSlides();

      function showSlides() {
         var i;
         var slides = document.getElementsByClassName("mySlides");
         var dots = document.getElementsByClassName("dot");
         for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
         }
         slideIndex++;
         if (slideIndex > slides.length) {
            slideIndex = 1
         }
         for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
         }
         slides[slideIndex - 1].style.display = "block";
         dots[slideIndex - 1].className += " active";
         setTimeout(showSlides, 2000); // Change image every 2 seconds
      }
   </script>


</body>
</html>