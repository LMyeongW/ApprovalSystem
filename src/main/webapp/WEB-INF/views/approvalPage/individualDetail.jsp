<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/approvalPage/register.css">
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
                <div class="con_left">
                    <div class="con_left_title"><h3>휴가신청서</h3></div>
                    <table class="table_box">
                        <tbody>
                            <tr>
                                <th>소속</th>
                                <td>${data.approvalvo.USER_DEPARTMENT}</td>
                                <th>사번</th>
                                <td>${data.approvalvo.USER_NUM}</td>
                            </tr>
                            <tr>
                                <th>성명</th>
                                <td>${data.approvalvo.USER_NAME}</td>
                                <th>당담업무</th>
                                <td><input type="text" name="ASSIGNED_TASK" id="task" readonly="readonly" value="${data.approvalvo.ASSIGNED_TASK}"></td>
                            </tr>
                            <tr>
                                <th>직위</th>
                                <td>${data.approvalvo.USER_GRADE}</td>
                                <th>업무인수자</th>
                                <td><input type="text" name="UNDERWRITER" id="underwriter" readonly="readonly" value="${data.approvalvo.UNDERWRITER}"></td>
                            </tr>
                            <tr>
                                <th >종류</th>
                                <td colspan="3">
                                    <div class="sort">
      	
                                        <input type="radio" id="s1" name="APPROVAL_SORTS" value="연차" onclick="return(false)" <c:if test="${data.approvalvo.APPROVAL_SORTS eq '연차'}">checked="checked"</c:if>/>
                                        <label for="s1">연차</label>

                                        <input type="radio" id="s2" name="APPROVAL_SORTS" value="월차" onclick="return(false)" <c:if test="${data.approvalvo.APPROVAL_SORTS eq '월차'}">checked="checked"</c:if>/>
                                        <label for="s2">월차</label>

                                        <input type="radio" id="s3" name="APPROVAL_SORTS" value="반차" onclick="return(false)" <c:if test="${data.approvalvo.APPROVAL_SORTS eq '반차'}">checked="checked"</c:if>/>
                                        <label for="s3">반차</label>

                                        <input type="radio" id="s4" name="APPROVAL_SORTS" value="훈련,교육" onclick="return(false)" <c:if test="${data.approvalvo.APPROVAL_SORTS eq '훈련,교육'}">checked="checked"</c:if>/>
                                        <label for="s4">훈련,교육</label>

                                        <input type="radio" id="s5" name="APPROVAL_SORTS" value="경조" onclick="return(false)" <c:if test="${data.approvalvo.APPROVAL_SORTS eq '경조'}">checked="checked"</c:if>/>
                                        <label for="s5">경조</label>

                                        <input type="radio" id="s6" name="APPROVAL_SORTS" value="기타(생휴)" onclick="return(false)" <c:if test="${data.approvalvo.APPROVAL_SORTS eq '기타(생휴)'}">checked="checked"</c:if>/>
                                        <label for="s6">기타(생휴)</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th> 사유</th>
                                <td colspan="3">
                                    <textarea name="REASON" id="reason" readonly="readonly">${data.approvalvo.REASON}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <th> 기간</th>
                                <td colspan="3">
                                    <input type="date" name="APPROVAL_STARTDATE" id="start" readonly="readonly" value="${data.approvalvo.APPROVAL_STARTDATE}"> ~ <input type="date" name="APPROVAL_ENDDATE" id="enddate" value="${data.approvalvo.APPROVAL_ENDDATE}"  readonly="readonly"> 
                                    <input type="text" id="sumdate" name="SUMDATE" readonly="readonly">
                                </td>
                            </tr>
                            <tr>
                                <th> 비상 연락망</th>
                                <td colspan="3">
                                    <input type="text" name="EMERGENCY_CONTACT" id="emergency" readonly="readonly" value="${data.approvalvo.EMERGENCY_CONTACT}">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="bottom">위와 같이 휴가를 신청 하오니 재가하여 주시기 바랍니다.</div>
                    <ul class="nowdate">
                        <li id="yy">${data.USER_YY}년</li>
                        <li id="mm">${data.USER_MM}월</li>
                        <li id="dd">${data.USER_DD}일</li>
                    
                    </ul>
                </div>
                <div class="con_right">
                    <div class="right_up">
                        <div class="con_right_title">
                            <h3>검토/승인 현황</h3>
                        </div>
                        <input type="hidden" name="REVIEWER" value="${data.approvalvo.REVIEWER}">
                        <table class="table_box1">
                            <tbody>
                                <tr>
                                    <th>신청자</th>
                                    <td colspan="3">${data.approvalvo.USER_NAME}  ${data.approvalvo.USER_GRADE}</td>

                                </tr>
                                <tr>
                                    <th>검토자</th>
                                    <td>${data.approvalvo.REVIEWER}</td>
                                    <th class="th1">상태</th>
                                    <td>${data.approvalvo.REVIEW_STATUS}</td>
                                </tr>
                                <tr>
                                    <th>승인자</th>
                                    <td>${data.approvalvo.APPROVER}</td>
                                    <th class="th1">상태</th>
                                    <td>${data.approvalvo.APPROVE_STATUS}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="reviewRegister1">
                        <div class="title">
                            <h3>승인</h3>
                        </div>

                        <div class="content">
                        	<input type="hidden" name="APPROVAL_PK" value="${data.approvalvo.APPROVAL_PK}"/>
                            <table id="table2">
                                <tbody class="tb">
                                    <tr>
                                        <th>검토 내용</th>
                                        <td>
                                            <textarea id="review_content" name="REVIEW_CONTENT" readonly="readonly">${data.approvalvo.REVIEW_CONTENT}</textarea>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>승인 내용</th>
                                        <td>
                                            <textarea id="approve_content" name="APPROVE_CONTENT" readonly="readonly">${data.approvalvo.APPROVE_CONTENT}</textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <c:if test="${member.USER_NUM != data.approvalvo.USER_NUM}" >
            				<script>
            					location.href="/mtsystem/individualStatusList";
    						</script>
            			</c:if>
                    </div>
                </div>

                
    
                <div class="btn_box1">
                    <div class="cancel">나가기</div>
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
	    

        var startdate = $('#start').val();
        var enddate = $('#enddate').val();

        var date1 = new Date(startdate);
        var date2 = new Date(enddate);

        var sumSec = date2.getTime() - date1.getTime();
        var sumdate = sumSec/ (1000 * 60 * 60 * 24); 

       
        if(startdate!="" && enddate !=""){
            $('#sumdate').val(sumdate + 1);
        }


		$('.cancel').click(function(){
			
			var con = confirm('현재페이지에서 나가시겠습니까?');
			if(con){
				location.href="/mtsystem/individualStatusList";
				}
		});
	

        


     });
</script>
</body>
</html>