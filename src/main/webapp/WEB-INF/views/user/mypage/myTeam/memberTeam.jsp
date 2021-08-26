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
<title>LISTENER 팀 설정</title>
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
                  팀 설정</div>
               &nbsp;&nbsp;&nbsp;&nbsp;
               <!-- /.box-header -->

               <form name="frm" method="post" role="form">
                  <input type="hidden" name="teamNo" id="teamNo">
                  <input type="hidden" name="id" id="id" value="${login.id}">

                        <div class="form-row">
                                 <div class="form-group col-md-12">
                                    <label for="inputEmail4" class="col-form-label">팀</label><span
                                       class="text-danger"></span>
                                    <div class="input-group">
                                       <input type="text" class="form-control" name="teamName"
                                          id="teamName" readonly="readonly"
                                          placeholder="팀을 선택해주세요.">
                                       <div class="input-group-append">
                                          
                                            <button class="btn btn-primary" type="button" onClick="window.open('/user/mypage/myTeam/searchPopup?id=${login.id}', 'CLIENT_WINDOW',
                                          'toolbar=no,menubar=no,width=400,height=400')"
                                                id="popupBtn">검색</button>
                                          
                                       </div>
                                    </div>
                                 </div>
                              </div>

                              <br>
                              <div style="text-align: right;">
                                 <button type="submit" class="btn btn-primary">등록</button>
                                 <button type="button" onclick="location.href='http://localhost:8181/user/mypage/myInfo' ">취소</button>
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


      <!-- Sidebar -->
      <div id="sidebar">
         <div class="inner">



            <!-- Menu -->
            <nav id="menu">
               <header class="major">
                  <h2>Menu</h2>
               </header>
               <ul>
                  <li><a href="index.html">공지사항</a></li>
                  <li><a href="generic.html">동아리활동 게시판</a></li>
                  <li><a href="elements.html">팀 구인구직 게시판</a></li>
                  <li><span class="opener">자유게시판</span>
                     <ul>
                        <li><a href="#">Lorem Dolor</a></li>
                        <li><a href="#">Ipsum Adipiscing</a></li>
                        <li><a href="#">Tempus Magna</a></li>
                        <li><a href="#">Feugiat Veroeros</a></li>
                     </ul></li>
                  <li><a href="#">합주실 시간표</a></li>
                  <li><a href="#">마이페이지</a></li>


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
   // searchSub 팝업창 띄우기


   // 신청 등록 유효성 검사 
   function validate() {
      var mtNo = $("#mtNo").val();
      var id = $("#id").val();
      var teamNo = $("#teamNo").val();

      if (mtNo == "") {
         alert("팀을 선택해주세요.");
         document.getElementById("teamName").focus();
         return false;
      }

      return true;

   }
</script>

<script>
   $(document).ready(function() {

      var formObj = $("form[role='form']");

      console.log(formObj);

      $("#btn_submit").on("click", function() {

         var send_array = Array();
         var send_cnt = 0;
         var chkbox = $(".checkBox2");

         var teamName = $("#teamName").val();

         if (times == "") {
            alert("팀을 선택해주세요.");
            document.getElementById("teamName").focus();
            return false;
         }

         for (i = 0; i < chkbox.length; i++) {
            send_array[send_cnt] = chkbox[i].value;
            send_cnt++;
         }

         if (send_cnt == 0) {
            alert("팀을 추가해주세요.");
            return false;
         }

         $("#check").val(send_array);

         formObj.submit();
      });
   });
</script>


<script>
   $(document).ready(function() {

      $("#detached-check input:radio").click(function() {

         alert("clicked");

      });

      $("input:radio:first").prop("checked", true).trigger("click");

   });

   // 추가
   $("#everyMtList")
         .click(
               function() {
                  var checkbox = $("input[name=check]:checked");
                  checkbox
                        .each(function() {

                           $(this).parent().parent();
                           var tr = $(this).parent().parent();

                           var td = tr.children();

                           var id = $(this).val();

                           var teamName = td.eq(3).text();
                           var row = "<tr>"
                                 + "<td>"
                                 + "<input type=\"checkbox\" class=\"checkBox2\" name=\"check2\" value=\"" + id + "\"" + ">"
                                 + "</td>" + "<td>" + teamName
                                 + "</td>" + "</tr>";

                           // 숨긴 값의 체크박스를 false 상태로 바꿈
                           $(this).prop("checked", false);
                           tr.remove();

                           $("#everyMtList > tbody").append(row);

                           $("#everyMtList").prop("checked", false);

                        })

               });

   //삭제
   $("#delete")
         .click(
               function() {
                  var checkbox = $("input[name=check2]:checked");
                  checkbox
                        .each(function() {

                           $(this).parent().parent();
                           var tr = $(this).parent().parent();
                           var td = tr.children();
                           var id = $(this).val();
                           var id = td.eq(1).html();
                           var userName = td.eq(2).text();
                           var row = "<tr class=\"stu"+ grade+"\"> "
                                 + "<td>"
                                 + "<input type=\"checkbox\" class=\"checkBox\" name=\"check\" value=\"" + userNo + "\"" + ">"
\                                 + "</td>" + "<td>" + id + "</td>"
                                 + "<td>" + name + "</td>"
                                 + "</tr>";

                           // 숨긴 값의 체크박스를 false 상태로 바꿈
                           $(this).prop("checked", false);
                           tr.remove();
                           $("#stuList > tbody").append(row);

                           $("#allCheck2").prop("checked", false);

                        });

                  // searchSub 팝업창 띄우기
                  $("#carPopup")
                        .click(
                              function() {
                                 var url = "searchPopup";
                                 var name = "팀 검색";
                                 var option = "width = 700, height = 500, top = 100, left = 200, location = no";
                                 //window.open(url, name, option);      
                                 window
                                       .open(
                                             "/user/mypage/myTeam/searchPopup?make_date="
                                                   + make_date,
                                             "_blank",
                                             "toolbar=yes,menubar=yes,width=700.height=500");

                              }
                        //팝업
                        /*    
                           $(document).ready(function(){
                              var formObj = $("form[role='form']");
                              
                              
                              $('#popupBtn').on("click",function(){
                                 var make_date = $("#make_date").val();
                                 
                                 window.open("/user/mypage/myScore/searchPopup?make_date="+make_date,"_blank","toolbar=yes,menubar=yes,width=700.height=500").focus();
                              });
                           
                           } */
                        );
               });
</script>


</body>
</html>