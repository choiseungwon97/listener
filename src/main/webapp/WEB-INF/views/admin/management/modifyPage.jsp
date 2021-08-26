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
<title>LISTENER 회원정보수정</title>
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
						회원 정보 수정</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- /.box-header -->

					<form action=modifyPage method="post">
						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">아이디</label> <input type="text"
									name="id" id="id" class="form-control" value="${memberVO.id}" readonly>
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<label for="exampleInputEmail1">비밀번호</label> <input type="text"
									name="pw" id="pw" class="form-control" value="${memberVO.pw}">
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<label for="exampleInputEmail1">이름</label> <input type="text"
									name="name" id="name" class="form-control"
									value="${memberVO.name}">
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<label for="exampleInputEmail1">닉네임</label> <input type="text"
									name="nickname" id="nickname" class="form-control"
									value="${memberVO.nickname}">
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<label for="exampleInputEmail1">학생번호</label> <input type="text"
									name="stid" id="stid" class="form-control"
									value="${memberVO.stid}">
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<label for="exampleInputEmail1">학과</label> <input type="text"
									name="major" id="major" class="form-control"
									value="${memberVO.major}">
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<label for="exampleInputEmail1">생년월일</label> <input type="text"
									name="birth" id="birth" class="form-control"
									value="${memberVO.birth}">
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<label for="exampleInputEmail1">휴대전화번호</label> <input
									type="text" name="ph" id="ph" class="form-control"
									value="${memberVO.ph}">
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<label for="exampleInputEmail1">주소</label> <input type="text"
									name="address" id="address" class="form-control"
									value="${memberVO.address}">
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<label for="exampleInputEmail1">세션</label> <input type="text"
									name="memberSession" id="memberSession" class="form-control"
									value="${memberVO.memberSession}">
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<label for="exampleInputEmail1">가입동기</label> <input type="text"
									name="why" id="why" class="form-control"
									value="${memberVO.why}">
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<label for="exampleInputEmail1">선호장르</label> <input type="text"
									name="likeGenre" id="likeGenre" class="form-control"
									value="${memberVO.likeGenre}">
							</div>
							&nbsp;&nbsp;
							<div class="form-group">
								<label for="exampleInputEmail1">선호아티스트</label> <input
									type="text" name="artist" id="artist" class="form-control"
									value="${memberVO.artist}">
							</div>
							&nbsp;&nbsp;
							
							<div class="form-group">
								<label for="exampleInputEmail1">회원 등급</label> <c:if test="${ 1 eq  memberVO.grade}">
									 <input type="text"
								name='mustRead' value="관리자" class="form-control"
								readonly="readonly">
								</c:if>
								<c:if test="${ 1 ne  memberVO.grade}">
									<input type="text"
								name='mustRead' value="유저" class="form-control"
								readonly="readonly">
								</c:if>
							</div>


						</div>
						<!-- /.box-body -->

						<div class="box-footer" align="right">
							<button type="submit" class="btn btn-primary">저장</button>
							<button type="button" onclick="location.href='list' ">취소</button>
						</div>

					</form>


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
</html>