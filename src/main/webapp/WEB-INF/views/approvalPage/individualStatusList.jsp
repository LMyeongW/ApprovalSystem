<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인 완료</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/approvalPage/statusList.css">
</head>
<body>
    <div id="wrap">
        <div class="left_box">
            <div class="left_header">
                <h1><a href="#">MT 결재시스템</a></h1>
            </div>
            <div class="left_title">
                Dashboard
            </div>
            <nav class="nav">
                <ul class="left_menu">
                    <li>
                        <h3>
                            <a href="javascript:void(0)">개인현황</a>
                             <div class="menubtn">
                                <span></span>
                                <span></span>
                                <span></span>
                             </div>
                        </h3>
    
                        <ul class="d2">
                            <li><a href="/mtsystem/individualStatusList">결재현황</a></li>
                        </ul>
                    </li>
    
                    <li>
                        <h3>
                            <a href="javascript:void(0)">검토현황</a>
                             <div class="menubtn">
                                <span></span>
                                <span></span>
                                <span></span>
                             </div>
                        </h3>
    
                        <ul class="d2">
                            <li><a href="/mtsystem/reviewWaitList">검토대기 목록</a></li>
                            <li><a href="/mtsystem/reviewCompleteList">검토완료 목록</a></li>
                        </ul>
                    </li>
    
                    <li>
                        <h3>
                            <a href="javascript:void(0)">승인현황</a>
                             <div class="menubtn">
                                <span></span>
                                <span></span>
                                <span></span>
                             </div>
                        </h3>
    
                        <ul class="d2">
                            <li><a href="/mtsystem/approveWaitList">승인대기 목록</a></li>
                            <li><a href="/mtsystem/approveCompleteList">승인완료 목록</a></li>
                        </ul>
                    </li>
    
                    <li>
                        <h3>
                            <a href="javascript:void(0)">결재신청</a>
                             <div class="menubtn">
                                <span></span>
                                <span></span>
                                <span></span>
                             </div>
                        </h3>
    
                        <ul class="d2">
                            <li><a href="/mtsystem/approvalWrite">작성하기</a></li>

                        </ul>
                    </li>
                    
                    <li>
                        <h3>
                            <a href="javascript:void(0)">개인정보</a>
                             <div class="menubtn">
                                <span></span>
                                <span></span>
                                <span></span>
                             </div>
                        </h3>
    
                        <ul class="d2">
                        	<c:if test="${member.AUTHORITY eq 'AUTHORITY'}">
                        		<li><a href="/mtsystem/authority/userConditionList">사용자현황</a></li>
                        		<li><a href="/mtsystem/authority/attendanceAllList">사용자 출석현황</a></li>
                        	</c:if>
                            <li><a href="/mtsystem/mypage">마이페이지</a></li>
                            <li><a href="/mtsystem/attendanceList">출석현황</a></li>

                        </ul>
                    </li>
                    <c:if test="${member.AUTHORITY eq 'AUTHORITY'}">
                    	<li>
                        	<h3>
                            	<a href="javascript:void(0)">사원등록</a>
                             	<div class="menubtn">
                                	<span></span>
                                	<span></span>
                                	<span></span>
                             	</div>
                        	</h3>
    
                        	<ul class="d2">
                            	<li><a href="/mtsystem/authority/userRegister">사원등록</a></li>

                        	</ul>
                    	</li>
                    </c:if>

                </ul>
                <!-- .d1 -->
            </nav>
            <!-- .nav -->
        </div>
        <div class="right_box">
            <div class="right_header">
                <div class="root"></div>
                <div class="login_box">
                	<div>${member.USER_NAME} /</div>
                	<a href="/logout.do">
                		<div class="logout_box">
                			<img src="/resources/images/logout.png" alt="로그아웃아이콘"> 
                		</div>
                		<div>로그아웃</div>
                	</a>
                </div>
                <input type="hidden" name="USER_NUM" value="${member.USER_NUM}">
                <input type="hidden" name="USER_NAME" value="${member.USER_NAME}">
                <input type="hidden" name="USER_GRADE" value="${member.USER_GRADE}">
                <input type="hidden" name="APPROVER" id="approver">
                <input type="hidden" name="ATTENDANCE_DATE">
                <input type="hidden" name="ATTENDANCE_TIME">
                <input type="hidden" name="DAY_OF_THE_WEEK">
            </div>
            <div class="right_content">
            
               <div class="countBox">
                    <div class="individual">
                        <div class="title">결재신청</div>
                        <div class="count" id="individualCount">
                        	<div class="cc"></div>
                        </div>
                    </div>
                    <div class="review">
                        <div class="title">검토요청</div>
                        <div class="count" id="reviewCount">
                        	<div class="cc"></div>
                        </div>
                    </div>
                    <div class="approve">
                        <div class="title">승인요청</div>
                        <div class="count" id="approveCount">
                        	<div class="cc"></div>
                        </div>
                    </div>

                </div>
                
                <div class="content">
                    <div class="title">
                        <h2>신청 현황</h2>
   
                    </div>
                    <div class="list">
                        <table>
                            <thead>
                                <tr>
                                    <th>신청자</th>
                                    <th>결재양식</th>
                                    <th>검토자</th>
                                    <th>검토일</th>
                                    <th>검토 반려일</th>
                                    <th>승인자</th>
                                    <th>승인일</th>
                                    <th>승인 반려일</th>
                                    <th>신청일</th>
                                    <th>상세보기</th>
                                </tr>

                            </thead>
                            <tbody id="approveList">

                            </tbody>
                        </table>
                     </div>
                     <div class ="paging_box"></div>
                </div>
    
    
            </div>

        </div>
        <div class="attendance_btn">
