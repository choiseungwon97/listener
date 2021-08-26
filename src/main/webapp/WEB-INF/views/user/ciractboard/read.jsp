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
<title>LISTENER 동아리활동 게시판 상세보기</title>
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

               <input type='hidden' id='cabNo' name='cabNo'
                  value="${ciractBoardVO.cabNo}"> <input type="hidden"
                  id='id' name="id" value="${ciractBoardVO.id}"> <input
                  type='hidden' name='page' value="${cri.page}"> <input
                  type='hidden' name='perPageNum' value="${cri.perPageNum}">
               <input type='hidden' name='searchType' value="${cri.searchType}">
               <input type='hidden' name='keyword' value="${cri.keyword}">

            </form>



            <form>
               <div class="box box-primary">
                  <div class="box-header"
                     style="font-weight: bold; font-size: 30px; line-height: 1.0em; font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif; color: black">
                     동아리 활동 상세보기</div>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <!-- /.box-header -->

                  <div class="box-body">
                     <div class="form-group">
                        <label for="exampleInputEmail1">제목</label> <input type="text"
                           name='title' class="form-control"
                           value="${ciractBoardVO.title}" readonly="readonly">
                     </div>
                       &nbsp;&nbsp;
                     <div class="form-group">
                     <label for="exampleInputEmail1">닉네임: ${ciractBoardVO.nickname}</label>
                  </div>
                  &nbsp;&nbsp;
         
                     <div class="form-group col-md-6">
                     <label for="inputCity" class="col-form-label">작성일</label>
                     <fmt:formatDate value="${ciractBoardVO.regdate}" type="date"
                        pattern="yyyy-MM-dd" var="regdate" />
                     <input type="text" name="regdate" id="regdate"
                        class="form-control" value="${regdate}" disabled="disabled">
                  </div>
               
                  
                  <div class="form-group">
                     <label for="exampleInputEmail1" name="content" id="content">내용</label>
                     <c:if test="${ null eq  CiractBoardVO.youtubeLink}">
                        <div></div>
                     </c:if>
                     <c:if test="${ null ne  CiractBoardVO.youtubeLink}">
                        <iframe width="560" height="315"
                           src="${CiractBoardVO.youtubeLink}" title="YouTube video player"
                           frameborder="0"
                           allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                           allowfullscreen></iframe>
                     </c:if>
                     <textarea>${CiractBoardVO.content}</textarea>
                     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;




                  </div>

                  <c:if test="${!empty cabFileVO}">
                     <div class="form-group">
                        <label for="exampleInputEmail1">첨부파일</label>

                     </div>

                     <ul class="dropzone-previews">

                        <c:forEach items="${cabFileVO}" var="cabFileVO"
                           varStatus="status">
                           <c:set var="fileName" value="${cabFileVO.filename}" />
                           <c:set var="cabFileNo" value="${fn:toLowerCase(fileName)}" />

                           <li class="dropzone-previews mt-3">
                              <div
                                 class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
                                 <div class="p-2">
                                    <div class="row align-items-center">
                                       <c:forTokens var="token" items="${cabFileNo}" delims="."
                                          varStatus="status">
                                          <c:if test="${status.last}">
                                             <c:choose>
                                                <c:when test="${token eq 'hwp'}">
                                                   <img data-dz-thumbnail="" width="50"
                                                      class="avatar-sm rounded bg-light"
                                                      src="/resources/dist/img/hwp.png" alt="${filename}" />
                                                </c:when>
                                                <c:when test="${token eq 'xls' || token eq 'xlsx' }">
                                                   <img data-dz-thumbnail="" width="50"
                                                      class="avatar-sm rounded bg-light"
                                                      src="/resources/dist/img/excelIcon.png" />
                                                </c:when>
                                                <c:when
                                                   test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
                                                   <img data-dz-thumbnail=""
                                                      class="avatar-sm rounded bg-light"
                                                      src="/displayFile?fileName=${cabFileVO.fileLocation}">
                                                </c:when>
                                                <c:when test="${token eq 'pdf'}">
                                                   <img data-dz-thumbnail="" width="50"
                                                      class="avatar-sm rounded bg-light"
                                                      src="/resources/dist/img/pdf.png" alt="${filename}" />
                                                </c:when>
                                                <c:when test="${token eq 'ppt' }">
                                                   <img data-dz-thumbnail="" width="50"
                                                      class="avatar-sm rounded bg-light"
                                                      src="/resources/dist/img/ppt.png" alt="${filename}" />
                                                </c:when>
                                                <c:otherwise>
                                                   <img data-dz-thumbnail="" width="50"
                                                      class="avatar-sm rounded bg-light"
                                                      src="/resources/dist/img/file.svg" alt="${filename}" />
                                                </c:otherwise>
                                             </c:choose>
                                          </c:if>
                                       </c:forTokens>
                                       <div class="col pl-0">
                                          <a href="/displayFile?fileName=${cabFileVO.fileLocation}"
                                             text-muted font-weight-bold data-dz-name="">
                                             ${cabFileVO.filename}</a>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </li>
                        </c:forEach>
                     </ul>
                  </c:if>





               </div>
               </div>
               <!-- /.box-body -->

               <div class="box-footer" align="right">
                  <button type="button" onclick="location.href='list' ">목록</button>
               </div>

            </form>


            <!-- 댓글창 -->
            <div class="card">
               <div class="card-body">
                  <h4 class="mt-0 mb-3">Comments</h4>
                  <!--    <form role="form" method="get"> -->
                  <form>
                     <input type="hidden" value="${login.id}" id="newUserNo">
                     <textarea class="form-control form-control-light mb-2"
                        placeholder="Write message" id="newReplyText" rows="3"></textarea>
                     <div class="text-right">
                        <div class="btn-group mb-2" align="right">
                           <button type="button"
                              class="btn btn-link btn-sm text-muted font-18"
                              id="comentAddBtn">댓글 등록</button>
                        </div>
                     </div>
                     <div class="col-lg-12">
                        <div class="inbox-widget">
                           <h5 class="mt-0">댓글 목록</h5>
                           <div class="card">
                              <ul id="cabComment">
                              </ul>
                           </div>
                           <div style="text-align: right;"></div>
                        </div>

                     </div>

                     <!-- end card-body-->
                  </form>
               </div>
               <!-- end card-->
            </div>
            <!-- end col -->








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
   var cabNo = $("#cabNo").val(); // QnA 게시글 번호
   var loginNo = $("#newUserNo").val(); //로그인 사랑 정보
   var writeUser = $("#id").val(); //게시글 쓴 사람 정보 가져오기

   $.getJSON("/cabComment/all/" + cabNo, function(data) {
      var str = "";
      $(data).each(
            function() {

               var strbutton = "";
               str += "<li data-cabCommNo='" + this.cabCommNo + ">"
                     + "<div class='card'>" + this.nickname + "<br>"
                     + this.content + "<br>"

               if (loginNo == this.id || loginNo == writeUser)//댓글 정보와 로그인 정보 같을 경우 OR 게시글의 주인 인 경우 댓글 삭제 가능
               {
                  strbutton += "<div class='card'>"
                        + "  <a href='#' onclick='deleteReply("
                        + this.cabCommNo + ")'>삭제</a>" + "</div>";
               }

               str += strbutton;
               str += "</div></li>";

            });

      $("#cabComment").html(str);

   });

   //댓글 저장 버튼 클릭 이벤트 submit
   $("#comentAddBtn").on("click", function() {

      // 입력 form 선택자
      var loginNo = $("#newUserNo");
      var contentObj = $("#newReplyText");

      var id = loginNo.val();
      var content = contentObj.val();

      if (id == "") { //로그인 정보 없을 경우

         alert("로그인 후 댓글 기능을 사용할 수 있습니다.");
         contentObj.val("");
         return;

      }

      // 댓글 입력처리 수행
      $.ajax({
         type : "post",
         url : "/cabComment/",
         headers : {
            "Content-Type" : "application/json",
            "X-HTTP-Method-Override" : "POST"
         },
         dataType : "text",
         data : JSON.stringify({
            cabNo : cabNo,
            id : id,
            content : content
         }),
         success : function(result) {
            if (result === "SUCCESS") {
               alert("댓글이 등록되었습니다.");
               $("#newReplyText").val(""); //댓글 입력창 공백처리
               getReplies(); //댓글 목록 호출
            }
         }
      });
   });

   function deleteReply(cabCommentNo) {

      $.ajax({
         type : 'delete',
         url : '/cabComment/' + cabCommentNo,
         headers : {
            "Content-Type" : "application/json",
            "X-HTTP-Method-Override" : "DELETE"
         },
         dataType : 'text',
         success : function(result) {
            console.log("result: " + result);
            if (result == 'SUCCESS') {
               alert("삭제 되었습니다.");
               getReplies();
            }
         }
      });

   }

   function getReplies() {

      $.getJSON("/cabComment/all/" + cabNo, function(data) {
         var str = "";

         $(data).each(
               function() {

                  var strbutton = "";
                  str += "<li data-cabCommNo='" + this.cabCommNo + ">"
                        + "<div class='card'>" + this.nickname + "<br>"
                        + this.content + "<br>"

                  if (loginNo == this.id || loginNo == writeUser)//댓글 정보와 로그인 정보 같을 경우 OR 게시글의 주인 인 경우 댓글 삭제 가능
                  {
                     strbutton += "<div class='card'>"
                           + "  <a href='#' onclick='deleteReply("
                           + this.cabCommNo + ")'>삭제</a>" + "</div>";
                  }

                  str += strbutton;
                  str += "</div></li>";
               });

         $("#cabComment").html(str);

      });

   }
</script>
<script>
   $(document).ready(function() {

      var formObj = $("form[role='form']");

      console.log(formObj);

      //목록버튼
      $(".btn-light").on("click", function() {
         formObj.attr("method", "get");
         formObj.attr("action", "/user/ciractboard/list");
         formObj.submit();
      });

   });

   function checkImageType(fileNa
   me) {

      var pattern = /jpg|gif|png|jpeg/i;

      return filename.match(pattern);

   }
</script>




</html>