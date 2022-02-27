<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${root }/resources/css/all.min.css" rel="stylesheet">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <script type="text/javascript">
$(document).ready(function() {
	 
 	$(".login_form input").on("focus", function() {
 		$(this).addClass("focus");
 	});
 	
 	$(".login_form input").on("blur", function() {
 		if($(this).val() == "")
 		$(this).removeClass("focus");
 	});
}); 
 </script>
<style type="text/css">
	.login_container {
		position: relative;
		height: 600px;
		
	}
	.login_sub_container {
		padding: 60px 40px; 
		background: #f1f1f1;
		height: 550px;    
		width: 360px;	 
		margin: 20px 0px 10px 0px;
		position: absolute; 
		left: 30%; 
	}	
	
	.login_header h2 {
		text-align: center; 
		margin-bottom: 50px;
		font-weight: bold;
	}
	
	.login_form {
		border-bottom: 2px solid #adadad;
		position: relative;
		margin: 30px 0;
	}
	
	.login_form input {
		font-size: 15px;
		color: #333;		
		border: none;
		width: 100%;
		outline: none;
		background: none;
		padding: 0 5px;
		height: 40px;
	}
	.span::before {
		content: attr(data-placeholder);
		position: absolute;
		top: 50%;
		left: 5px;
		color: #adadad; 
		transform: translateY(-50%);
		transition: .5s;		
	}
	
	.span::after {
		content: '';
		position: absolute;
		width: 0%;
		height: 2px;
		background: linear-gradient(120deg,#3498db,#8e44ad);
		transition: .5s;
	}
	
	.focus + span::before {
		top: -5px;
	}
	
	.focus + span::after {
		width: 100%;
	}
	
	.loginBtn {
		width: 100%;
		height: 50px;
		border: none;
		color: #fff;
		outline: none;
		background-color: lightslategrey;
		border-radius: 5px 5px;
		margin-top: 60px; 
	} 
	
	.loginBtn:hover {
		background-position: right;
	}
	
	.btn_list {
		margin-top: 10px;
		margin-bottom: 10px;
		text-align: center;
		font-size: 13px; 
	}
	
	.btn_list span a{  
		color: black;
		margin: 0px 3px 0px 3px;
	}
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="login_container" >
	<div class="login_sub_container"> 
	     		<form action="${root }/login" method="post" id="form_id">
					
							<div class="login_header"> 
								<h2>로그인</h2>
	     					</div>
	     						
							<h5><c:out value="${error }"/></h5>
							<h5><c:out value="${logout }"/></h5>
							
							<div class="login_form" style="border-radius: 0px;">
								<input type="text" name="username">
								<span class="span" data-placeholder="아이디"></span>
							</div>
							<div class="login_form" style="border-radius: 0px;">
								<input type="password" name="password" />
								<span class="span" data-placeholder="비밀번호"></span>
							</div>
							<div class="login_form_check">
								<span><input type="checkbox" name="remember-me">자동 로그인</span>
							</div>
							
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
							
							<div class="btn_list" style="display: flex;" >
								<span><a class="find_btn" href="${root }/member/findid">아이디찾기</a></span>/<span><a class="find_btn" href="${root }/member/findpw">비밀번호 찾기</a></span>
							</div>
							<div>
								<button class="loginBtn" type="submit">로그인</button> 
							</div>
						</form>
					
				</div>
	</div>
</body>
</html>