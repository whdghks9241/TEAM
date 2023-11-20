<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="com.kh.sammi.Intermediary"%>
<%@ page import="com.kh.sammi.DAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 사이트</title>
<link rel="stylesheet" type="text/css" href="./css/MyPage.css">
</head>
<body>
	        <%
    	
    	int	USER_ID = (int) session.getAttribute("USER_ID");
    	DAO interDAO = new DAO();
    	
    	Intermediary inter = interDAO.getIntermediaryInfo(USER_ID);

        %>
	<script>
		window.onload = function() {
	    		var isError = <%=request.getParameter("error") %>;
	    		console.log(isError);
	    		if(isError) {
	    			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	    		}
	    	}
	</script>	
        <header>
            <div class="use_list_box">
<div class="use_list">
					<a href="Main.jsp" class="use_main">
						<span><img src="./img/로고.png" class="logo"></span>
					</a>   
				<ul class="use">
					<li>
					<%
					  if (session.getAttribute("ID") != null) {
					 %>
					
	
						<a href="logout.jsp" id="use_logout" title="로그아웃" onclick="logout()">
							<span><img src="./img/logout.png" class="logout"><br>LOGOUT</span>
						</a>
						<% 
					  }else{
						%>
						<a href="login.jsp" class="use_logout" title="로그인" >
							<span><img src="./img/login.png" class="logout"><br>LOGIN</span>
						</a>
						<%
					  }
						%>
					</li>
					  
					<li>
						<a href="login.jsp" class="use_mypage" title="마이페이지">
							<span><img src="./img/유저.png" class="user"><br>MY</span>
						</a>
					</li>
					<li>
						<a href="login.jsp" class="use_likelist" title="찜매물">
							<span><img src="./img/찜.png" class="like"><br>찜</span>
						</a>
						
					</li>
					
				</ul>
			</div>

            </div>
        </header>
        <section>
           <%
                		if (inter == null) {
                		%>
            <nav class="left_category">
                <div class="mypage" ><img src="./img/마이페이지_아이콘.png" alt="마이페이지 아이콘">
                        마이페이지</div>
                <ul>
                    <li onclick="location.href='IdCheck.jsp'">내정보</li>
                  			<li>찜한 매물</li>
		                    <li>내 문의내역</li>
		                    <li onclick="location.href='myPageIntermediaryAdd.jsp'">중개인 등록</li>
		                    <li onclick="location.href='deleteUser.jsp'">회원탈퇴</li>
            			
                </ul>
                     <hr>
            </nav>
                  			<%
                		} else {
	               		%>
	        <nav class="left_category">
                <div class="mypage" ><img src="./img/마이페이지_아이콘.png" alt="마이페이지 아이콘">
                        마이페이지</div>
                <ul>
                   <li onclick="location.href='IdCheck.jsp'">내정보</li>
                  			<li>찜한 매물</li>
		                    <li>내 문의내역</li>
		                    <li onclick="location.href='deleteUser.jsp'">회원탈퇴</li>
		                  
                </ul>		
                <div  style="margin-top:100px"  class="mypage" ><img src="./img/마이페이지_아이콘.png" alt="마이페이지 아이콘">
                        중개인 페이지</div>
                <ul>
	    					<li onclick="location.href='myPageIntermediarySearchAndEdit.jsp'">중개인 정보</li>
	    					<li onclick="location.href='myPageRealestateAdd.jsp'">매물 등록</li>
		                    <li onclick="location.href='RealestateAllSearch.jsp'">등록 매물 조회</li>
		                    <li onclick="location.href='intermediarySecession.jsp'">중개인 탈퇴</li>
                </ul>
                
     
            
            </nav>
                                		<%
                		}
                	%>
        </section>
            <article class="main">
                <h1 class="delete">회원탈퇴</h1><br>
                <hr class="width_line">
                
                <div class="dleletUser_box"> 
                    <img src="./img/회원탈퇴.png" alt="확인이미지">
                    <form action="DeleteUserServlet" method="post">
                    <div id="deleteUserCheck">    
                        <div id="deleteUserInfo">
                            <label for="ID">아이디 : </label>
                            <input type="text" placeholder="아이디 입력해주세요." id="ID" name="ID" required><br>
                            <label for="PASSWORD">비밀번호 : </label>
                            <input type="PASSWORD" placeholder="비밀번호 입력해주세요." id="PASSWORD" name="PASSWORD" required><br><br>
                          
                            <button type="submit" id="deleteButton">회원탈퇴</button>
                        <!--<input type="submit" value="회원탈퇴" id="deleteButton">-->
                        <!-- ******위에 input 대신 button으로 수정함 참고***** -->
                              
                        </div>
                    </div>
                </form>
                </div>
            </article>
    </body>
</html>