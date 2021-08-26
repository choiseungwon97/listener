<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>LISTENER 상세보기</title>
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


				<form role="form" action="modify" method="post">

					<input type='hidden' name='nbNo' value="${noticeBoardVO.nbNo}">
					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

				</form>


				<div class="box box-primary">
					<div class="box-header"
						style="font-weight: bold; font-size: 50px; line-height: 1.0em; font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif; color: black">
						공지사항 상세보기</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- /.box-header -->

					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> <input type="text"
								name='title' value="${noticeBoardVO.title}" class="form-control"
								readonly="readonly">
						</div>
											&nbsp;&nbsp;
						
						 <div class="form-group">
                        <label for="exampleInputEmail1">닉네임: ${noticeBoardVO.nickname}</label>
                     </div>
						<div class="form-group">
                     <label for="exampleInputPassword1">말머리</label>
                        <c:if test="${ 1 eq noticeBoardVO.mustRead}">
                        <input type="text" class="form-control" value="필독" readonly="readonly"></c:if>
                        <c:if test="${ 1 ne noticeBoardVO.mustRead}">
                        <input type="text" class="form-control" value="일반" readonly="readonly"></c:if>
                     </div>&nbsp;&nbsp;
                 

						<div class="form-group">
							<label for="exampleInputPassword1">내용</label> <input type="text"
								name='content' value="${noticeBoardVO.content}"
								class="form-control" readonly="readonly">
						</div>

						<c:if test="${!empty nbFileVO}">
							<div class="form-group">
								<label for="exampleInputEmail1">첨부파일</label>

							</div>

							<ul class="dropzone-previews">

								<c:forEach items="${nbFileVO}" var="nbFileVO" varStatus="status">
									<c:set var="fileName" value="${nbFileVO.filename}" />
									<c:set var="nbFileNo" value="${fn:toLowerCase(fileName)}" />

									<li class="dropzone-previews mt-3">
										<div
											class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
											<div class="p-2">
												<div class="row align-items-center">
													<c:forTokens var="token" items="${nbFileNo}" delims="."
														varStatus="status">
														<c:if test="${status.last}">
															<c:choose>
																<c:when test="${token eq 'hwp'}">
																	<img data-dz-thumbnail="" width="50"
																		class="avatar-sm rounded bg-light"
																		src="/resources/dist/img/hwp.png" alt="${filename}" />
																</c:when>
																<c:when test="${token eq 'xls' || token eq 'xlsx' }">
																	<img data-dz-thumbnail=""
																		class="avatar-sm rounded bg-light"
																		src="/resources/dist/img/excelIcon.png" />
																</c:when>
																<c:when
																	test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
																	<img data-dz-thumbnail=""
																		class="avatar-sm rounded bg-light"
																		src="/displayFile?fileName=${nbFileVO.fileLocation}">
																</c:when>
																<c:when test="${token eq 'pdf'}">
																	<img data-dz-thumbnail=""
																		class="avatar-sm rounded bg-light"
																		src="/resources/dist/img/pdf.png" alt="${filename}" />
																</c:when>
																<c:when test="${token eq 'ppt' }">
																	<img data-dz-thumbnail=""
																		class="avatar-sm rounded bg-light"
																		src="/resources/dist/img/ppt.png" alt="${filename}" />
																</c:when>
																<c:otherwise>
																	<img data-dz-thumbnail=""
																		class="avatar-sm rounded bg-light"
																		src="/resources/dist/img/file.svg" alt="${filename}" />
																</c:otherwise>
															</c:choose>
														</c:if>
													</c:forTokens>
													<div class="col pl-0">
														<a href="/displayFile?fileName=${nbFileVO.fileLocation}"
															text-muted font-weight-bold data-dz-name="">
															${nbFileVO.filename}</a>
													</div>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:if>



					</div>
					<!-- /.box-body -->

					<div class="box-footer" align="right">
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
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		

		$(".btn-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/user/noticeBoard/list");
			formObj.submit();
		});

	});

	function checkImageType(fileName) {

		var pattern = /jpg|gif|png|jpeg/i;

		return filename.match(pattern);

	}
</script>
</html>