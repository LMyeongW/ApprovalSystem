<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/account/login.css">
</head>
<body>
    <div id="wrap">
        <div class="inner_size">

            <div class="content">
                <div class="icon">
                    <img src="/resources/images/pngwing.com.png" alt="자물쇠">
                </div>
                <div class="left">
                    <div class="title">
                        MT-Approval System
                    </div>
                    <div class="sub_title">
                        Login
                       
                    </div>
                </div>
                <div class="right">

                    <form id="loginform" method="post">
                        <div class="input_box">
                            <div class="usernum">
                                <span>사원번호</span>
                                <input type="text" name="USER_NUM" placeholder="사원번호를 입력해주세요." id="id">
                               
                            </div>
    
                            <div class="pw">
                                <span>비밀번호</span>
                                <input type="password" name="USER_PW" placeholder="비밀번호 입력해주세요." id="pw">
                                
                            </div>
    
                            <div class="btn_box">
                                <p class="login">
                                    <input type="button" class="login_input" value="로그인">
                                </p>
                               
                            </div>
                        </div>
                        <!-- .input_box -->
                    </form>
                </div>
            </div>
            <!-- .content -->
        </div>
        <!-- .inner_size -->
        <div class="idQ">
            <div class="alert_box">
                	사원번호를 입력해주세요.
                <div class="btn_box">
                    <div class="yesI">확인</div>
                </div>
            </div>
        </div>
        <!-- .idQ -->
        
        <div class="pwQ">
            <div class="alert_box">
                	비밀번호를 입력해주세요.
                <div class="btn_box">
                    <div class="yesP">확인</div>
                </div>
            </div>
        </div>
        <!-- .idQ -->
    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>

	$(document).ready(function(){
		
		
		$('.join').click(function(){
			location.href ="/account/join";
		});
		
		$("#id").on("propertychange change keyup paste input", function(){
			
			var id = $('#id').val();

			if(id == ""){
				$('#id').removeClass('on');
			} else {
				$('#id').addClass('on');
				$('.warn_Id').css("display","none");
			}
		
		});
		
		$("#pw").on("propertychange change keyup paste input", function(){
			
			var pw = $('#pw').val();

			if(id == ""){
				$('#pw').removeClass('on');
			} else {
				$('#pw').addClass('on');
				$('.warn_pw').css("display","none");
			}
		
		});
		
		$('.login').click(function(){
			
			var idck = $('input[name=USER_NUM]').val();
			var pwck = $('input[name=USER_PW]').val();

			if(idck == "" || idck == null){
				$('.idQ').addClass('on');
				$('.yesI').click(function(){
					$('.idQ').removeClass('on');
				});
				return false;
			}
			
			if(pwck == "" || pwck == null){
				$('.pwQ').addClass('on');
				$('.yesP').click(function(){
					$('.pwQ').removeClass('on');
				});
				return false;
			}
			
	        $("#loginform").attr("action", "/login.do");
	        $("#loginform").submit();
			
		});
		
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
		

	});
</script>
</body>
</html>