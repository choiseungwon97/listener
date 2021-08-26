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
<title>LISTENER 회원가입</title>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<!-- 폰트적용하려면 아래링크넣어야함 -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
</head>


<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="/" class="logo"> <img class="logo"
						src="resources/images/logo2.png"></a>
					<ul class="icons">
						
                  <li><a href="https://www.facebook.com/listenerforever/"
                     target="_blank" class="icon brands fa-facebook-f"><span
                        class="label">Facebook</span></a></li>

                  <li><a
                     href="https://instagram.com/li2tener?utm_medium=copy_link"
                     target="_blank" class="icon brands fa-instagram"><span
                        class="label">Instagram</span></a></li>
					</ul>
				</header>
				<div
					style="font-weight: bold; font-size: 90px; line-height: 1.0em; font-family: 돋움체; color: black">회원가입</div>
					&nbsp;	&nbsp;	&nbsp;	
<form name="frm" method="post" >				

				<div class="content">
					<div class="field">
						<div class="row">
							<label for="memberId">ID<span style="color: red">*</span></label>
							<div class="col-8 col-12-small">
								<input type="text" name="id" id="id" value="" /> <input
									type="hidden" name="reid">
							</div>
							<div class="col-2 col-12-small">

							<!-- 	<ul class="actions fit">
									<li><button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button></li>
								</ul> -->
								    <!--  <div class="input-group-append"> -->
								     <ul class="actions fit">
		                                        <li>      <button class="btn btn-info" id="checkBtn" type="button" onclick="checkId()">중복확인</button></li>
		                                         <!--  </div> --></ul>
		                                      </div>
		                                      <div class="invalid-feedback" id="invalid-feedback" style="display: none;">*이미 존재하는 아이디입니다.</div>
		                                      <div class="valid-feedback" id="valid-feedback" style="display: none;">*사용 가능한 아이디입니다.</div>
							</div>
						</div>
					</div>
					<div class="field">
						<label for="memberPw">비밀번호<span style="color: red">*</span></label>
						<input type="password" name="pw" id="pw" value="" minlength="6"/>
					</div>
					&nbsp; &nbsp; &nbsp;
					
					<div class="field">
						<label for="memberPw">비밀번호확인<span style="color: red">*</span></label>
						<input type="password" name="pwfm" id="pwfm" value="" minlength="6"/>
					</div>
					&nbsp; &nbsp; &nbsp;


					<div class="field">
						<label for="memberFName">성명(이름)<span style="color: red">*</span></label>
						<input type="text" name="name" id="name" value="" />
					</div>
					&nbsp; &nbsp; &nbsp;
					
					<div class="field">
						<label for="memberFName">닉네임<span style="color: red">*</span></label>
						<input type="text" name="nickname" id="nickname" value="" />
					</div>
					&nbsp; &nbsp; &nbsp;

					<div class="field">
						<label for="memberAge">학과<span style="color: red">*</span></label>
						<input type="text" name="major" id="major" value="" />
					</div>
					&nbsp; &nbsp; &nbsp;

					<div class="field">
						<label for="memberPw">학번<span style="color: red">*</span></label>
						<input type="text" name="stid" id="stid" placeholder="8자리로 입력해주세요"  maxlength="8" numberOnly/>
					</div>
					&nbsp; &nbsp; &nbsp;

					<div class="field">
						<label for="memberLName">생년월일<span style="color: red">*</span></label>
						<input type="text" name="birth" id="birth" placeholder="6자리로입력해주세요" maxlength="6" numberOnly/>
					</div>
					&nbsp; &nbsp; &nbsp;
					
					<div class="field">
						<label for="memberLName">전화번호<span style="color: red">*</span></label>
						<input type="text" name="ph" id="ph" placeholder="010-xxxx-xxxx으로 입력해주세요" />
					</div>
					&nbsp; &nbsp; &nbsp;

					<div class="field">
						<label for="memberFName">거주지(동까지만)<span style="color: red">*</span></label>
						<input type="text" name="address" id="address" value="" />
					</div>
					&nbsp; &nbsp; &nbsp;

					<div class="field">
						<label for="message">지원동기<span style="color: red">*</span></label>
						<textarea name="why" id="why" rows="3"></textarea>
					</div>
					&nbsp; &nbsp; &nbsp;

					<div class="field">
						<label for="memberAge">지원파트<span style="color: red">*</span></label>
						<input type="text" name="memberSession" id="memberSession" value="" />
					</div>
					&nbsp; &nbsp; &nbsp;

					<div class="field">
						<label for="memberAge">선호 장르<span style="color: red">*</span></label>
						<input type="text" name="likeGenre" id="likeGenre" value="" />
					</div>
					&nbsp; &nbsp; &nbsp;

					<div class="field">
						<label for="memberAge">선호 아티스트<span style="color: red">*</span></label>
						<input type="text" name="artist" id="artist" value="" />
					</div>
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

										<div class="box-footer" align="right">

						<button type="submit" class="btn btn-primary" id="btn_submit" disabled="disabled">회원가입</button>
						<button type="button" onclick="location.href='login' ">취소</button>
					</div>
