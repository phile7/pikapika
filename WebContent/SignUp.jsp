<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Do It!</title>

<style type="text/css">
body{
	width: 720px; height: 1300px;
	background-image:url("IMG/signup.jpg"); 
	background-repeat: no-repeat;
	background-position: center;
	margin: 0 auto;
	
}
#empty1 { width:720px; height: 510px;}
#empty2 { width: 720px; height: 45px;}
#empty3 {width:720px; height: 42px;}
#empty4 {width:720px; height: 67px;}
#empty5 {width: 720px; height: 190px;}

</style>
<link rel="stylesheet" href="CSS/SignUp.css">
</head> 
<body>  
<button class="exit" onclick="window.location.href='LogIn.jsp';"></button>

	<div id="empty1"></div> 
	<div id="sec">
		<form id="form" action="">
			<input type="text"  class="input" name="id" placeholder="아이디"> <br>
			<div class="clear"></div>
			<div id="empty2"></div>
			<input type="password" class="input" name="pw" placeholder="비밀번호"> <br>
			<div class="clear"></div>
			<div id= "empty3"></div>
			<input type="password" class="input" name="pwcheck" placeholder="비밀번호 확인"> <br>
			<div id="empty4"></div>
			<input type="email" class="input" name="email" placeholder="이메일">
			<div id="empty5"></div>
			<input type="submit" class="submit" value="">
		</form>
	</div>

</body>
</html>