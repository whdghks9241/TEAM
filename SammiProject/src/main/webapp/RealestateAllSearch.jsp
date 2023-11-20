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
<link rel="stylesheet" href="css/myPageRealestateSearch.css">
</head>
<!------------------------------------중개인 등록매물 미리보기 조회 --------------------------------->
<body>
	<%
	int	USER_ID = (int) session.getAttribute("USER_ID");
	int	INTERMEDIARY_ID = (int) session.getAttribute("INTERMEDIARY_ID");

	DAO dao = new DAO();
	Intermediary inter = dao.getIntermediaryInfo(USER_ID);
	List<Realestate> RealeList = dao.getAllRealestateInfo(INTERMEDIARY_ID);
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
                  			<li>찜한 매물</li>
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
        	<h1 style="padding:40px" >등록 매물 조회</h1>
        
         	<article class="main">
                <div class="type_box">
                    <div class="type_list">
                        <ul class="type">
                            <li style="color: #5887d6"><a href="RealestateAllSearch.jsp">전체매물</a></li>
                            <li><a href="addApartmentType.jsp">아파트</a></li>
                            <li><a href="addVillaType.jsp">빌라</a></li>
                            <li><a href="addOfficetelType.jsp">도시형생활주택</a></li>
                            <li><a href="addStudioType.jsp">원룸</a></li>
                            <li><a href="addHouseType.jsp">투룸</a></li>
                        </ul>
                        <hr style="width: 96%;">
                    </div>
                </div>
                
                
                <%
                	for (Realestate r : RealeList) {
                	
                %>
                
                <form method="post" action="realestateDetail.jsp">
	                <div class="realestate_area" style="border: 1px solid black; width:95%; height:170px; margin:20px; cursor:pointer;" onclick="location.href='realestateDetail.jsp?REALESTATE_ID=<%=r.getREALESTATE_ID()%>'">
	                    <div style="float: left">
					        <img src="<%= r.getREALESTATE_PHOTOS() %>" alt="Image" style="width:140px; height:140px; margin:15px; background-color:#eeeeee" />
					    </div>
					    <div style="margin:15px;">
					       <!-- 계약조건 -->
					       <span style="margin:4px"><%= r.getREALESTATE_CONDITION() %> / </span>
					       <!-- 매매가/ 전세가 / 보증금 -->
					       <% if (r.getREALESTATE_CONDITION().equals("매매")) {%>
					       		<span style="margin:4px">매매가 <%= r.getREALESTATE_SALEPRICE() %>원 / </span>
					       		<span style="margin:4px">관리비 <%= r.getREALESTATE_MAINTENANCE_COST() %>원</span><br><br>
					       <% } else if (r.getREALESTATE_CONDITION().equals("전세")) { %>
					       		<span style="margin:4px">전세가 <%= r.getREALESTATE_SALEPRICE() %>원 / </span>
					       		<span style="margin:4px">관리비 <%= r.getREALESTATE_MAINTENANCE_COST() %>원</span><br><br>
					       <% } else if (r.getREALESTATE_CONDITION().equals("월세")) { %>	
					       		<span style="margin:4px">보증금 <%= r.getREALESTATE_SALEPRICE() %>원 / </span>
					       		<span style="margin:4px">월세 <%= r.getREALESTATE_MONTHLY() %>원 / </span>
					       		<span style="margin:4px">관리비 <%= r.getREALESTATE_MAINTENANCE_COST() %>원</span><br><br>
					       <% } %>
					       
					       <!-- 건물종류 -->
					       <span style="margin:4px"><%= r.getREALESTATE_TYPE() %> / </span>
					       <!-- 면적 -->
					       <span style="margin:4px"><%= r.getREALESTATE_AREA() %> ㎡ / </span>
					       <!-- 층수 -->
					       <span style="margin:4px"><%= r.getFLOORS() %> </span><br><br>
					       <!-- 방개수 -->
					       <span style="margin:4px">방 <%= r.getROOMS_COUNT() %>개 /</span>
					       <!-- 화장실 -->
					       <span style="margin:4px">화장실 <%= r.getTOILET_COUNT() %>개 /</span>
					       <!-- 주차가능수 -->
					       <span style="margin:4px">주차가능 <%= r.getPARKING_COUNT() %>대</span>
					     <input TYPE="hidden" id="request" name="request" value="request-realestateDetail">
					    
					    </div>
	                </div>
                </form>
				<%
				}
				%>

            </article>
        </nav>
    </section>

</body>
</html>