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
<link rel="stylesheet" href="css/myPageRealestateAdd.css">
</head>
<!------------------------------------ 중개인 등록 매물 상세정보 탭 --------------------------------->
<body>

 	<%

		int	USER_ID = (int) session.getAttribute("USER_ID");
		
        String REALESTATE_ID_Param = request.getParameter("REALESTATE_ID");
	  int	INTERMEDIARY_ID = (int) session.getAttribute("INTERMEDIARY_ID");
	
        int REALESTATE_ID = Integer.parseInt(REALESTATE_ID_Param);
       	DAO DAO = new DAO();
       	Realestate r = DAO.getRealestaInfo(REALESTATE_ID, INTERMEDIARY_ID);
    	Intermediary inter = DAO.getIntermediaryInfo(USER_ID);

    	System.out.println("REALESTATE_ID" + REALESTATE_ID);
    	System.out.println("INTERMEDIARY_ID" + INTERMEDIARY_ID);
    	System.out.println("r.getREALESTATE_PHOTOS()" + r.getREALESTATE_PHOTOS());
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
        	<h1 style="padding:40px" >매물 정보</h1>
        <form class="RealeStateAddContainer" action="ConnectionServlet"  method="post" enctype="multipart/form-data">	
         		<div class="contents_left">
					<div class="InterAdItem">
						<label for=REALESTATE_NAME> 건물이름 </label>
				        <input type="text" id="REALESTATE_NAME" name="REALESTATE_NAME" placeholder="이리와방빌라" value="<%= r.getREALESTATE_NAME() %>" required>
					</div>
					<div class="InterAdItem"> 
				        <label for=REALESTATE_ADDRESS> 건물주소</label>
				        <input type="text" id="REALESTATE_ADDRESS" name="REALESTATE_ADDRESS"  placeholder="서울특별시 강남구 반포동 00-00 이리왕빌라 201호" value="<%= r.getREALESTATE_ADDRESS() %>" required>
			    	</div> 
					<div class="InterAdItem">
						<label for=REALESTATE_TYPE> 건물종류 </label>
				        <input type="text" id="REALESTATE_TYPE" name="REALESTATE_TYPE" placeholder="아파트 / 빌라 / 도시생활주택 / 원룸 / 투룸" value="<%=r.getREALESTATE_TYPE() %>" required><br>
					</div>
					<div class="InterAdItem">
						<label for=REALESTATE_CONDITION> 계약조건 </label>
				        <input type="text" id="REALESTATE_CONDITION" name=REALESTATE_CONDITION placeholder="매매 / 전세 / 월세" value="<%=r.getREALESTATE_CONDITION() %>" required><br>
					</div>
					<div class="InterAdItem">
						<label for=REALESTATE_AREA> 면적 </label>
				        <input style="width:285px" type="text" id="REALESTATE_AREA" name="REALESTATE_AREA" placeholder="84.24㎡ (소수점 2째 자리 까지 입력해주세요)" value="<%=r.getREALESTATE_AREA() %>" required><a style="font-size:30px; padding-left:10px">㎡</a>
					</div>
					<div class="InterAdItem"> 
				        <label for="FLOORS">층수 </label>
				        <input type="text" id="FLOORS" name="FLOORS" placeholder="10층" value="<%= r.getFLOORS() %>" required><br>
		        	</div> 
		        	<div class="InterAdItem"> 
				        <label for="ROOMS_COUNT">방개수 </label>
				        <input type="text" id="ROOMS_COUNT" name="ROOMS_COUNT" placeholder="3" value="<%= r.getROOMS_COUNT() %>" required><br>
			        </div> 
			    	<div class="InterAdItem"> 
				        <label for="TOILET_COUNT">화장실개수 </label>
				        <input type="text" id="TOILET_COUNT" name="TOILET_COUNT" placeholder="2" value="<%= r.getTOILET_COUNT() %>" required><br>
			        </div>
			        <div class="InterAdItem"> 
				        <label for="PARKING_COUNT">주차가능대수 </label>
				        <input type="text" id="PARKING_COUNT" name="PARKING_COUNT" placeholder="1" value="<%= r.getPARKING_COUNT() %>" required><br>
			        </div>  
         		</div>
				<div class="contents_right">
					<div class="InterAdItem2"> 
				        <img id="titleImage" style="background-color:#eeeeee; width:170px; height:170px" src="<%= r.getREALESTATE_PHOTOS() %>" ><br>
				        <label style="text-align:center" for="image">대표사진</label><br>
				        <input type="file" id="image" name="image" onchange="readURL(this);" value="<%= r.getREALESTATE_PHOTOS() %>"><br>
			        </div> 
					
					<div class="InterAdItem2"> 
				        <label for="REALESTATE_SALEPRICE">매매가 / 전세가 / 보증금</label>
				        <input type="text" id="REALESTATE_SALEPRICE" name="REALESTATE_SALEPRICE"  placeholder="매매-매매가 / 전세-전세가 / 월세-보증금" value="<%= r.getREALESTATE_SALEPRICE() %>" required><br>
		       		</div> 
		       		<div class="InterAdItem2"> 
				        <label for="REALESTATE_MONTHLY">월세</label>
				        <input type="text" id="REALESTATE_MONTHLY" name="REALESTATE_MONTHLY" placeholder="월세가 존재할 경우 작성" value="<%= r.getREALESTATE_MONTHLY() %>" required><br>
		        	</div> 
		        	<div class="InterAdItem2"> 
				        <label for="REALESTATE_MAINTENANCE_COST">관리비</label>
				        <input type="text" id="REALESTATE_MAINTENANCE_COST" name="REALESTATE_MAINTENANCE_COST" placeholder="관리비가 존재할 경우 작성" value="<%= r.getREALESTATE_MAINTENANCE_COST() %>"required><br>
		        	</div> 
		        	<div class="InterAdItem2"> 
				        <label for="AVAILABLE_MOVE_IN_DATE">입주가능일 : </label>
				        <input type="date" id="AVAILABLE_MOVE_IN_DATE" name="AVAILABLE_MOVE_IN_DATE"  value="<%= r.getAVAILABLE_MOVE_IN_DATE() %>" required><br>
		      		</div> 
		        	<div class="InterAdItem2"> 
				        <label for="OTHER_COMMENT">기타내용 : </label>
				        <input type="text" id="OTHER_COMMENT" name="OTHER_COMMENT"  value="<%= r.getOTHER_COMMENT() %>" required><br>
		      		</div> 
				</div>
				
				<div style="background-color:#eeeeee; width:1100px; height:220px;margin:30px; margin-left:200px; text-align: center;" >
	      			<h1 style="padding:20px; font-size:25px; font-weight: bold;  text-align: center;">옵션</h1>
	      			<table style="margin-left:100px" >
						<tr>
							<td><input id="OPTION_1" type="checkbox" class="checkbox">냉장고</td>
								<td><input TYPE="hidden" id="OPTION_1_val" name="OPTION_1_val"></td>
							<td><input name="OPTION_2" type="checkbox" class="checkbox">세탁기</td>
								<td><input TYPE="hidden" id="OPTION_2_val" name="OPTION_2_val"></td>
							<td><input name="OPTION_3" type="checkbox" class="checkbox">에어컨</td>
								<td><input TYPE="hidden" id="OPTION_3_val" name="OPTION_3_val"></td>
							<td><input name="OPTION_4" type="checkbox" class="checkbox">샤워부스</td>
								<td><input TYPE="hidden" id="OPTION_4_val" name="OPTION_4_val"></td>
							<td><input name="OPTION_5" type="checkbox" class="checkbox">전자레인지</td>
								<td><input TYPE="hidden" id="OPTION_5_val" name="OPTION_5_val"></td>
							<td><input name="OPTION_6" type="checkbox" class="checkbox">인덕션</td>
								<td><input TYPE="hidden" id="OPTION_6_val" name="OPTION_6_val"></td>
							<td><input name="OPTION_7" type="checkbox" class="checkbox">싱크대</td>
								<td><input TYPE="hidden" id="OPTION_7_val" name="OPTION_7_val"></td>
							<td><input name="OPTION_8" type="checkbox" class="checkbox">침대</td>
								<td><input TYPE="hidden" id="OPTION_8_val" name="OPTION_8_val"></td>
						</tr>
						<tr>
							<td><input name="OPTION_9" type="checkbox" class="checkbox">책상</td>
								<td><input TYPE="hidden" id="OPTION_9_val" name="OPTION_9_val"></td>
							<td><input name="OPTION_10" type="checkbox" class="checkbox">신발장</td>
								<td><input TYPE="hidden" id="OPTION_10_val" name="OPTION_10_val"></td>
							<td><input name="OPTION_11" type="checkbox" class="checkbox">옷장</td>
								<td><input TYPE="hidden" id="OPTION_11_val" name="OPTION_11_val"></td>
							<td><input name="OPTION_12" type="checkbox" class="checkbox">화재경보기</td>
								<td><input TYPE="hidden" id="OPTION_12_val" name="OPTION_12_val"></td>
							<td><input name="OPTION_13" type="checkbox" class="checkbox">가스오븐</td>
								<td><input TYPE="hidden" id="OPTION_13_val" name="OPTION_13OPTION_13_val"></td>
							<td><input name="OPTION_14" type="checkbox" class="checkbox">비데</td>
								<td><input TYPE="hidden" id="OPTION_14_val" name="OPTION_14_val"></td>
							<td><input name="OPTION_15" type="checkbox" class="checkbox">베란다</td>
								<td><input TYPE="hidden" id="OPTION_15_val" name="OPTION_15_val"></td>
							<td><input name="OPTION_16" type="checkbox" class="checkbox">무인택배함</td>
								<td><input TYPE="hidden" id="OPTION_16_val" name="OPTION_16_val"></td>
						</tr>
	      			</table>
		      	</div> 
				<input TYPE="hidden" id="request" name="request" value="request-realestate_edit">
				<input TYPE="hidden" id="REALESTATE_ID" name="REALESTATE_ID" value="<%= REALESTATE_ID%>">
				<button class="addButton" type="submit">매물 수정</button>
			
			</form>
        </nav>
    </section>
	 <script>
	    
	    	// 이미지 선택시 미리보기
		    function readURL(input) {
		    	if (input.files && input.files[0]) {
		    	    var reader = new FileReader();
		    	    reader.onload = function(e) {
		    	      document.getElementById('titleImage').src = e.target.result;
		    		};
		    	    reader.readAsDataURL(input.files[0]);
		    	} else {
		    	    document.getElementById('titleImage').src = "";
		    	}
		    }
	   	</script>
</body>
</html>