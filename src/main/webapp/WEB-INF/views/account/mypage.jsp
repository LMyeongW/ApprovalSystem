<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/account/mypage.css">
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
            </div>
            <div class="right_content">

                <div class="con_register">
                    <div class="con_title">
                        <h2>마이페이지</h2>
                    </div>
                    <form name="passwordForm">
                        <table>
     
                            <tbody class="mylist">
                                <tr>
                                    <th>성명</th>
                                    <td>${member.USER_NAME}</td>
                                  
                                </tr>
                                <tr>
                                    <th>사번</th>
                                    <td>${member.USER_NUM}</td>
                                </tr>
                                <tr>
                                    <th>부서</th>
                                    <td>${member.USER_DEPARTMENT}</td>
                                </tr>
                                <tr>
                                    <th>직급</th>
                                    <td>${member.USER_GRADE}</td>
                                </tr>
                                <tr>
                                    <th>패스워드 변경</th>
                                    <td>
                                        <div class="pwbox">
                                            <input type="password" name="USER_PW" id="pwck" placeholder="현재 비밀번호">
                                            <input type="hidden" name="USER_NUM" value="${member.USER_NUM}">
                                            <div class="pwckbtn">확인</div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>

            </div>
        </div>

        <div class="bg">
            <div class="pwchContent">
            	<form name="pwchForm">
            		<input type="hidden" name="USER_NUM" value="${member.USER_NUM}">
                	<div class="title">
                    	<h3>비밀번호 변경</h3>
                	</div>

                	<div class="pw">
                    	<div class="t1">새 비밀번호</div>
                    	<input type="password" id="pwch" name="USER_PW" placeholder="비밀번호">
                	</div>
                	<div class="pwck">
                    	<div class="t1">새 비밀번호 확인</div>
                    	<input type="password" id="pwchck" placeholder="비밀번호 확인">
                	</div>

                	<div class="btn_box">
                    	<div class="chOk">변경</div>
                    	<div class="chNo">취소</div>
                	</div>
                </form>
            </div>

        </div>
    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
     $(document).ready(function () {
    	 
     	
 	    // 메뉴아이콘 h3 클릭시 일어나는일
 	    $('.nav .left_menu').children('li').find('h3').click(function () {
 	        $(this).siblings('.d2').stop().slideToggle();
 	        // $(this).parent().siblings().find('.d2').stop().slideUp(400);
 	        $(this).toggleClass('on');

 	    });
 	    
 	    
        $('.pwckbtn').click(function () {
			
        	var data = $('form[name=passwordForm]').serialize();
        	
        	$.ajax({
        		
        		url : '/mtsystem/passwordck',
        		type : 'get',
        		dataType : 'json',
        		data : data,
        		success : function(result){
        			
        			if(result.data == false){
        				alert("비밀번호가 올바르지 않습니다.");
        			}else {

        				$('.bg').show();
        				var pwch = $('#pwch').val();
        				var pwchck = $('#pwchck').val();
        				
        				$('.chOk').click(function(){	
        					if(pwch != pwchck){
        						alert("비밀번호가 서로 일치하지 않습니다.");
        					}else {
        						var con = confirm('비밀번호를 변경하시겠습니까?');
        						
        						if(con){
        							
        							var data1 = $('form[name=pwchForm]').serialize();
        							
        							$.ajax({
        								
        								url : '/mtsystem/passwordch',
        								type : 'post',
        								dataType : 'json',
        								data : data1,
        								success : function(result){
        								
        									alert("비밀번호 변경에 성공하였습니다.")
        									location.reload();
        								},
        								error : function(){
        									alert("비밀번호 변경에 실패하였습니다.")
        									location.reload();
        								}
        								
        							});
        						}
        					}
        					
        				});
        			}
        			
        			$('.chNo').click(function(){
        				$('.bg').hide();
        			});
        		},
        		error : function(){}
        		
        	});
        })




     });
</script>
</body>
</html>