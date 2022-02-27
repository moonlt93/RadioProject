<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${root }/resources/css/all.min.css" rel="stylesheet">  
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var serviceForm = $("#serviceForm");
		$("#sub_btn").click(function() {
			serviceForm.submit();
		}); 
		
	});
</script>
<title>Insert title here</title>
<style type="text/css">
	body{
		 
	}
	.center_wrapper {
		margin: 3%;
		padding: 3%;
		display: grid;	
	}	 
	
	.center_header { 
		border-bottom: 2px solid snow;	
	}
	.center_header h2 {
		text-align: center;		
		color: white;
		font-weight: bold;
	}
	
	.menu_button ul{
		list-style: none;
		display: flex;
		justify-content: center;
	}
	
	.menu_button ul li {
		font-size: 20px;
		padding: 5px 10px 5px 10px;
	}
	.menu_button ul li a {
		text-decoration: none;
	}
	.label {
		color: snow;
		text-align: center;
		width: 100px;
		font-weight: bold; 
	} 
	.inquiry_wrapper {
		
		margin-top: 50px;
		background-color: lightslategrey; 
	}
	.inquiry_form {
		list-style: none;
		padding-left: 50px;
	}
	
 	.form_list{
 		display: flex; 
 		margin: 30px 0px 30px 0px;
 		padding: 0px 0px 10px 0px;		
 	}
	
	.input input {
		border: none;
		outline: none; 
		height: 30px;
		background-color: white;
		width: 500px;
		padding-left: 10px;
	}
	
	textarea {
		width: 800px;
		outline: none;
	}
	
	.reg_btn {
		margin-top: 20px; 
	}
	.sub_btn {
		background-color: snow;
		border: 2px solid lightslategrey;
		color: lightslategrey;
		height: 40px;
		border-radius: 3px 3px;
	}
	
	.sub_btn:hover {
		color: snow;
		background-color: lightslategrey;
	}
</style>
</head>
<body>
	
<div class="center_wrapper">

<div style="padding: 20px 15px 10px 15px; background-color: lightslategrey">		
		<div class="center_header" style="border-radius: 0px;">
			<h2>고객 센터</h2>
		</div>	
		
		<div class="menu_button">
			<ul>
				<li><a href="${root }/service/register" style="color: white;"><strong>문의하기</strong></a></li>
				<li>|</li>
				<li><a href="${root }/service/member" style="color: white;">내 문의 내역</a></li>
			</ul>	 
		</div>
</div>
	
	
<div class="inquiry_wrapper">
	<form action="${root }/service/register" method="post" id="serviceForm">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<div class="center_input">
			
			<ul class="inquiry_form">
				<li class="form_list">
				<div class="label">
					<label for="userID">
						<span>아이디</span>
					</label>
				</div>
				<div class="input">
					<input id="userID" type="text" name="member_id" value='<sec:authentication property="principal.member.id"/>' />			
				</div>	
				</li>
			
				<li class="form_list">
				<div class="label">
					<label for="userName">
						<span>이름</span>
					</label>
				</div>
				<div class="input">
					<input id="userName" type="text" name="center_name" value='<sec:authentication property="principal.member.name"/>' />
				</div>
				</li>
			
				<li class="form_list">
				<div class="label">
					<label for="userEmail">
						<span>이메일</span>
					</label>
				</div>
				<div class="input">
					<input type="text" name="center_email" value='<sec:authentication property="principal.member.email"/>' /> 
				</div>
				</li>
			
				<li class="form_list">
				<div class="label">			
					<span>문의 유형</span>
				</div>
				<div class="input_radio">	
					<ul style="list-style: none; display: flex;" >
						<li><input type="radio" name="center_type" value="결제/이용권">결제/이용권</li>
						<li><input type="radio" name="center_type" value="회원/로그인">회원/로그인</li>
						<li><input type="radio" name="center_type" value="서비스/콘텐츠">서비스/콘텐츠</li>
						<li><input type="radio" name="center_type" value="mini/라디오">mini/라디오</li>
						<li><input type="radio" name="center_type" value="기타">기타</li>
					</ul>
				</div>
				</li>
			
				<li class="form_list">
				<div class="label">
					<label for="inquiryTitle">
						<span>제목</span>
					</label>
				</div>
				<div class="input">
					<input id="inquiryTitle" type="text" name="center_title">
				</div>				
				</li>
			
				<li class="form_list">
				<div class="label">
					<label for="inquiryTxt">
						<span>내용</span>
					</label>
				</div>
				<div class="input">
					<textarea cols="30" rows="10" id="inquiryTxt" style="border: none;" name="center_content"></textarea> 
				</div>
				</li>
			</ul> 
			
		</div>	
	</form>	
			
	</div>
		<div class="reg_btn">
			<button id="sub_btn" class="sub_btn" type="button">문의하기</button>			
		</div>
</div>
	
	
	
</body>
</html> 