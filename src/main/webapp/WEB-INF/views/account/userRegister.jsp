<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/account/userRegister.css">
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
                        <h2>사원등록</h2>
                    </div>
                    <form name="registerForm">
                        <div class="con_box2">
                            <div class="con_box3">
                                <div class="user_info_title">
                                    이름 <span class="ck">*</span>
                                </div>
                                <div class="user_info_box">
                                    <input type="text" id="user_name" name="USER_NAME">
                                </div>
                            </div>

                            <div class="con_box3">
                                <div class="user_info_title">
                                    전화번호 <span class="ck">*</span>
                                </div>
                                <div class="user_info_box">
                                    <input type="text" id="user_tel" name="USER_TEL" placeholder="'-'빼고 입력해주세요." maxlength='13' />
                                </div>
                            </div>
                        </div>

                        <div class="con_box2">
                            <div class="con_box3">
                                <div class="user_info_title">
                                    생년 <span class="ck">*</span>
                                </div>
                                <div class="user_info_box">
                                    <input type="text" id="user_yy" name="USER_YY" maxlength='4' placeholder="YYYY">
                                </div>
                            </div>

                            <div class="con_box3">
                                <div class="user_info_title">
                                    월 <span class="ck">*</span>
                                </div>
                                <div class="user_info_box">
                                    <input type="text" id="user_mm" name="USER_MM"  maxlength='2' placeholder="mm">
                                </div>
                            </div>

                            <div class="con_box3">
                                <div class="user_info_title">
                                     일 <span class="ck">*</span>
                                </div>
                                <div class="user_info_box">
                                    <input type="text" id="user_dd" name="USER_DD" maxlength='2' placeholder="dd">
                                </div>
                            </div>
                            <input type="hidden" name="USER_BIRTHDAY">
                        </div>

                        <div class="con_box1">
                            <div class="user_info_title">
                                  성별 <span class="ck">*</span>
                            </div>
                            <div class="user_info_box">
                                <select name="USER_GENDER" id="user_gender">
                                    <option value="">선택</option>
                                    <option value="M">남</option>
                                    <option value="W">여</option>
                                </select>
                            </div>
                        </div>

                        <div class="con_box1">
                            <div class="user_info_title">
                                  사원번호 <span class="ck">*</span>
                            </div>
                            <div class="user_info_box">
                                <input type="text" id="user_num" name="USER_NUM" placeholder="사번생성을 클릭해주세요." readonly="readonly">
                                <div class="num_btn" title="*비밀번호는 '사원번호 + 1!'입니다.">사번생성</div>
                                <div class="num_btnCk">중복확인</div>
                            </div>
                        </div>

                        <div class="con_box2">
                            <div class="con_box3">
                                <div class="user_info_title">
                                    직급 <span class="ck">*</span>
                                </div>
                                <div class="user_info_box">
                                    <select name="USER_GRADE" id="user_grade">
                                        <option value="">선택</option>
                                        <option value="사원">사원</option>
                                        <option value="주임">주임</option>
                                        <option value="대리">대리</option>
                                        <option value="과장">과장</option>
                                        <option value="차장">차장</option>
                                        <option value="부장">부장</option>
                                        <option value="팀장">팀장</option>
                                        <option value="이사">이사</option>
                                        <option value="사장">사장</option>
                                    </select>
                                </div>
                            </div>

                            <div class="con_box3">
                                <div class="user_info_title">
                                    부서 <span class="ck">*</span>
                                </div>
                                <div class="user_info_box">
                                    <select name="USER_DEPARTMENT" id="user_department">
                                        <option value="">선택</option>
                                        <option value="개발1팀">개발1팀</option>
                                        <option value="개발2팀">개발2팀</option>
                                        <option value="인사팀">인사팀</option>
                                        <option value="홍보팀">홍보팀</option>
                                        <option value="생산1팀">생산1팀</option>
                                        <option value="생산2팀">생산2팀</option>
                                        <option value="생산3팀">생산3팀</option>
                                        <option value="인사팀">인사팀</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="con_box1">
                            <div class="user_info_title">
                                권한부여 <span class="ck">*</span>
                            </div>
                            <div class="user_info_box">
                                <input type="radio" name="USER_ADMIN" id="user_admin1" value="null">
                                <label for="user_admin1">
                                    없음
                                </label>
                                <input type="radio" name="USER_ADMIN" id="user_admin2" value="REVIEW">
                                <label for="user_admin2">
                                    검토
                                </label>
                                <input type="radio" name="USER_ADMIN" id="user_admin3" value="APPROVE">
                                <label for="user_admin3">
                                    승인
                                </label>
                            </div>
                        </div>
                    </form>
                    <div class="register_btn_box">
                        <div class="box">
                            <div class="resister">등록</div>
                            <div class="cancel">취소</div>
                        </div>
                    </div>



                </div>

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

    	$("#user_tel").on("propertychange change keyup paste input", function(){
    		var phone = $('#user_tel').val();
    			
    		var tel1= phone
    		  			.replace(/[^0-9]/g, '') // 숫자를 제외한 모든 문자 제거
    		  			.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
    		
    		 
        	$('#user_tel').val(tel1);	
    	});
    	 
    	/*사번생성*/
     	$('.num_btn').click(function () {
            var number = "MT" + Math.random().toString(36).substring(2, 9);

            $('#user_num').val(number);
        })
        
        
        
        var idck = false;
		$('.num_btnCk').click(function(){
			var user_num = 	$('#user_num').val();

			
			$.ajax({
				type : "get",
				url : "/mtsystem/authority/idck",
				data : {
					"USER_NUM" : user_num
				},
				success : function(result){
					
					if(result.data != 0){
						alert("이미 있는 사원번호입니다.");
						idck = false;
					} else {
						alert("사용가능한 사원번호입니다.");
						idck = true;
					}
					

					

				}
			});	
			
		});
    	
		
 

        
        $('.resister').click(function(){
        	
        	/*유효성 검사*/
			        
			var name = $('input[name=USER_NAME]').val();
        	var tel = $('input[name=USER_TEL]').val();
        	var yy = $('input[name=USER_YY]').val();
        	var mm = $('input[name=USER_MM]').val();
        	var dd = $('input[name=USER_DD]').val();
        	var gender = $('#user_gender option:selected').val();
        	var num = $('input[name=USER_NUM]').val();
        	var grade = $('#user_grade option:selected').val();
        	var depart = $('#user_department option:selected').val();
        	var admin = $('input[name=USER_ADMIN]:checked').val();
			
            
            if(name == ""){
            	alert("이름을 입력해주세요.");
            	return false;
            }
            
            if(tel == ""){
            	alert("전화번호를 입력해주세요.");
            	return false;
            }
            
            if(yy == ""){
            	alert("생년을 입력해주세요.");
            	return false;
            }
            
            if(mm == ""){
            	alert("월을 입력해주세요.");
            	return false;
            }
            
            if(dd == ""){
            	alert("일을 입력해주세요.");
            	return false;
            }
            
            if(gender == "" || gender == null){
            	alert("성별을 선택해주세요.");
            	return false;
            }
            
            if(num == ""){
            	alert("사원번호를 생성해주세요.");
            	return false;
            }
            
            if(grade == "" || grade == null){
            	alert("직급을 선택해주세요.");
            	return false;
            }
            
            if(depart == "" || depart == null){
            	alert("부서를 선택해주세요.");
            	return false;
            }
            
            if(admin == "" || admin == null){
            	alert("권한을 선택해주세요.");
            	return false;
            }

            
            var birthday = yy+mm+dd;

            $('input[name=USER_BIRTHDAY]').val(birthday);
            
            
            var data = $('form[name=registerForm]').serialize();
            
            var con = confirm('사원정보를 등록하시겠습니까?');
            if(con){
            	$.ajax({
            		
            		url : '/mtsystem/authority/userRegister.do',
            		type: 'post',
            		dataType : 'json',
            		data : data,
            		success : function(result){
            			location.href="/mtsystem/individualStatusList";
            			
            		},
            		error : function(){}
            		
            		
            	});
            }else{
            	alert("등록을 취소하였습니다.");
            }
        });


     });
</script>
</body>
</html>