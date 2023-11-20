<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.kh.sammi.Realestate"%>
<%@ page import="com.kh.sammi.Intermediary"%>
<%@ page import="java.util.List"%>
<%@ page import="com.kh.sammi.DAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/mypage2.css">	
<link rel="stylesheet" href="./css/myPageIntermediarySecession.css">
</head>
<!------------------------------------ 중개인 탈퇴 탭 --------------------------------->
<body>
	<%

	int	USER_ID = (int) session.getAttribute("USER_ID");
	
	int	INTERMEDIARY_ID = (int) session.getAttribute("INTERMEDIARY_ID");
	
	DAO dao = new DAO();
	Intermediary inter = dao.getIntermediaryInfo(USER_ID);
	%>
	<header>
		<!-- 로고 및 상단 버튼 -->
        <img src="./img/로고.png" class="logo">
        <div class="frame">
            <div class="likelist_frame">
                <img src="./img/찜.png" class="likelist"><br>
                <span>찜</span>
            </div>
            <div class="user_frame">
                <img src="./img/유저.png" class="user"><br>
                <span>MY</span>
            </div>
            <div class="logout_frame">
                <img src="./img/logout.png" class="logout"><br>
                <span>로그아웃</span>
            </div>
           
        </div>
	</header>
	<section class="aa">
        <nav class="container_left">
            <div>
                <!-- 중간 지점 -->
                <!-- 좌측 메뉴 --> 
          
                <div class="page_frame">
                    <img src="IMG/home.png" class="home">
                    <span>마이페이지</span>
                </div>
                <div class="menu_list">   
                	<%
                		if (inter == null) {
                		%>
	            		    <li onclick="location.href='IdCheck.jsp'">내정보</li>
                  			<li>찜한 매물</li>
		                    <li>내 문의내역</li>
		                    <li onclick="location.href='myPageIntermediaryAdd.jsp'">중개인 등록</li>
		                    <li onclick="location.href='deleteUser.jsp'">회원탈퇴</li>
            			<%
                		} else {
	               		%>
 							<li onclick="location.href='IdCheck.jsp'">내정보</li>
                  			<li>찜한 매물</a></li>
		                    <li>내 문의내역</li>
		                    <li onclick="location.href='deleteUser.jsp'">회원탈퇴</li>
		                    
		                    <div class="page_frame2">
			                    <img src="IMG/user.png" class="home">
			                    <span>중개인 페이지</span>
			                </div>
	    					<li onclick="location.href='myPageIntermediarySearchAndEdit.jsp'">중개인 정보</li>
	    					<li onclick="location.href='myPageRealestateAdd.jsp'">매물 등록</li>
		                    <li onclick="location.href='RealestateAllSearch.jsp'">등록 매물 조회</li>
		                    <li onclick="location.href='intermediarySecession.jsp'">중개인 탈퇴</li>
                		<%
                		}
                	%> 

                </div>
            </div>
        </nav>
        <nav class="container_right">
  		<form class="InterEditContainer" action="ConnectionServlet" method="post">
				<div id="InterAdItem">
					<label for="ID">아이디</label>
					<input type="text" id="ID" name="ID" required><br>
				</div>
        		<div>
					<label for="PW">비밀번호</label>
					<input type="password" id="PW" name="PW" required><br>
				</div>
				<input TYPE="hidden" id="request" name="request" value="request-inermediary_delete">
				<button class="deleteButton" type="submit">중개인 탈퇴</button>
        	</form>

        </nav>
    </section>

</body>
</html>