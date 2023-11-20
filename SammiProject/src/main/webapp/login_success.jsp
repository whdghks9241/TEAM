<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <link rel="stylesheet" type="text/css" href="./css/styles.css">
        <title>로그인 성공</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
	<body>
		<div class="login_success">
			<img src="./img/로그인 성공.png" alt=""><br>    
				<p>드루와방에 성공적으로 드루와써요!</p>  
        </div>
		
        <script>
			//3초 후 홈페이지로 이동하는 javascript
			setTimeout(function() {
				//이동할 페이지 경로 설정
				window.location.href="Main.jsp";
			}, 3000); //2000 = 3초
		</script>
	</body>
</html>