</form>
				</div>

			</div>
		</div>

	


	<!-- Scripts -->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/browser.min.js"></script>
	<script src="resources/assets/js/breakpoints.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<script src="resources/assets/js/main.js"></script>
	
	

<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$("#btn_submit").on("click", function() {

				var id = $("#id").val();
			    var pw = $("#pw").val();
			    var pwfm = $("#pwfm").val();
			    var name = $("#name").val();
			    var nickname = $("#nickname").val();
			    var stid = $("#stid").val();
			    var major = $("#major").val();
			    var birth = $("#birth").val();
			    var ph = $("#ph").val();
			    var address = $("#address").val();
			    var memberSession = $("#memberSession").val();
			    var why = $("#why").val();
			    var likeGenre = $("#likeGenre").val();
			    var artist = $("#artist").val();
			   var patternPhone = new RegExp("01[016789]-[^0][0-9]{2,3}-[0-9]{4}");  
			   var patternBirth = new RegExp("[0-9]{6,7}");  
			   var patternStid = new RegExp("[0-9]{8,9}");  



			    
			    
			    
			    if(id == ""){
			        alert("아이디를 입력해 주세요"); 
			        $("#id").focus();
			        return false;
			    }
			    
			    if(pw == ""){
			        alert("비밀번호를 입력해 주세요"); 
			        $("#pw").focus();
			        return false;
			    }
			    
			    if(pwfm == ""){
			        alert("비밀번호를 입력해 주세요"); 
			        $("#pwfm").focus();
			        return false;
			    }
			    
			    if(pw != pwfm){
			        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
			        $("#pwfm").focus();
			        return false; 
			    }
			 
			    if(name == ""){
			        alert("이름을 입력해 주세요"); 
			        $("#name").focus();
			        return false;
			    }
			    
			    if(nickname == ""){
			        alert("닉네임을 입력해 주세요"); 
			        $("#nickname").focus();
			        return false;
			    }
			    
			    if(stid == ""){
			        alert("학번을 입력해 주세요"); 
			        $("#stid").focus();
			        return false;
			    }
			    if(major == ""){
			        alert("전공 입력해 주세요"); 
			        $("#major").focus();
			        return false;
			    }
			    if(birth == ""){
			        alert("생일을 입력해 주세요"); 
			        $("#birth").focus();
			        return false;
			    }
			    if(ph == ""){
			        alert("핸드폰번호를 입력해 주세요"); 
			        $("#ph").focus();
			        return false;
			    }
			    if(address == ""){
			        alert("주소를 입력해 주세요"); 
			        $("#address").focus();
			        return false;
			    }
			    if(memberSession == ""){
			        alert("선호 악기를 입력해 주세요"); 
			        $("#memberSession").focus();
			        return false;
			    }
			    if(why == ""){
			        alert("지원동기를 입력해 주세요"); 
			        $("#why").focus();
			        return false;
			    }
			    if(likeGenre == ""){
			        alert("선호장르를 입력해 주세요"); 
			        $("#likeGenre").focus();
			        return false;
			    }
			    if(artist == ""){
			        alert("선호가수 입력해 주세요"); 
			        $("#artist").focus();
			        return false;
			    }
			    if(!patternPhone.test(ph))
			    {
			        alert('핸드폰 번호는 000-0000-0000 으로 입력 해주세요');
			        $("#ph").focus();
			        return false;
			    }  
			    
			    if(!patternBirth.test(birth))
			    {
			        alert('생년월일은 6글자로 입력 해주세요');
			        $("#birth").focus();
			        return false;
			    }  

			    if(!patternStid.test(stid))
			    {
			        alert('학번은 8글자로 입력 해주세요');
			        $("#stid").focus();
			        return false;
			    }  


				formObj.submit();
			});
		});
		
		
		
		// ID 중복검사 AJAX. 
		function checkId() {
			var id = $("#id").val();
			
			if(id == ""){
				alert("ID를 입력해주세요.");
				$("#id").focus();
				return false;
			}
			else{
				$.ajax({
					url: "checkId?id="+id,
					type: "GET",
					success: function(data){
						console.log(data);
						if(data == false){
							$("#invalid-feedback").css("display","inline");
							$("#valid-feedback").css("display", "none");
							$("#registerBtn").prop("disabled", "disabled");
						}
						if(data == true){
							$("#invalid-feedback").css("display","none");
							$("#valid-feedback").css("display", "inline");
							$("#btn_submit").prop("disabled", "");
						}
					},
					error: function(){
						console.log("error");
					}
				});		
			}	

		}
	</script>

 <script type="text/javascript">
 $(document).ready(function(){
 
   $("input:text[numberOnly]").on("keyup", function() {
      $(this).val($(this).val().replace(/[^0-9]/g,""));
   });
   
 });
 </script>
	
</body>
</html>