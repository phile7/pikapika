<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Do It!</title>
<link rel="stylesheet" href="CSS/LogIn.css">

<style type="text/css">
body{
	width: 720px; height: 1300px;
	background-image:url("IMG/login2.jpg"); 
	background-repeat: no-repeat;
	background-position: center;
	margin: 0 auto;
	
}
#empty1 { width:720px; height: 780px;}
#empty2 { width: 720px; height: 40px;}
#empty3 {width:720px; height: 54px;}
#empty4 {width:720px; height: 80px;}

</style>
</head> 
<body>
	<div id="empty1"></div>
	<form id="form" action="">
		<input type="text"  class="input" name="id" placeholder="아이디"> <br>
		<div class="clear"></div>
		<div id="empty2"></div>
		<input type="password" class="input" name="pw" placeholder="비밀번호"> <br>
		<div class="clear"></div>
		<div id= "empty3"></div>
		<input type="submit" class="submit" value="">
		<div id="empty4"></div>
	
	</form>
		<button onclick="window.location.href='Policy.jsp';" class=button></button>
	


</body>
</html>