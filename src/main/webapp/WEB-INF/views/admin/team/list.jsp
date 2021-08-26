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
<title>LISTENER 팀 구인구직 게시판</title>
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

				<section>
					<div class="content">

						<!-- general form elements -->
						<div class="box-header"
							style="font-weight: bold; font-size: 30px; font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif; color: black">
							팀 구인구직 게시판</div>
						&nbsp;&nbsp;&nbsp;&nbsp;
												<div class='box-body'>
						
						<div class='row'>

                     <div class='col-3 col-12-small'>
                        <select name="searchType">
                           <option value="none"
                              <c:out value="${cri.searchType == null?'selected':''}"/>>
                              ---</option>
                           <option value="t"
                              <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
                              제목</option>
                           <option value="c"
                              <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
                              팀장</option>
                           <option value="g"
                              <c:out value="${cri.searchType eq 'g'?'selected':''}"/>>
                              장르</option>
                           
                        </select>
                     </div>
							<div class='col-3 col-12-small'>
								<input type="text" name='keyword' id="keywordInput"
									value='${cri.keyword }'>
							</div>
							<div class='col-1 col-12-small' align="right">
								<button id='searchBtn' style="float: center;">검색</button>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class='col-1 col-12-small' align="right">
								<button id='newBtn' style="float: right;">글쓰기</button>
							</div>
						</div>
					</div>
			</div>
			</section>

		<section>



					<table class="alt">
						<thead>
							<tr>
								<th>NO</th>
                        <th>팀명</th>
                        <th>팀장</th>
                        <th>장르</th>

							</tr>
						</thead>
						
						<tbody>
							<c:if test="${!empty list}">
							<c:forEach items="${list}" var="teamVO" varStatus="status">

								<tr>
									<td>${status.count}</td>
									<td><a
										href='/admin/team/read${pageMaker.makeSearch(pageMaker.cri.page) }&teamNo=${teamVO.teamNo}'>
											${teamVO.teamName}</a></td>
									<td>${teamVO.captain}</td>
									<td>${teamVO.genre}</td>

								</tr>

							</c:forEach>
						</c:if>
						</tbody>
					</table>
						<c:if test="${empty list}">
<p style="text-align:center;"><b>내용이 없습니다.</b></p>
</c:if> 
			</section>


				<div class="text-center">
				<div style="float: center; text-align: center;">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a href="list${pageMaker.makeSearch(idx)}" class="page">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
						</c:if>

					</ul>
				</div>

				<!-- /.box-footer-->
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

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>

</html>