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
<title>LISTENER 마이페이지</title>
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
            &nbsp;&nbsp;&nbsp;
            <form action="myInfoUpdate" method="get">
               <%-- <input type="hidden" name="id" value="${login.id}"> --%>
               <input type='hidden' id='mtNo' name='mtNo'
                  value="${memberTeamVO.mtNo}">



               <div class="box box-primary">
                  <div class="box-header"
                     style="font-weight: bold; font-size: 50px; line-height: 1.0em; font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif; color: black">
                     내 정보</div>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <!-- /.box-header -->

                  <div class="box-body">
                     <div class="form-group">
                        <label for="exampleInputEmail1">아이디</label> <input type="text"
                           name="id" value="${memberVO.id}" class="form-control"
                           readonly="readonly">
                     </div>
                     &nbsp;&nbsp;
                     <div class="form-group">
                        <label for="exampleInputPassword1">비밀번호</label> <input
                           type="text" value="${memberVO.pw}" class="form-control"
                           readonly="readonly">
                     </div>
                     &nbsp;&nbsp;
                     <div class="form-group">
                        <label for="exampleInputPassword1">이름</label> <input type="text"
                           value="${memberVO.name}" class="form-control"
                           readonly="readonly">
                     </div>
                     &nbsp;&nbsp;
                     <div class="form-group">
                        <label for="exampleInputPassword1">닉네임</label> <input
                           type="text" value="${memberVO.nickname}" class="form-control"
                           readonly="readonly">
                     </div>
                     &nbsp;&nbsp;
                     <div class="form-group">
                        <label for="exampleInputPassword1">학생번호</label> <input
                           type="text" value="${memberVO.stid}" class="form-control"
                           readonly="readonly">
                     </div>
                     &nbsp;&nbsp;
                     <div class="form-group">
                        <label for="exampleInputPassword1">학과</label> <input type="text"
                           value="${memberVO.major}" class="form-control"
                           readonly="readonly">
                     </div>
                     &nbsp;&nbsp;
                     <div class="form-group">
                        <label for="exampleInputPassword1">생년월일</label> <input
                           type="text" value="${memberVO.birth}" class="form-control"
                           readonly="readonly">
                     </div>
                     &nbsp;&nbsp;
                     <div class="form-group">
                        <label for="exampleInputPassword1">휴대전화번호</label> <input
                           type="text" value="${memberVO.ph}" class="form-control"
                           readonly="readonly">
                     </div>
                     &nbsp;&nbsp;
                     <div class="form-group">
                        <label for="exampleInputPassword1">주소</label> <input type="text"
                           value="${memberVO.address}" class="form-control"
                           readonly="readonly">
                     </div>
                     &nbsp;&nbsp;
                     <div class="form-group">
                        <label for="exampleInputPassword1">세션</label> <input type="text"
                           value="${memberVO.memberSession}" class="form-control"
                           readonly="readonly">
                     </div>
                     &nbsp;&nbsp;
                     <div class="form-group">
                        <label for="exampleInputPassword1">가입동기</label> <input
                           type="text" value="${memberVO.why}" class="form-control"
                           readonly="readonly">
                     </div>
                     &nbsp;&nbsp;
                     <div class="form-group">
                        <label for="exampleInputPassword1">선호장르</label> <input
                           type="text" value="${memberVO.likeGenre}" class="form-control"
                           readonly="readonly">
                     </div>
                     &nbsp;&nbsp;
                     <div class="form-group">
                        <label for="exampleInputPassword1">선호아티스트</label> <input
                           type="text" value="${memberVO.artist}" class="form-control"
                           readonly="readonly">
                     </div>
                     &nbsp;&nbsp;
                  <div class="form-group">
                         <label for="exampleInputPassword1">회원등급</label>
                        <c:if test="${ 1 eq memberVO.grade}">
                        <input type="text" class="form-control" value="관리자" readonly="readonly"></c:if>
                        <c:if test="${ 1 ne memberVO.grade}">
                        <input type="text" class="form-control" value="일반 사용자" readonly="readonly"></c:if>
                     </div>





<br><br>
                  <!-- 진로분야 List-->
                  <!-- 윗부분에 style태그로 명시함 ///  진로분야 와 등록버튼 같은 줄에 보임-->
                  <div id='container'>
                     <div id='left-box'>
                        <h4>팀</h4>
                     </div>
                     <div id='right-box'>
                        <button name="uscar" type="button" class="btn btn-primary"
                           onclick="javascript:location.href='/admin/mypage/myTeam/memberTeam'">
                           등록</button>
<br><br>
                     </div>
                  </div>


                  <table class="table table-centered mb-0">
                     <colgroup>
                        <col style="width: 5%">
                        <col style="width: 30%">
                        <col style="width: 5%">
                     </colgroup>
                     <thead>

                        <tr>
                           <th>NO</th>
                           <th>팀명</th>
                           <th>관리</th>

                        </tr>
                     </thead>

                     <tbody>

                        <c:forEach items="${everyMtList}" var="mt" varStatus="status">
                           <c:if test="${!empty everyMtList}">
                              <tr>
                                 <td>${status.count}</td>
                                 <td>${mt.teamName}</td>
                                 <td><a class="action-icon"
                                    href="/admin/mypage/mtremove?mtNo=${mt.mtNo}"> <i
                                       class="fas fa-trash" onclick="postRemove()"></i>
                                 </a></td>
                              </tr></c:if>
                        </c:forEach>

                        <c:if test="${empty everyMtList}">
                           <tr>
                              <td style="text-align:center;" colspan="14">내역이 없습니다.</td>

                           </tr>
                        </c:if>
                     </tbody>
                  </table>

                  <!-- /.box-body -->
                  </div>

                  <div class="box-footer" align="right">
                     <button type="submit" class="btn btn-primary">수정</button>


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
   $(document).ready(function() {

      var result = '${msg}';

      if (result == 'REMOVE') {
         alert("삭제되었습니다.");

      }

      if (result == '처리 완료되었습니다.') {
         alert("등록되었습니다.");

      }
      if (result == 'MODIFY') {
         alert("등록되었습니다.");

      }

   });
</script>

<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>
</html>