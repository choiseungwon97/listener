<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <head>
    <meta charset='utf-8' />
    <meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<!-- 폰트적용하려면 아래링크넣어야함 -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
<link href='/resources/fullcalendar-5.8.0/lib/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar-5.8.0/lib/main.js'></script>
<script type='text/javascript'>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
	  
    googleCalendarApiKey: 'AIzaSyAWma5AroJuEt2GEJyFbDxYelbuoJYdTe4',
    eventSources: [
    {
          googleCalendarId: 'ef84ihrm566v5b46fs7v6mg2q8@group.calendar.google.com',
          className: 'Listener',
          color: '#be5683', //rgb,#ffffff 등의 형식으로 할 수 있어요.
          textColor: 'black' 
        },
      {
          googleCalendarId: 'tmddnjsdk@gmail.com',
          className: '최승원',
            color: '#204051',
            textColor: 'black' 
        }
    ]
  });
  calendar.render();
});
</script>
<style>
.box-body {
	width: 1000px;
	margin-bottom: 20px;
}
</style>
<!-- <style>
#calendar{
   width:60%;
   margin:20px auto;
}
</style> -->
  </head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">
			<div class="content" align="left">
					<div class='box-body'>
    <div id='calendar'></div>
    </div>
    </div>
    </div>
    </div>
    </div>
    <div id="sidebar">
			<div class="inner">



				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="index.html">공지사항</a></li>
						<li><a href="generic.html">동아리활동 게시판</a></li>
						<li><a href="elements.html">팀구인구직 게시판</a></li>
						<li><span class="opener">자유게시판</span>
							<ul>
								<li><a href="#">Lorem Dolor</a></li>
								<li><a href="#">Ipsum Adipiscing</a></li>
								<li><a href="#">Tempus Magna</a></li>
								<li><a href="#">Feugiat Veroeros</a></li>
							</ul></li>
						<li><a href="#">합주실 시간표</a></li>
						<li><a href="#">마이페이지</a></li>


					</ul>
				</nav>
				`
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
		<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
  </body>
</html>