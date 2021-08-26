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
<title>LISTENER 팀 찾기</title>
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
					<a href="index.html" class="logo"><strong>Editorial</strong> by
						HTML5 UP</a>
					<ul class="icons">
						<li><a href="#" class="icon brands fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands fa-facebook-f"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands fa-snapchat-ghost"><span
								class="label">Snapchat</span></a></li>
						<li><a href="#" class="icon brands fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-medium-m"><span
								class="label">Medium</span></a></li>
					</ul>
				</header>
				&nbsp;&nbsp;&nbsp;

  <!-- start page title -->
               <div class="row">
                  <div class="col-12">
                     <div class="page-title-box">
                        <h4 class="page-title">팀 검색</h4>
                     </div>
                  </div>
               </div>
               <!-- end page title -->

               <div class="row">
                  <div class="col-12">
                     <div class="card">
                        <div class="card-body">
                           <div class="row">
                              <div class="form-row col-md-12">
                                 <div class="form-group col-md-12">
                                    <label for="inputEmail4" class="col-form-label">팀</label>
                                    <form method="get" onsubmit="return searchCheck();">
                                       <div class="input-group">
                                          <input type="text" class="form-control" id="teamName"
                                             name="teamName" placeholder="팀을 선택해주세요.">
                                          <div class="input-group-append">
                                             <button class="btn btn-primary" type="submit">검색</button>
                                          </div>
                                       </div>
                                    </form>
                                 </div>
                              </div>
                           </div>
                           <!-- end row -->
                        </div>
                        <!-- end card body-->
                     </div>
                     <!-- end card -->

                     <div class="card">
                        <div class="card-body">
                           <div class="row">
                              <div class="form-row col-md-12">
                                 <div class="form-group col-md-12">
                                    <label for="inputEmail4" class="col-form-label">검색된
                                       항목리스트</label>
                                    <div class="table-responsive">
                                       <table class="table table-centered mb-0">
                                          <thead class="thead-light">
                                             <tr>
                                                <th>NO</th>
                                                <th>팀명</th>

                                             </tr>
                                          </thead>
                                          <tbody>
                                             <c:if test="${!empty searchTeamList}">
                                                <c:forEach items="${searchTeamList}" var="teamVO"
                                                   varStatus="listStat">
                                                   <tr>
                                                      <td>${listStat.count}<input type="hidden"
                                                         name="teamNo" id="teamNo" value="${teamVO.teamNo}">
                                                      </td>

                                                      <td><a href="#"
                                                         onclick="sendData('${teamVO.teamNo}', '${teamVO.teamName}')">${teamVO.teamName}</a></td>

                                                   </tr>
                                                </c:forEach>
                                             </c:if>
                                             <c:if test="${empty searchTeamList}">
                                                <tr>
                                                   <td colspan="2">내역이 없습니다.</td>
                                                </tr>
                                             </c:if>
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- end row -->
                        </div>
                        <!-- end card body-->
                     </div>

                  </div>
                  <!-- end col-12 -->
               </div>
               <!-- end row -->

            </div>
            <!-- container -->

         </div>
         <!-- content -->

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
						<li><a href="/user/team/list">팀구인구직 게시판</a></li>
						<li><a href="/user/freeBoard/list">자유게시판</span></a></li>
						<li><a href="/calendar">합주실 시간표</a></li>
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
   //부모창으로 정보 보내기
   function sendData(carNo,carName) {
      var teamNo = teamNo;
      
      var teamName = teamName;
      

      if (teamNo == 0) {
         $("#teamNo", opener.document).attr('readonly', false);
         $("#teamNo", opener.document).val('');
         opener.document.frm.teamNo.value = teamNo;
         
         
         opener.document.frm.teamName.value = teamName;
         

      } else if (teamNo > 0) {
         $("#teamNo", opener.document).attr('readonly', true);
         opener.document.frm.teamNo.value = teamNo;
         
         opener.document.frm.teamName.value = teamName;
         
      }

      window.close();

   }
   // 항목 명 유효성 검사
   function searchCheck() {
      var teamName = $("#teamName").val();

      if (teamName == "") {
         alert("팀을 선택해주세요.");
         document.getElementById("teamName").focus();
         return false;
      }
   }
</script>
</html>