<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.kh.sammi.Intermediary"%>
<%@ page import="com.kh.sammi.DAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/myPageIntermediarySearchAndEdit.css">
<link rel="stylesheet" href="css/mypage2.css">
</head>
<!------------------------------------ 중개인 정보 조회 및 수정 탭 --------------------------------->
<body>
<%
	// 중개인의 정보를 들고온후 데이터를 집어 넣는다
 	int	USER_ID = (int) session.getAttribute("USER_ID");
	DAO interDAO = new DAO();
	Intermediary inter = interDAO.getIntermediaryInfo(USER_ID);

%>
	<header style="background: linear-gradient(to right, #6190E8,#A7BFE8);">
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
         	<h1 class="titleText" >중개인 정보</h1>

    		<form class="InterEditContainer" action="ConnectionServlet" method="post">
        		<div class="InterAdItem">
        			<label for="BUSINESS_NUMBER">사업자번호</label><br>
		        	<input type="text" id="BUSINESS_NUMBER" name="BUSINESS_NUMBER" value="<%= inter.getBUSINESS_NUMBER() %>" readonly><br>
        		</div>
        		<div class="InterAdItem">
        			<label for="CEO_NAME">대표이름</label><br>
		        	<input type="text" id="CEO_NAME" name="CEO_NAME" value="<%= inter.getCEO_NAME() %>" required><br>
        		</div>
				<div class="InterAdItem">
			        <label for="COMPANY_NAME">부동산이름</label><br>
			        <input type="text" id="COMPANY_NAME" name="COMPANY_NAME" value="<%= inter.getCOMPANY_NAME() %>" required><br>
		        </div>
		        <div class="InterAdItem">
			        <label for="COMPANY_ADDRESS">부동산주소</label><br>
			        <input type="text" id="COMPANY_ADDRESS" name="COMPANY_ADDRESS" value="<%= inter.getCOMPANY_ADDRESS() %>" required><br>
		        </div>
		        <div class="InterAdItem">
			        <label for="CONTACT_START_TIME">문의시작시간</label><br>
			        <input type="time" id="CONTACT_START_TIME" name="CONTACT_START_TIME" value="<%= inter.getCONTACT_START_TIME() %>" required><br>
		        </div>
		         <div class="InterAdItem">
			        <label for="CONTACT_END_TIME">문의종료시간</label><br>
			        <input type="time" id="CONTACT_END_TIME" name="CONTACT_END_TIME" value="<%= inter.getCONTACT_END_TIME() %>" required><br>
		        </div>
				<input TYPE="hidden" id="request" name="request" value="request-inermediary_edit">
		        <button class=editButton type="submit" >정보 수정</button>
    		</form> 
        </nav>
    </section>
</body>
</html>