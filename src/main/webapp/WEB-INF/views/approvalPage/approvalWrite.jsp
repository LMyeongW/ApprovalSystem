<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/approvalPage/approvalWrite.css">
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
        	<form name="approvalForm">
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
                <div class="con_left">
                    <div class="con_left_title"><h3>휴가신청서</h3></div>
                    <input type="hidden" name="USER_DEPARTMENT" value="${member.USER_DEPARTMENT}"> 
                    <input type="hidden" name="USER_NUM" value="${member.USER_NUM}"> 
                    <input type="hidden" name="USER_NAME" value="${member.USER_NAME}"> 
                    <input type="hidden" name="USER_GRADE" value="${member.USER_GRADE}"> 
                    
                    <table class="table_box">
                        <tbody>
                            <tr>
                                <th>소속</th>
                                <td>${member.USER_DEPARTMENT}</td>
                                <th>사번</th>
                                <td>${member.USER_NUM}</td>
                            </tr>
                            <tr>
                                <th>성명</th>
                                <td>${member.USER_NAME}</td>
                                <th>담당업무</th>
                                <td><input type="text" name="ASSIGNED_TASK" id="task"></td>
                            </tr>
                            <tr>
                                <th>직위</th>
                                <td>${member.USER_GRADE}</td>
                                <th>업무인수자</th>
                                <td><input type="text" name="UNDERWRITER" id="underwriter"></td>
                            </tr>
                            <tr>
                                <th >종류</th>
                                <td colspan="3">
                                    <div class="sort">
                                        <input type="radio" id="s1" name="APPROVAL_SORTS" value="연차">
                                        <label for="s1">연차</label>

                                        <input type="radio" id="s2" name="APPROVAL_SORTS" value="월차">
                                        <label for="s2">월차</label>

                                        <input type="radio" id="s3" name="APPROVAL_SORTS" value="반차">
                                        <label for="s3">반차</label>

                                        <input type="radio" id="s4" name="APPROVAL_SORTS" value="훈련,교육">
                                        <label for="s4">훈련,교육</label>

                                        <input type="radio" id="s5" name="APPROVAL_SORTS" value="경조">
                                        <label for="s5">경조</label>

                                        <input type="radio" id="s6" name="APPROVAL_SORTS" value="기타(생휴)">
                                        <label for="s6">기타(생휴)</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th> 사유</th>
                                <td colspan="3">
                                    <textarea name="REASON" id="reason" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th> 기간</th>
                                <td colspan="3">
                                    <input type="date" name="APPROVAL_STARTDATE" id="start"> ~ <input type="date" name="APPROVAL_ENDDATE" id="enddate"> 
                                    <input type="text" id="sumdate" name="SUMDATE">
                                </td>
                            </tr>
                            <tr>
                                <th> 비상 연락망</th>
                                <td colspan="3">
                                    <input type="text" name="EMERGENCY_CONTACT" id="emergency" placeholder="'-'빼고 입력해주세요." maxlength='13'>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="bottom">위와 같이 휴가를 신청 하오니 재가하여 주시기 바랍니다.</div>
                    <ul class="nowdate">
                        <li id="yy"></li>
                        <li id="mm"></li>
                        <li id="dd"></li>
                    
                    </ul>
                </div>
                <div class="con_right">
                    <div class="con_right_title">
                        <h3>검토/승인자</h3>
                        <div class="select_re_appr">
                            검토/승인자 선택
                        </div>
                    </div>
                    <table class="table_box1">
                        <thead>
                            <tr>
                                <th>작성자</th>
                                <th>검토자</th>
                                <th>승인자</th>
                            </tr>
                      
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                	${member.USER_NAME}
                                </td>
                                <td>
                                	<input type="text" id="user_re" readonly="readonly" name="REVIEWER">
                                	<input type="hidden" id="user_re1" readonly="readonly" name="REVIEW_KEY">
                                </td>
                                <td>
                                	<input type="text" id="user_app" readonly="readonly" name="APPROVER">
                                	<input type="hidden" id="user_app1" readonly="readonly" name="APPROVER_KEY">
                                </td>
                            </tr>
                        </tbody>
                    </table>
    
                </div>
                <div class="btn_box">
                    <div class="approval_submit">제출</div>
                    <div class="approval_cancel">취소</div>
                </div>
            </div>
		</form>
        </div>

        <div class="selectBg">
            <div class="select_list">
                <div class="select_title">
                    <div>검토/승인자 선택</div>
                    <div class="select_cancel">
                        <span></span>
                        <span></span>
                    </div>
                </div>
                <!-- .select_title -->

                <div class="select_depart">
                    <select name="departmentSelect" id="depart">
                        <option value="" selected>전체</option>
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

                <div id="list_wrap">
                    <div class="reviewList">
                        <div class="title">
                            <div>검토자 선택</div>
                            <div class="send" id="reviewSend">
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                        <div class="list">
                            <table class="table_box3">
                                <thead>
                                    <tr>
                                        <th>선택</th>
                                        <th>검토자</th>
                                    </tr>
                              
                                </thead>
                                <tbody id="re_list">
             
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="approveList">
                        <div class="title">
                            <div>승인자 선택</div>
                            <div class="send" id="approveSend">
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                 
                        <div class="list">
                            <table class="table_box3">
                                <thead>
                                    <tr>
                                        <th>선택</th>
                                        <th>승인자</th>
                                    </tr>
                              
                                </thead>
                                <tbody id="app_list">
       
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="selected">
                        <div class="review">
                            <div class="title">
                                검토자
                            </div>
                            <div class="send_result">
                                <div id="result1">
                                   <input type="text" id="res1" readonly="readonly">
                                   <input type="hidden" id="key1" readonly="readonly">
                                </div>
                            </div>
                        </div>
                        <div class="approve">
                            <div class="title">
                                승인자
                            </div>
                            <div class="send_result">
                                <div id="result2">
                                	<input type="text" id="res2" readonly="readonly">
                                	<input type="hidden" id="key2" readonly="readonly">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- #list_wrap -->
                <div class="btn">
                    <div class="yes">확인</div>
                    <div class="no">취소</div>
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
    	
        var nowtime = new Date();
        var nowY = nowtime.getFullYear();
        var nowM = nowtime.getMonth() +1;
        var nowD = nowtime.getDate();
        
    	$("#emergency").on("propertychange change keyup paste input", function(){
    		var phone = $('#emergency').val();
    			
    		var tel1= phone
    		  			.replace(/[^0-9]/g, '') // 숫자를 제외한 모든 문자 제거
    		  			.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
    		
    		 
        	$('#emergency').val(tel1);	
    	});


        $('#yy').text(nowY + ' 년');
        $('#mm').text(nowM + ' 월');
        $('#dd').text(nowD + ' 일');

        $('.select_re_appr').click(function(){
            $('.selectBg').show();
        });

        $('.select_cancel').click(function(){
            $('.selectBg').hide();
        });
        
        
        
		$('#depart').on('change', function(){
			var departmentSelect = $("#depart option:selected").val();
			selectList();
			
		});
		
		
		//날짜포맷 yyyy-mm-dd
		var date = new Date();

		var year = date.getFullYear();

		var month = date.getMonth();
		month += 1;
		if (month <= 9){
		    month = "0" + month;
		}

		var day = date.getDate();
		if (day <= 9){
		    day = "0" + month;
		}

		var today = year + '-' + month + '-' + day;
		

		$('#start').on('change', function(){
			var start = $('input[name=APPROVAL_STARTDATE]').val();
			
			
			if(today > start){
				alert("현재날짜가 지났습니다.");
				start = $('input[name=APPROVAL_STARTDATE]').val("");
			}

		});
		
		$('#enddate').on('change', function(){
			var end = $('input[name=APPROVAL_ENDDATE]').val();

			if(today > end){
				alert("현재날짜가 지났습니다.");
				end = $('input[name=APPROVAL_ENDDATE]').val("");
			}
			
		});
		
		$('#start, #enddate').on('change', function(){
			
            var startdate = $('#start').val();
            var enddate = $('#enddate').val();

            var date1 = new Date(startdate);
            var date2 = new Date(enddate);

            var sumSec = date2.getTime() - date1.getTime();
            var sumdate = sumSec/ (1000 * 60 * 60 * 24); 

            
            if(startdate!="" && enddate !=""){
               $('#sumdate').val(sumdate + 1);
               
               
            }
			
			var sumdate1 = $('input[name=SUMDATE]').val();
			
			 if(sumdate1 < 0 ){
	        		alert("시작일은 종료일보다 클 수 없습니다.");
	        		$('input[name=APPROVAL_STARTDATE]').val("");
	        		$('input[name=APPROVAL_ENDDATE]').val("");
	        		$('input[name=SUMDATE]').val("");
	       	}
			 

		});

		selectList();
		
		
		
		$('.approval_submit').click(function(){
			
			
	     	var assigne = $('input[name=ASSIGNED_TASK]').val();
        	var under = $('input[name=UNDERWRITER]').val();
        	var sort = $('input[name=APPROVAL_SORTS]:checked').val();
        	var start1 = $('input[name=APPROVAL_STARTDATE]').val();
        	var end1 = $('input[name=APPROVAL_ENDDATE]').val();
        	var reason = $('textarea[name=REASON]').val();
        	var approver = $('input[name=APPROVER]').val();
        	var reviewer = $('input[name=REVIEWER]').val();
        	
        	if(assigne == ""){
        		alert("담당업무를 작성해주세요.");
        		return false;
        	}
        	
        	if(under == ""){
        		alert("인수자를 작성해주세요.");
        		return false;
        	}
        	
        	
        	if(sort == "" || sort == null ){
        		alert("신청종류를 선택해주세요.");
        		return false;
        	}
        	
          	if(reason == ""){
        		alert("사유를 작성해주세요.");
        		return false;
        	}
        	
        	if(start1 == ""){
        		alert("시작날을 선택해주세요.");
        		return false;
        	}
        	
        	
        	if(end1 == ""){
        		alert("종료일을 선택해주세요.");
        		return false;
        	}
        	
          	if(emergency == ""){
        		alert("비상연락망을 작성해주세요.");
        		return false;
        	}
          	
           	if(reviewer == ""){
        		alert("검토자를 선택해주세요.");
        		return false;
        	}
        	
   
           	if(approver == ""){
        		alert("승인자를 선택해주세요.");
        		return false;
        	}
           	

        	
           	var con = confirm('결재신청을 하시겠습니까?');
           	
           	if(con){
        		var data = $('form[name=approvalForm]').serialize();
    			
    			$.ajax({
    				
    				url : '/mtsystem/approvalSubmit',
    				type : 'post',
    				dataType : 'json',
    				data : data,
    				success : function(result){
    					alert("신청이 완료되었습니다.");
    					location.href ="/mtsystem/individualStatusList";
    				},
    				error : function(){
    					alert("오류가 발생하였습니다.");
    				}
    				
    			});
           	}else {
           		alert("신청이 취소되었습니다.");
           	}
	
			
		});
        
	});
    
    
    /*검토자 불러오기*/
    function selectList(departmentSelect){
    	
    	var departmentSelect = $("#depart option:selected").val();
 
    	
        $.ajax({
        	
        	url : '/mtsystem/selectList',
        	type : 'get',
        	data : {
        		"departmentSelect" : departmentSelect
        	},
        	success : function(result){

				var list = result.data
				
        		var html ="";
        		
        		for(var i = 0; i < list.reviewlist.length; i++){
        			var name = list.reviewlist[i].user_NAME + ' ' + list.reviewlist[i].user_GRADE;
        			html += '<tr>';
        			html += '<td><input type="checkbox" name="Name" value ="' + name +'"><input type="checkbox" id="usernum" name="USER_NUM" value="'+ list.reviewlist[i].user_NUM +'" ></td>';
        			html += '<td>'+ name + '</td>';
        			html += '</tr>';
        			
        		}
        		$('#re_list').html(html);
        		
        		
        		
        		var html1 ="";
        		
        		for(var i = 0; i < list.approvelist.length; i++){
        			
        			var name1 = list.approvelist[i].user_NAME + ' ' + list.approvelist[i].user_GRADE;
        			
        			html1 += '<tr>';
        			html1 += '<td><input type="checkbox" name="Name1" value ="' + name1 +'"><input type="checkbox" id="usernum1" name="USER_NUM" value="'+list.approvelist[i].user_NUM +'" ></td>';
        			html1 += '<td>'+ name1 + '</td>';
        			html1 += '</tr>';
        		
        		}
        		$('#app_list').html(html1);
        		
                $('input[type="checkbox"][name="Name"]').click(function(){
                	 
                    if($(this).prop('checked')){
                    	$('input[type="checkbox"][name="Name"]').prop('checked',false)
                    	$('input[type="checkbox"][name="Name"]').siblings('input[type="checkbox"][name="USER_NUM"]').prop('checked',false);
                        $(this).prop('checked',true);
                        $(this).siblings('input[type="checkbox"][name="USER_NUM"]').prop('checked',true);
                     
                      
                    }
                    
                   

                });
                
                $('input[type="checkbox"][name="Name1"]').click(function(){
               	 
                    if($(this).prop('checked')){
                    	$('input[type="checkbox"][name="Name1"]').prop('checked',false)
                    	$('input[type="checkbox"][name="Name1"]').siblings('input[type="checkbox"][name="USER_NUM"]').prop('checked',false);
                        $(this).prop('checked',true);
                        $(this).siblings('input[type="checkbox"][name="USER_NUM"]').prop('checked',true);
                        
                    }
                });
                
                $('#reviewSend').click(function(){
                	var reviewer1 = $('input[type="checkbox"][name="Name"]:checked').val();
                	var reviewer2 = $('input:checkbox[id="usernum"]:checked').val();

                	$('#res1').show();
                	$('#res1').val(reviewer1);
                	$('#key1').val(reviewer2);
                });

                $('#approveSend').click(function(){
                	var approval1 = $('input[type="checkbox"][name="Name1"]:checked').val();
                	var approval2 = $('input:checkbox[id="usernum1"]:checked').val();         	
                	
                	$('#res2').show();
                	$('#res2').val(approval1);
                	$('#key2').val(approval2);
                	
                });
                
                
                $('.yes').click(function(){
                	
                 	var reviewName = $('#res1').val();
                	var reviewKey = $('#key1').val();
                	
                	var approveName = $('#res2').val();
                	var approveKey = $('#key2').val();
                	
                	
                	
                	
                	if($('#user_re').val(reviewName) && $('#user_re1').val(reviewKey)){
                		$('#user_app').val(approveName);
                    	$('#user_app1').val(approveKey);
                    	
                    	$('.selectBg').hide();
                    	alert("선택을 완료하였습니다.");
                	}
                	

                });
                
                $('.no').click(function(){
                	
                	$('.selectBg').hide();
                	alert("취소되었습니다.");
                });

        		
        	},
        	error : function(){}
        	
        });
    	
    }
    
  
    

</script>
</body>
</html>