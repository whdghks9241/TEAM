<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ page import="com.kh.sammi.Realestate"%>
<%@ page import="com.kh.sammi.Intermediary"%>
<%@ page import="java.util.List"%>
<%@ page import="com.kh.sammi.DAO"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="./css/MyPage.css">
        <link rel="stylesheet" href="css/mypage2.css">	
<link rel="stylesheet" href="css/myPageRealestateSearch.css">
        <title>마이페이지 내정보 화면</title> 
        <meta charset="UTF-8">
    </head>
    <body>
    <%
	int	USER_ID = (int) session.getAttribute("USER_ID");
	
	DAO dao = new DAO();
	Intermediary inter = dao.getIntermediaryInfo(USER_ID);
	%>
    <form action="UserInfoUpdateServlet" method="post" id=updateForm>
    	<script>
			window.onload = function() {
				var isSuccess = <%=request.getParameter("success") %>;
				console.log(isSuccess);
				if(isSuccess) {
					alert("수정이 완료되었습니다.")
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
                            <a href="logout.jsp" class="use_logout" title="로그아웃">
                                <span><img src="./img/logout.png" class="logout"><br>LOGOUT</span>
                            </a>
                        </li>
                        <li>
                            <a href="MyPage.jsp" class="use_mypage" title="마이페이지">
                                <span><img src="./img/유저.png" class="user"><br>MY</span>
                            </a>
                        </li>
                        <li>
                            <a href="MyPageLikeList.jsp" class="use_likelist" title="찜매물">
                                <span><img src="./img/찜.png" class="like"><br>찜</span>
                            </a>
                         </li>
                    </ul>

                </div>

            </div>
        </header>
        <section>
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
	            		    <li onclick="location.href='idCheck.jsp'"><a href="IdCheck.jsp">내정보</a></li>
                  			<li><a href="MyPageLikeList.jsp">찜한 매물</a></li>
		                    <li>내 문의내역</li>
		                    <li onclick="location.href='myPageIntermediaryAdd.jsp'">중개인 등록</li>
		                    <li onclick="location.href='deleteUser.jsp'">회원탈퇴</li>
            			<%
                		} else {
	               		%>
 							<li onclick="location.href='idCheck.jsp'"><a href="IdCheck.jsp">내정보</a></li>
                  			<li><a href="MyPageLikeList.jsp">찜한 매물</a></li>
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
		</section>
            <article class="main">
                <h1 class="myinfo">내 정보</h1><h class="annotation">수정할 정보 입력 후 하단의 수정하기를 눌러주세요.</h><br>
                <hr class="width_line">
                
                <!-- 아이디/비번 확인 후 불러올 정보출력 -->
               	<% String id = (String) session.getAttribute("userid"); %>
               	<% String phone_number = (String) session.getAttribute("phonenumber"); %>
               	<% String EMAIL = (String) session.getAttribute("email"); %>
               	<% String ADDRESS = (String) session.getAttribute("address"); %>
                

                 <div class="infolist_box">
                    <img src="./img/수정.png" alt="수정이미지">
                    <div class="user_info">
                        <div class="user_infolist">
                            <label for="userid">아이디 :</label>
                            <input type="text" id="userid" name="userid" value="<%=id %>" readonly><br>

                            <label for="password">비밀번호 :</label>
                            <input type="password" id="password" name="password" placeholder="변경할 비밀번호를 입력해주세요." required><br>
                            <!-- 예외 처리 -->
                          

                            <label for="phonenumber">휴대폰 번호 :</label>
                            <input type="text" id="phonenumber" name="phonenumber" placeholder="휴대폰 번호를 '-' 없이 입력해주세요." value="<%=phone_number %>" required><br>
                            
                            <label for="email">이메일 :</label>
                            <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요." value="<%=EMAIL %>" required><br>

                            <label for="address">주소 :</label>
                            <input type="address" id="address" name="address" placeholder="주소를 입력해주세요." value="<%=ADDRESS %>" required><br>

                            <button type="submit" form="updateForm" id="infomodify">수정하기</button>                                
                            
                            <!-- 탈퇴하기 페이지로 전환 -->
                            <a href="deleteUser.jsp">
                            <button type="button" id="withdraw">회원탈퇴</button>     
                            </a>                           
                               
                        </div>
                    </div>
                </div>
            </article>
		</form>
    </body>
</html>