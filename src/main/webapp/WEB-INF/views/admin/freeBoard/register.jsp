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
<title>LISTENER 자유게시판 작성</title>
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
						자유게시판 글 작성</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- /.box-header -->

					<form role="form" method="post" name="frm">
						<input type="hidden" name="id" value="${login.id}">
						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">제목</label> <input type="text"
									name='title' id="title" class="form-control"
									placeholder="Enter Title">
							</div>
												&nbsp;&nbsp;&nbsp;&nbsp;
							
							<div class="form-group">
								<label for="exampleInputEmail1">작성자:
									 ${login.nickname}</label>

							</div>
						
							<div class="form-group">
								<label for="exampleInputPassword1">내용</label>
								<textarea class="form-control" name="content" id="content"
									rows="3" placeholder="Enter ..."></textarea>
							</div>
						&nbsp;&nbsp;
                     <div class="form-group">
                        <label for="exampleInputEmail1">유튜브링크</label>
                     <input type="text" name="youtubeLink"
                           class="form-control">
                     </div>
						
						&nbsp;&nbsp;
							

							<div class="form-group">
								<label for="exampleInputEmail1" class="col-sm-2 control-label">첨부파일</label>
							</div>


							<div id='mydropzone' class="dropzone" style="height: auto; width: 100%; border:1px solid #bcbcbc;">

								<input type="file" id="fileUpload" name="fileUpload"
									style="visibility: hidden;" />

								<div class="fileDrop">
									<input type="hidden" id="uploadCount">
									<div class="dz-message needsclick">
										<i class="h1 text-muted dripicons-cloud-upload"></i>
										<h3>Drop files here or click to upload.</h3>
										<span class="text-muted font-13">첨부파일을 업로드하려면 여기에 첨부파일
											파일을 끌어 넣거나 클릭해주세요</span>
									</div>
								</div>
							</div>
							<div>
								<ul class="dropzone-previews clearfix uploadedList">
								</ul>
							</div>

						</div>

						<!-- /.box-body -->
						<div class="box-footer" align="right">
							<button type="button" class="btn btn-primary" id="btn_submit">등록</button>
							<button type="button" onclick="location.href='list' ">취소</button>
							<!--취소 버튼 기능 추가 수정요망.  -->
						</div>

					</form>




				</div>
			</div>



		</div>

		<!-- SD PROJECT JS -->

		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script type="text/javascript" src="/resources/upload.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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
			// 신청 등록 유효성 검사 
			function validate() {

				var title = $("#title").val();
				var content = $("#content").val();

				if (title == "") {
					alert("제목을 입력해주세요 .");
					document.getElementById("title").focus();
					return false;
				}

				if (content == "") {
					alert("내용을 입력해주세요 .");
					document.getElementById("content").focus();
					return false;
				}

				return true;

			}
		</script>

		<script>
			$("input:text[numberOnly]").on("focus", function() {
				var x = $(this).val();
				x = removeCommas(x);
				$(this).val(x);
			}).on("focusout", function() {
				var x = $(this).val();
				if (x && x.length > 0) {
					if (!$.isNumeric(x)) {
						x = x.replace(/[^0-9]/g, "");
					}
					x = addCommas(x);
					$(this).val(x);
				}
			}).on("keyup", function() {
				$(this).val($(this).val().replace(/[^0-9]/g, ""));
			});
		</script>


		<script>
			$(document)
					.ready(
							function() {
								var formObj = $("form[role='form']");

								formObj
										.submit(function(event) {
											event.preventDefault();
											//유효성 검사

											var val = validate();

											if (val) {

												var that = $(this);

												var str = "";

												$(".uploadedList .delbtn")
														.each(
																function(index) {
																	str += "<input type='hidden' name='files'"
																			+ " value='"
																			+ $(
																					this)
																					.attr(
																							"href")
																			+ "'> ";
																});

												that.append(str);
												console.log(str);

												that.get(0).submit();

											}//if문 종료

										});

								$(".btn-cancel")
										.on(
												"click",
												function() {
													self.location = "list&page=${cri.page}&perPageNum=${cri.perPageNum}"
															+ "&searchType=${cri.searchType}&listType=${cri.listType}&keyword=${cri.keyword}";
												});

							});

			$('#mydropzone').click(function(event) {

				document.frm.fileUpload.click();

			});

			var template = Handlebars.compile($("#template").html());

			//dragenter dragover, drop 기본 동작 막기(기본적인 이벤트 처리 제한 preventDefault) 끌어다 놓으면 새로운 창이 열리는 동작
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
			});

			$(".fileDrop").on("drop", function(event) {
				event.preventDefault();

				var uploaded = $("#uploadCount").val();

				//event.dataTransfer=이벤트와 같이 전달된 데이터   
				//dataTransfer.files= 그안 에 포함된 전달된 파일 데이터를 찾아 가져오는 부분
				//jQuery를 이용하는 경우 envent가 순수한 DOM 이벤트가 아니기때문에 
				var files = event.originalEvent.dataTransfer.files;

				var file = files[0];

				//formData를 이용한 서버 호출 (기존 <form>태그로 만든 데이터 전송방식과 동일)
				var formData = new FormData();

				//file 이름으로 파일 객체 추가
				formData.append("file", file);

				//$.post()를 사용하지 않고 $.ajax() 사용하는 대신 processData,contentType: false로 지정
				$.ajax({
					url : '/uploadAjax',
					data : formData,
					dataType : 'text',
					processData : false, //데이터를 자동 변환 할 것인지(true:일반적인 query string / false:자동 변환 없이)
					contentType : false, //기본값(true) application/urlcod 타입으로 전송 / 파일의 경우(false) multipart/form_data 방식으로 전송
					type : 'POST',
					success : function(data) {

						var fileInfo = getFileInfo(data);
						var html = template(fileInfo);

						var str = "";

						$(".uploadedList").append(html);

						uploaded++;
						$("#uploadCount").attr("value", uploaded);

						$(".uploadedList").append(str);
					}
				});
			});

			//클릭으로 파일 업로드할 때 호출되는 함수
			$("#fileUpload").on("change", function(event) {
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
					success : function(data) {

						var fileInfo = getFileInfo(data);
						var html = template(fileInfo);

						var str = "";

						$(".uploadedList").append(html);

						uploaded++;
						$("#uploadCount").attr("value", uploaded);

						$(".uploadedList").append(str);
					}
				});
			});

			//첨부파일 삭제 처리
			$(".uploadedList").on("click", ".delbtn", function(event) {
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
					success : function(result) {

						if (result == 'deleted') {

							that.closest("li").remove();
							uploaded--;
							$("#uploadCount").attr("value", uploaded);

						}
					}

				});

			});
			//파일링크 처리(길이를 줄여줌)
			function getOriginalName(filename) {

				if (checkImageType(filename)) {
					return;
				}

				var idx = filename.indexOf("_") + 1;
				return filename.substr(idx);

			}
			//이미지파일 원본 파일 찾기
			function getImageLink(filename) {

				if (!checkImageType(filename)) {
					return;
				}
				//noticeFileName.substring(0,12)/년/월/일 경로 추출  
				//noticeFileName.substring(14) 파일 이름앞의 's_'제거
				var front = filename.substr(0, 12);
				var end = filename.substr(14);

				return front + end;

			}
		</script>




		<script>
			$(document).ready(function() {

				var formObj = $("form[role='form']");

				console.log(formObj);

				$("#btn_submit").on("click", function() {

					formObj.submit();
				});
			});
		</script>

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