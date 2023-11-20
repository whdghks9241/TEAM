<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="./css/styles.css">
		<meta charset="utf-8">
		<title>회원가입 실패</title>
	</head>
	<body>
		<div class="register_error">
			<img src="./img/느낌표.png" alt=""><br>    
				<p>회원 가입 중 오류가 발생하여 가입에 실패하였습니다.<br>
				   가입을 다시 시도해주세요.</p>  
        </div>
	<script>
		//3초 후 홈페이지로 이동하는 javascript
		setTimeout(function() {
			//이동할 페이지 경로 설정
			window.location.href="register.jsp";
		}, 4000); //4000 = 4초
	</script>
	</body>
</html>