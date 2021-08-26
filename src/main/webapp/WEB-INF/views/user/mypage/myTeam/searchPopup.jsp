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
<title>LISTENER 팀 목록</title>
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
   <div class="wrapper">
      <!-- ============================================================== -->
      <!-- Start Page Content here -->
      <!-- ============================================================== -->

      <div class="content-page">
         <div class="content">

            <!-- Start Content-->
            <div class="container-fluid">

               <!-- start page title -->
             
               <!-- end page title -->

               <div class="row">
                  <div class="col-12">
                  
                  <!-- 검색기능 안쓰기로 결정  - 사유 :: 검색하면 선택했던 진로분야가 나타남 (오류수정 시간부족) -->
                     <!-- <div class="card">
                        <div class="card-body">
                           <div class="row">
                              <div class="form-row col-md-12">
                                 <div class="form-group col-md-12">
                                    <label for="inputEmail4" class="col-form-label">진로분야</label>
                                    <form action="searchCar" method="get"
                                       onsubmit="return searchCheck();">
                                       <div class="input-group">
                                          <input type="text" class="form-control" id="carName"
                                             name="carName" placeholder="진로분야를 선택해주세요.">
                                          <div class="input-group-append">
                                             <button class="btn btn-primary" type="submit">검색</button>
                                          </div>
                                       </div>
                                    </form>
                                 </div>
                              </div>
                           </div>
                           end row
                        </div>
                        end card body
                     </div> -->
                     <!-- end card -->

                 <div class="card">
                        <div class="card-body">
                                 
                                    <label for="inputEmail4" class="col-form-label" style="font-weight: bold; font-size: 30px; line-height: 1.0em; font-family: 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif; color: black">
                                    전체 팀리스트</label>
                                    <div class="table-responsive">
                                       <table class="table table-centered mb-0">
                                          <thead class="thead-light">
                                             <tr>
                                                <th style="width: 100px" >NO</th>
                                                <th>팀명</th>
                                                <th>팀장</th>
                                                <th>팀장 번호</th>

                                             </tr>
                                          </thead>
                                          <tbody>
                                             <c:if test="${!empty teamList}">
                                                <c:forEach items="${teamList}" var="teamVO"
                                                   varStatus="listStat">
                                                   <tr>
                                                      <td style="height: 70px">${listStat.count}<input type="hidden"
                                                         name="teamNo" id="teamNo" value="${teamVO.teamNo}">
                                                      </td>

                                                      <td><a href="#"
                                                         onclick="sendData('${teamVO.teamNo}', '${teamVO.teamName}')">${teamVO.teamName}
                                                         </a></td>
                                                         <td>${teamVO.captain}</td>
                                                         <td>${teamVO.captainPh}</td>
                                                   </tr>
                                                </c:forEach>
                                             </c:if>
                                             <c:if test="${empty teamList}">
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

      <!-- ============================================================== -->
      <!-- End Page content -->
      <!-- ============================================================== -->


   </div>
   <!-- END wrapper -->

  
   <!-- Scripts -->
   <script src="/resources/assets/js/jquery.min.js"></script>
   <script src="/resources/assets/js/browser.min.js"></script>
   <script src="/resources/assets/js/breakpoints.min.js"></script>
   <script src="/resources/assets/js/util.js"></script>
   <script src="/resources/assets/js/main.js"></script>


</body>

<script>
   // 부모창으로 정보 보내기
   function sendData(teamNo,teamName) {
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

   //항목 명 유효성 검사
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