<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="./css/styles.css">
        <title>로그인 실패</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
	<body>
		<div class="login_error">
			<img src="./img/느낌표.png" alt=""><br>    
				<p>아이디 또는 비밀번호를 잘못 입력하였습니다.</p>  
        </div>
		
        <script>
			//3초 후 홈페이지로 이동하는 javascript
			setTimeout(function() {
				//이동할 페이지 경로 설정
				window.location.href="login.jsp";
			}, 3000); //2000 = 3초
		</script>
	</body>
</html>