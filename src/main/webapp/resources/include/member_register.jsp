<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	var root = '${root}';
</script>
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${root }/resources/js/joincheck.js"></script>
<script src="${root }/resources/js/address.js"></script>
<script type="text/javascript">
</script>
<script>
$(document).ready(function() { 	
	$("#id").blur(function() {
		var idt = /^[a-z]+[a-z0-9]{4,12}$/;
		var id = $('#id').val();
		
		$.ajax({
			url : root + '/member/check_id?id=' + id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x :" + data);

				if (data === '1') {
					// 아이디가 중복되는 문구
					$("#id_check").text("사용중인 아이디입니다 :p");			
					document.getElementById("signUpIdCheck").value = "0";
				} else {
					if (idt.test(id)) {
						$("#id_check").text("");
						document.getElementById("signUpIdCheck").value = "1";
					} else if (id === "") {
						$('#id_check').text('아이디를 입력해주세요 :p');
						document.getElementById("signUpIdCheck").value = "0";
					} else {
						$('#id_check').text("[아이디는 소문자와 숫자 4~12자리만 가능합니다.]");
						document.getElementById("signUpIdCheck").value = "0";
					}
				}
			},
			error : function() {
				console.log("실패");
			}
		});
	});
	
	$("#password").blur(function() {
		var pw1 = $('#password').val();
		var pw2 = $('#confirmPassword').val();
		var pwt = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
		
			if (pwt.test(pw1)) {
				$('#password_check').text("");
				document.getElementById("signUpPwCheck").value = "1";
			} else if(pw1 == "") {
				$('#password_check').text("비밀번호를 입력하세요");
				document.getElementById("signUpPwCheck").value = "0";
			} else {
				$('#password_check').text("[비밀번호는 영문,숫자, 특수문자~`!@#$%\^&*()-+=를 조합하여 8자 이상으로 만들어주세요.]");
				document.getElementById("signUpPwCheck").value = "0";
			}							
	}); 
	
	$("#confirmPassword").blur(function() {				
		var pw1 = $('#password').val();
		var pw2 = $('#confirmPassword').val();
		var pwt = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
			
									
			if ((pw1 == pw2) && pwt.test(pw2)) {
				$('#confirm_check').text("");	
				document.getElementById("signUpRePwCheck").value = "1";
			} else if ((pw1 == pw2) && !pwt.test(pw2)){
				$('#confirm_check').text("");
				document.getElementById("signUpRePwCheck").value = "0";
			} else if ((pw1 =! pw2) && !pwt.test(pw2)) {					
				$('#confirm_check').text("비밀번호가 일치하지 않습니다.");	
				document.getElementById("signUpRePwCheck").value = "0";
			} else {
				$("#confirm_check").text("비밀번호가 일치하지 않습니다.");
				document.getElementById("signUpRePwCheck").value = "0";
			} 							
		if (pw2 == ''){
			$('#confirm_check').text("비밀번호 확인을 입력하세요");
			document.getElementById("signUpRePwCheck").value = "0";
		}									
	});	
	
	$("#name").blur(function() {
		var namet = /^[가-힣]{2,6}$/;
		var name = $('#name').val();
		
		if (namet.test(name)) {
			$('#name_check').text("");
			document.getElementById("signUpNameCheck").value = "1";
		} else if(name == "") {
			$('#name_check').text("이름을 확인해주세요.");
			document.getElementById("signUpNameCheck").value = "0";
		} else {
			$('#name_check').text("[한글로 이루어진 2~6자리의 이름만 사용가능합니다.]");
			document.getElementById("signUpNameCheck").value = "0";
		}
	});
	
	$("#email").blur(function() {
		var emailt = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email = $('#email').val();
		
		$.ajax({
			url : root + '/member/check_email?email=' + email,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x :" + data);

				if (data === '1') {
					// 아이디가 중복되는 문구
					$("#email_check").text("사용중인 이메일 입니다.");
					document.getElementById("signUpEmailCheck").value = "0";
				} else {
					if (emailt.test(email)) {
						$("#email_check").text("");
						document.getElementById("signUpEmailCheck").value = "1";
					} else if (email === "") {
						$('#email_check').text('이메일을 입력해주세요.');
						document.getElementById("signUpEmailCheck").value = "0";
					} else {
						$('#email_check').text("알맞지 않은 형식입니다.");
						document.getElementById("signUpEmailCheck").value = "0";
					}
				}
			},
			error : function() {
				console.log("실패");
			}
		});
	});
	
	$(".input_field input").on("focus", function() {
 		$(this).addClass("focus");
 	});
 	
 	$(".input_field input").on("blur", function() {
 		if($(this).val() == "")
 		$(this).removeClass("focus");
 	});
	 
});
</script>
<style type="text/css">
.wrapper_join {
	position: relative; 
	height: 1000px;   
}  
 
