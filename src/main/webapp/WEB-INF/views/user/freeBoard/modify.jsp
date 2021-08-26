<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>LISTENER 자유게시판 수정</title>
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




				<div class="box box-primary">
					<div class="box-header"
						style="font-weight: bold; font-size: 50px; line-height: 1.0em; font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif; color: black">
						자유게시판 글 수정</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- /.box-header -->

					<form role="form" action="modify" method="post" name="frm">
                  <input type='hidden' name='fbNo' value="${freeBoardVO.fbNo}">
                  <input type='hidden' name='id' value="${freeBoardVO.id}">
                  <input type='hidden' name='page' value="${cri.page}"> <input
                     type='hidden' name='perPageNum' value="${cri.perPageNum}">
                  <input type='hidden' name='searchType' value="${cri.searchType}">
                  <input type='hidden' name='keyword' value="${cri.keyword}">
					

					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> <input type="text"
								id="title" name='title' class="form-control" value="${freeBoardVO.title}">
						</div>
						<div class="form-group">
                        <label for="exampleInputEmail1">닉네임: ${login.nickname}</label>
                     </div>
						<div class="form-group">
							<label for="exampleInputPassword1">내용</label>
							<textarea class="form-control" id="content" name="content" rows="3">${freeBoardVO.content}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">유튜브 링크</label> <input type="text"
								name='youtubeLink' class="form-control"
								value="${freeBoardVO.youtubeLink}">
						</div>
						
							
							<div class="form-group">
											<label for="exampleInputEmail1"
												class="col-sm-2 control-label">첨부파일</label>
										</div>

							<div id='mydropzone' class="dropzone" style="height: auto; width: 100%; border:1px solid #bcbcbc;">

											<input type="file" id="fileUpload" name="fileUpload" style="visibility: hidden;" />

											<div class="fileDrop">
												<input type="hidden" id="uploadCount">
												<div class="dz-message needsclick">
													<i class="h1 text-muted dripicons-cloud-upload"></i>
													<h3>Drop files here or click to upload.</h3>
													<span class="text-muted font-13">첨부파일을 업로드하려면 여기에
														첨부파일 파일을 끌어 넣거나 클릭해주세요</span>
												</div>
											</div>
										</div>
										<div>

											<ul class="dropzone-previews clearfix uploadedList">

												<c:forEach items="${fbFileVO}" var="fVo" varStatus="status">
													<c:set var="fileName" value="${fVo.filename}" />
													<c:set var="fbFileNo" value="${fn:toLowerCase(fileName)}" />
													

													<li class="dropzone-previews mt-3">
														<div
															class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
															<div class="p-2">
																<div class="row align-items-center">
																	<c:forTokens var="token" items="${fbFileNo}" delims="." varStatus="status">
																		<c:if test="${status.last}">
																			<c:choose>
																				<c:when test="${token eq 'hwp'}">
																					<img data-dz-thumbnail="" width="50"
																						class="avatar-sm rounded bg-light"
																						src="/resources/dist/img/hwp.png"
																						alt="${filename}" />
																				</c:when>
																				<c:when test="${token eq 'xls' || token eq 'xlsx' }">
																					<img data-dz-thumbnail=""
																						class="avatar-sm rounded bg-light"
																						src="/resources/dist/img/excelIcon.png" />
																				</c:when>
																				<c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
																				<img data-dz-thumbnail=""
																					class="avatar-sm rounded bg-light"
																					src="/displayFile?fileName=${fVo.fileLocation}">
																				</c:when>
																				<c:when test="${token eq 'pdf'}">
																					<img data-dz-thumbnail=""
																						class="avatar-sm rounded bg-light"
																						src="/resources/dist/img/pdf.png"
																						alt="${filename}" />
																				</c:when>
																				<c:when test="${token eq 'ppt' }">
																					<img data-dz-thumbnail=""
																						class="avatar-sm rounded bg-light"
																						src="/resources/dist/img/ppt.png"
																						alt="${filename}" />
																				</c:when>
																				<c:otherwise>
																					<img data-dz-thumbnail=""
																						class="avatar-sm rounded bg-light"
																						src="/resources/dist/img/file.svg"
																						alt="${filename}" />
																				</c:otherwise>
																			</c:choose>
																		</c:if>
																	</c:forTokens>

																	<div class="col pl-0">
																		<a href="/displayFile?fileName=${fVo.fileLocation}"
																			text-muted font-weight-bold data-dz-name="">
																			${fVo.filename}</a>
																	</div>
																	<div class="col-auto">
																		<a href="${fVo.fileLocation}"
																			class="btn btn-default btn-xs pull-right delbtn"><i class="far fa-trash-alt"></i></a>
																	</div>
																</div>
															</div>
														</div>
													</li>
												</c:forEach>
											</ul>
										</div>
							
					</div>
					<!-- /.box-body -->

						<div class="box-footer" align="right">
							<button type="submit" class="btn btn-primary">저장</button>
							<button type="button" onclick="location.href='list' ">취소</button>
						</div>

						

					


					</form>
					
					<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li class="dropzone-previews mt-3">
