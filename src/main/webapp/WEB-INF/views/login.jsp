<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>LISTENER 로그인</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<!-- 폰트적용하려면 아래링크넣어야함 -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
</head>


<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="/" class="logo"> <img class="logo"
						src="resources/images/logo2.png"></a>
					<ul class="icons">
						<li><a href="https://www.facebook.com/listenerforever/"
                     target="_blank" class="icon brands fa-facebook-f"><span
                        class="label">Facebook</span></a></li>

                  <li><a
                     href="https://instagram.com/li2tener?utm_medium=copy_link"
                     target="_blank" class="icon brands fa-instagram"><span
                        class="label">Instagram</span></a></li>
					</ul>
				</header>
				<section>
					<div class="content" align="center">
						<div class="col-12 col-12-xsmall" align="center">
							<span class="image object"> <img
								src="resources/images/logo.PNG" alt="" />

							</span>
						</div>
					</div>
				</section>
				<form action="/loginPost" method="post"
					onsubmit="return loginCheck();">

					<div class="content">

						<div class="row">
							<div class="col-12 col-12-xsmall" align="center">
								<input type="text" name="id" id="id" value="" placeholder="ID"
									style="width: 500px; height: 50px;" /><br> <input
									type="password" name="pw" id="pw" value=""
									placeholder="password" style="width: 500px; height: 50px;" />
								<br>
								<button type="submit" class="button big">접속</button>
								<a href="/memberRegister" class="button big">가입</a>

							</div>





							<!-- 
					<ul class=actions align="center">
							<li><a class="button big">로그인</a></li>
							<li><a href="/memberRegister" class="button big">회원가입</a></li>
					</ul>			
					
						<div class="col-6 col-12-xsmall">
							<input type="text" name="id" id="id" value="" placeholder="ID"
								style="width: 500px; height: 50px;" />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="password" name="pw" id="pw" value=""
								placeholder="password" style="width: 500px; height: 50px;" />
						</div>

						
						<ul class=actions>
							<li><a class="button big">로그인</a></li>
							<li><a href="/memberRegister" class="button big">회원가입</a></li>
						</ul>
						
						 -->
						</div>
					</div>

				</form>
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

</body>
<script>
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}

	function loginCheck() {
		var id = $("#id").val();
		var pw = $("#pw").val();

		if (id == "") {
			alert("ID를 입력해주세요.");
			document.getElementById("id").focus();
			return false;
		}
		if (pw == "") {
			alert("비밀번호를 입력해주세요.");
			document.getElementById("pw").focus();
			return false;
		}

	}
</script>
</html>