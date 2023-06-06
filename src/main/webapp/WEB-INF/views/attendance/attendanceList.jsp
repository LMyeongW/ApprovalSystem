<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인 대기</title>
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
            </div>
            <div class="right_content">
                
                <div class="content">
                    <div class="title">
                        <h2>출석 현황</h2>
<!--                         <div class="waitlist"> -->
                           
<!--                         </div> -->
                    </div>
                    <div class="list">
                        <table>
                            <thead>
                                <tr>
                                    <th>이름</th>
                                    <th>직위</th>
                                    <th>직급</th>
                                    <th>출석상태</th>
                                    <th>출석날짜</th>
                                    <th>출석시간</th>
                                    <th>출석요일</th>
                                </tr>

                            </thead>
                            <tbody id="attendanceList">

                            </tbody>
                        </table>
                    </div>
                     <div class ="paging_box"></div>
                </div>
    
    
            </div>

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
	    attendanceList();
	});
	
	function attendanceList(num){
		
		var usernum = $('input[name=USER_NUM]').val();

		$.ajax({
			
			url : '/mtsystem/attendanceList.do',
			type : 'get',
			dateType :'json',
			data : {
				"USER_NUM" : usernum,
				"num" : num
			},
			success : function(result){
				
				var data = result.data.list;
				var count = result.data.totalcount;
				var paging = result.data.page;
				var select = result.data.select;
				
				var html = "";
				
				for(var i = 0; i < data.length; i++){
					
					html += '<tr>';
					html += '<td>'+data[i].user_NAME+'</td>';
					html += '<td>'+data[i].user_GRADE+'</td>';
					html += '<td>'+data[i].user_DEPARTMENT+'</td>';
					html += '<td>'+data[i].attendance_STATUS+'</td>';
					html += '<td>'+data[i].attendance_DATE+'</td>';
					html += '<td>'+data[i].attendance_TIME+'</td>';
					html += '<td>'+data[i].day_OF_THE_WEEK+'</td>';
					html += '</tr>';
				}
				$('#attendanceList').html(html);
				
				
// 				var html1 = "";
// 				html1 += '대기자 인원 : <span>'+ count +'</span>';
// 				$('.waitlist').html(html1);
				
				var page = "";
				if(paging.prev){
					var startPageNum = paging.startPageNum - 1;
					page += '<a href="javascript:approveWaitList(' + startPageNum +')" id="prev"><span></span><span></span></a>';


				}
				
				for(var num = paging.startPageNum; num <= paging.endPageNum; num++ ){
					if(select == num){
						page += '<span class="numPadding">';
						page += '<span class="point"><a href="javascript:approveWaitList(' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
					
					if(select != num){
						page += '<span class="numPadding">';
						page += '<span class="noPoint"><a href="javascript:approveWaitList(' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
				}
				
				
				if(paging.next){
					var endPageNum = paging.endPageNum + 1;
					page +=	'<a href="javascript:approveWaitList(' + endPageNum +')" id="next"><span></span><span></span></a>';
					
				}
				$('.paging_box').html(page);
				
			},
			error : function(){
				
			}
			
		});
	}


</script>
</body>
</html>