<div class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
<div class="p-2">
<div class="row align-items-center">
 <div class="col-auto">
    <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="{{imgsrc}}">
 </div>
 <div class="col pl-0">
   <a href="/displayFile?fileName={{fullName}}" text-muted font-weight-bold" data-dz-name="">{{fileName}}</a>
 </div>
 <div class="col-auto">
   <a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="far fa-trash-alt"></i></a>
 </div>
</div>
</div>
</div>
</li>
</script>

<script>
function checkImageType(fileName) {
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
}
						</script>

						<script>
							$(document).ready(function() {
												var formObj = $("form[role='form']");
												formObj.submit(function(event) {
															event.preventDefault();
													          var that = $(this);
													          var str = "";
													          $(".uploadedList .delbtn").each(
													                function(index) {
													                   str += "<input type='hidden' name='files'"
													                         + " value='" + $(this).attr("href")
													                         + "'> ";
													                });
													          that.append(str);
														      that.get(0).submit();
															
														});
											});

							$('#mydropzone').click(function(event) {

								document.frm.fileUpload.click();

							});

							var template = Handlebars.compile($("#template")
									.html());

							$(".fileDrop").on("dragenter dragover",
									function(event) {
										event.preventDefault();
									});

							$(".fileDrop")
									.on("drop",function(event) {
												event.preventDefault();

												var uploaded = $("#uploadCount")
														.val();

												var files = event.originalEvent.dataTransfer.files;

												var file = files[0];

												var formData = new FormData();

												formData.append("file", file);

												$
														.ajax({
															url : '/uploadAjax',
															data : formData,
															dataType : 'text',
															processData : false,
															contentType : false,
															type : 'POST',
															success : function(
																	data) {

																var fileInfo = getFileInfo(data);
																var html = template(fileInfo);

																var str = "";

																$(".uploadedList").append(html);

																uploaded++;
																$("#uploadCount").attr("value",uploaded);

																$(".uploadedList").append(str);
															}
														});
											});

							//클릭으로 파일 업로드할 때 호출되는 함수
							$("#fileUpload").on("change",
											function(event) {
												event.preventDefault();

												var uploaded = $("#uploadCount").val();

												if (uploaded >= 3) {
													alert('첨부파일은 3개 까지 업로드할 수 있습니다.');
													return;
												}

												// 파일업로드 인풋에서 파일을 받음
												var file = document.getElementById("fileUpload").files[0];

												// 새로운 폼데이터를 생성
												var formData = new FormData();

												// 폼데이터에 파일을 붙임
												formData.append("file", file);

												// AJAX로 uploadAjax 메소드를 호출해서 파일을 업로드함
												$.ajax({
															url : '/uploadAjax',
															data : formData,
															dataType : 'text',
															processData : false,
															contentType : false,
															type : 'POST',
															success : function(
																	data) {

																var fileInfo = getFileInfo(data);
																var html = template(fileInfo);

																var str = "";

																$(".uploadedList").append(html);

																uploaded++;
																$("#uploadCount").attr("value",uploaded);

																$(".uploadedList").append(str);
															}
														});
											});

							//파일 삭제 버튼 클릭 시 
							$(".uploadedList").on("click",".delbtn",
											function(event) {
												event.preventDefault();

												var that = $(this);
												var uploaded = $("#uploadCount").val();

												$.ajax({
															url : "/deleteFile",
															type : "post",
															data : {
																fileName : $(this).attr("href")
															},
															dataType : "text",
															success : function(
																	result) {

																if (result == 'deleted') {

																	that.closest("li").remove();
																	uploaded--;
																	$("#uploadCount").attr("value",uploaded);

																}
															}

														});

											});

							function getOriginalName(filename) {

								if (checkImageType(filename)) {
									return;
								}

								var idx = filename.indexOf("_") + 1;
								return filename.substr(idx);

							}

							function getImageLink(filename) {

								if (!checkImageType(filename)) {
									return;
								}
								var front = filename.substr(0, 12);
								var end = filename.substr(14);

								return front + end;

							}
						</script>


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

	<script>
		$(document)
				.ready(
						function() {

							var formObj = $("form[role='form']");

							console.log(formObj);

							
							$(".btn-primary").on("click", function() {
								var title = $("#title").val();
							    var content = $("#content").val();
							   
							 
							    if(title == ""){
							        alert("제목을 입력해 주세요"); 
							        $("#title").focus();
							        return false;
							    }
							    
							    if(content == ""){
							        alert("내용을 입력해 주세요"); 
							        $("#content").focus();
							        return false;
							    }
							    
							    
								formObj.submit();
							});
						});
	</script>
</body>
</html>