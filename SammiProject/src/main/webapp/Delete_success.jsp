<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="./css/MyPage.css">
        <title>회원탈퇴 성공</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
	<body>
		<div class="deleteUser_success">
			<img src="./img/헌집.png" alt=""><br>    
				<p>회원탈퇴 완료<br>
				   잠시 후 로그인 페이지로 이동합니다.</p>    
        </div>
		
        <script>
			//3초 후 홈페이지로 이동하는 javascript
			setTimeout(function() {
				//이동할 페이지 경로 설정
				window.location.href="login.jsp";
			}, 3000); //3000 = 3초
		</script>
	</body>
</html>