<!--         	<div class="true">출석체크</div> -->
<!--         	<div class="false">출석체크 불가</div> -->
        </div>

        


    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
	
	$(document).ready(function(){
		

		
		
	    // 메뉴아이콘 h3 클릭시 일어나는일
	    $('.nav .left_menu').children('li').find('h3').click(function () {
	        $(this).siblings('.d2').stop().slideToggle();
	        // $(this).parent().siblings().find('.d2').stop().slideUp(400);
	        $(this).toggleClass('on');

	    });
		individualStatusList();

	});
	

	
	function individualStatusList(num){
		
		var usernum = $('input[name=USER_NUM]').val();

		$.ajax({
			
			url : '/mtsystem/individualStatusList.do',
			type : 'get',
			async : false,
			dateType :'json',
			data : {
				"USER_NUM" : usernum,
				"num" : num
			},
			success : function(result){
				
				var data = result.data.individualStatusList;
				var count = result.data.approvalStatusCount;
				var count1 = result.data.reviewlistCount;
				var count2 = result.data.approvelistCount;
				var paging = result.data.page;
				var select = result.data.select;

				var html = "";
				
				for(var i = 0; i < data.length; i++){
					
					if(data[i].review_DATE == null) {
						data[i].review_DATE = "";
					}
					
					if(data[i].review_REFUSAL_DATE == null) {
						data[i].review_REFUSAL_DATE = "";
					}
					
					if(data[i].approve_DATE == null) {
						data[i].approve_DATE = "";
					}
					
					if(data[i].approve_REFUSAL_DATE == null) {
						data[i].approve_REFUSAL_DATE = "";
					}
					
					
					html += '<tr>';
					html += '<td>'+data[i].user_NAME+'</td>';
					html += '<td>휴가신청서</td>';
					html += '<td>'+data[i].reviewer+'</td>';
					html += '<td>'+data[i].review_DATE+'</td>';
					html += '<td>'+data[i].review_REFUSAL_DATE+'</td>';
					html += '<td>'+data[i].approver+'</td>';
					html += '<td>'+data[i].approve_DATE+'</td>';
					html += '<td>'+data[i].approve_REFUSAL_DATE+'</td>';
					html += '<td>'+data[i].approve_REGDATE+'</td>';
					html += '<td><a href="/mtsystem/individualDetail?APPROVAL_PK='+data[i].approval_PK +'">확인</a></td>';
					html += '</tr>';
				}
				$('#approveList').html(html);
				
				
	
				
				var html2 = "";
				html2 += '<div class="cc">'+ count +'</div>';
				$('#individualCount').html(html2);
				
				var html3 = "";
				html3 += '<div class="cc">'+ count1 +'</div>';
				$('#reviewCount').html(html3);
				
				var html4 = "";
				html4 += '<div class="cc">'+ count2 +'</div>';
				$('#approveCount').html(html4);
				
				var page = "";
				if(paging.prev){
					var startPageNum = paging.startPageNum - 1;
					page += '<a href="javascript:individualStatusList(' + startPageNum +')" id="prev"><span></span><span></span></a>';


				}
				
				for(var num = paging.startPageNum; num <= paging.endPageNum; num++ ){
					if(select == num){
						page += '<span class="numPadding">';
						page += '<span class="point"><a href="javascript:individualStatusList(' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
					
					if(select != num){
						page += '<span class="numPadding">';
						page += '<span class="noPoint"><a href="javascript:individualStatusList(' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
				}
				
				
				if(paging.next){
					var endPageNum = paging.endPageNum + 1;
					page +=	'<a href="javascript:individualStatusList(' + endPageNum +')" id="next"><span></span><span></span></a>';
					
				}
				$('.paging_box').html(page);
				

				
// 					if (navigator.geolocation) { // GPS를 지원하면
// 					navigator.geolocation.getCurrentPosition(function(position) {
						
				    	
// 					    	var lat = position.coords.latitude;
// 					    	var log = position.coords.longitude;
				    	
							    	$.ajax({
				    		
							    		url : '/mtsystem/attendance',
							    		type : 'get',
							    		async : false,
							    		dataType : 'json',
// 							    		data : {
// 							    			"lat" : lat,
// 							    			"log" : log
// 							    		},
							    		success : function(result){
							    			
							    			var data = result.data;
							    			
							    			var html2 ="";
							    			if(data == 'atrue'){
							    				
							    				html2 = '<div class="true">출근체크<input type="hidden" name="ATTENDANCE_STATUS" value="출근 완료"></div>'
							    				$('.attendance_btn').html(html2);
							    				
												$('.true').click(function(){
													
													var today = new Date();
													
													//연도.월.날짜
													var year = today.getFullYear();
													var month = ('0' + (today.getMonth() + 1)).slice(-2);
													var day = ('0' + today.getDate()).slice(-2);

													var dateString = year + '-' + month  + '-' + day;
													
													$('input[name=ATTENDANCE_DATE]').attr('value', dateString );
					
													
													//시간.분.초
													var hours = ('0' + today.getHours()).slice(-2); 
													var minutes = ('0' + today.getMinutes()).slice(-2);
													var seconds = ('0' + today.getSeconds()).slice(-2); 
			
													var timeString = hours + ':' + minutes  + ':' + seconds;
													$('input[name=ATTENDANCE_TIME]').attr('value', timeString );
												
													
													//요일
												    var week = new Array('일', '월', '화', '수', '목', '금', '토');

												    var today_num = new Date().getDay();
												    
												    var nowday = week[today_num];
												    $('input[name=DAY_OF_THE_WEEK]').attr('value', nowday);
												    
												    
													var status = $('input[name=ATTENDANCE_STATUS]').val();
													var user_name = $('input[name=USER_NAME]').val();
													var user_num = $('input[name=USER_NUM]').val();
													var date = $('input[name=ATTENDANCE_DATE]').val();
													var time = $('input[name=ATTENDANCE_TIME]').val();
													var theweek = $('input[name=DAY_OF_THE_WEEK]').val();
													
													var data = {
															
															"ATTENDANCE_STATUS" : status,
															"USER_NAME" : user_name,
															"USER_NUM" : user_num,
															"ATTENDANCE_DATE" : date,
															"ATTENDANCE_TIME" : time,
															"DAY_OF_THE_WEEK" : theweek
													}
													
							    					$.ajax({
							    						
							    						url : '/mtsystem/attendance.do',
							    						type : 'post',
							    						dataType : 'json',
							    						data : data,
							    						success : function(result){
							    							var data = result.data;

							    							if(data == 'register'){
							    								alert("출근체크 되었습니다.");
							    							}else if(data == 'exist'){
							    								alert("이미 출근체크가 완료되었습니다.");
							    							}
							    						},
							    						error : function(){
							    							alert("오류가 발생하였습니다.");
							    						}
							    						
							    						
							    						
							    					})
							    				});
							    				
							    				
							    			} else if(data == 'afalse'){
							    				
							    				html2 = '<div class="false">체크불가</div>'
							    				$('.attendance_btn').html(html2);
							    				
							    				$('.false').click(function(){
							    					
							    					alert("현재 회사내에 있지 않아 출근체크를 할 수 없습니다.");
							    				});
							    				
							    			}
				    			
							    		},
							    		error : function(){
				    			
							    		}
				    		
							    	});
				    	
				    	
// 						}, function(error) {
// 							console.error(error);
// 						}, {
// 					    	enableHighAccuracy: true,
// 					    	maximumAge: 0,
// 					    	timeout: Infinity
// 					});
// 				} else {
// 					alert("GPS를 지원하지 않습니다");
// 				}
				
			},
			error : function(){
				
			}
			
		});
	}
	


</script>
</body>
</html>