.join_content {
	padding: 60px 40px; 
	background: #f1f1f1;
	height: 800px;    
	width: 500px;	 
	margin: 20px 0px 10px 0px; 
	position: absolute; 
	left: 30%;    
} 

.join_header h2 {
	text-align: center; 
	font-weight: bold; 
}
.input_small {
	position: relative;
	margin: 30px 0px 30px 0px;  
	padding: 10px 0px 10px 0px;
}
.input_field {
	border-bottom: 2px solid #adadad;
	position: relative;
	border-radius: 0px;  
	width: 300px;
}
 
.input_field input { 
	font-size: 15px;
	color: #333;		
	border: none;  
	width: 100%; 
	outline: none;
	background: none; 
	height: 20px;
	
} 

 button {
	background-color: lightgrey;
	border-radius: 2px 2px; 
}
.check_font {
	position: absolute;
	color: red;
	margin-top: 35px;
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
.post2 div {
	margin-bottom: 10px;
}

.post2 .input_field {  
	margin-bottom: 10px;
}
</style> 
<title>Insert title here</title>
</head> 
<body>

<div class="wrapper_join">
	
	<div class="join_content">
		<div class="join_header"> 
			<h2>회원가입</h2>
		</div>
	
	<form id="join_form" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
		<input type="hidden" name="auth" value="ROLE_MEMBER"/>
							
						<div class="input_small">
							<div class="input_field" style="border-radius: 0px;">		
								<input type="text" class="input_id" name="id" id="id">
								<span class="span" data-placeholder="아이디"></span>		
							</div>
									<small class="check_font" id="id_check"></small> 			 			
						</div>								
								
															
						<div class="input_small">
							<div class="input_field" style="border-radius: 0px;">					
								<input type="password" class="password" name="password" id="password">
								<span class="span" data-placeholder="비밀번호"></span>			
							</div>
								<small class="check_font" id="password_check"></small>					
						</div>	
						
				
						<div class="input_small">
							<div class="input_field" style="border-radius: 0px;">
								<input type="password" class="confirmPassword" id="confirmPassword">
								<span class="span" data-placeholder="비밀번호 확인"></span>	
							</div>					
								<small class="check_font" id="confirm_check"></small>													
						</div>					
								
							
								
						<div class="input_small">
							<div class="input_field" style="border-radius: 0px;"> 
								<input type="text"class="name" name="name" id="name">
								<span class="span" data-placeholder="이름"></span>	
							</div>						
								<small class="check_font" id="name_check"></small>									
						</div>							
							
						<div class="input_small">
							<div class="input_field" style="border-radius: 0px;">
								<input type="text" class="email" name="email" id="email">
								<span class="span" data-placeholder="이메일"></span>	
							</div>	
								<small class="check_font" id="email_check"></small>							
						</div>
							
			<div class="post" style="display: flex; justify-content: space-between; margin-bottom: 20px;"> 
					<div class="input_field" style="border-radius: 0px; width: 90px;">
						<span><i class="fa fa-map-marker"></i>주소</span>
						<input type="text" class="add1" name="add1" id="sample6_postcode"
							 readonly style="width:100px; text-align:center"> 				
					</div>	
												
					<div class="input_button"> 
						<button style="height: 30px; width: 140px;  padding:0px 10px 0px 10px;" class="postCode"
						 type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						우편번호 찾기</button>
					</div>  
				
				
				
			</div>
				
				
		<div class="post2">
			
				<div class="">
					<div class="input_field" style="border-radius: 0px;">
					
						<input type="text" class="add2" name="add2" id="sample6_address"
							readonly>
					
					</div>				
				</div> 
						
				<div class=""> 
					<div class="input_field" style="border-radius: 0px;"> 
						<input style="text-align:center;"type="text" class="add4" name="add4"
							id="sample6_extraAddress" readonly >
					</div>					 		
				</div>
						 
		</div> 
			 
					
				<div class="">
					<div class="input_field" style="border-radius: 0px;">
						<span><i class="fa fa-map-marker"></i>상세주소</span>
						<input type="text" class="add3" name="add3"
							id="sample6_detailAddress" readonly>
						 
					</div>						
				</div>
					 
							 															
			
		<button style="margin-top: 10px; background-color: lightslategrey; width: 100%; height: 30px; border-radius: 2px 2px;" id="insertCustomer" type="button" onclick="checkAll()" value="회원가입">회원가입</button>
				
	</form> 		 
	</div>
</div>			 
	


<input hidden type="text" id="signUpIdCheck" name="signUpIdCheck" >
<input hidden type="text" id="signUpPwCheck" name="signUpPwCheck" >
<input hidden type="text" id="signUpRePwCheck" name="signUpRePwCheck" >
<input hidden type="text" id="signUpNameCheck" name="signUpNameCheck" >
<input hidden type="text" id="signUpEmailCheck" name="signUpEmailCheck" >

</body>
</html>