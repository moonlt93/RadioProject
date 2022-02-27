<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head> 
<script type="text/javascript">
	var root = '${root}'
</script>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	var form = $("#form");
	
	$("#delete_btn").click(function(){
		form.append("<input type='hidden' name='center_bno' id='test_bno' value='" + ${CenterVO.center_bno} +"'>");		
		form.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token }'>");

		form.attr("method", "post");
		form.attr("action", root + "/service/delete_member");
				
		form.submit(); 
	});
	
	var replyForm = $('#reply_form');
	
	$("#com_reply").click(function() {
		replyForm.submit();
	});
	
});
</script>
<title>Insert title here</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	.read_form {		
		padding: 3%;
		margin: 3%;
	}
	
	.center_header { 
		
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
	

	.center_input {	
		margin-top: 50px;
		background-color: snow; 
	}	 
	.form_list{
 		display: flex; 
 		margin: 30px 0px 30px 0px;
 		padding: 0px 0px 10px 0px;		
 	}
	.label {
		color: black;
		text-align: center;
		width: 100px;
		font-weight: bold; 
	} 
	.input input {
		border: 1px solid grey;
		outline: none; 
		height: 40px;
		background-color: lightgrey;
		width: 500px;
		padding-left: 10px;
		border-radius: 2px 2px;
		margin-bottom: 5px;
	} 
	
	.inquiry_form {
		list-style: none;
		padding-left: 50px;
	}
	.btn_list_delete { 
		width: 100px;
		padding: 0px;
		border-radius: 5px;
		background-color: lightgrey; 
	}
	
	.rep_txt {
		width: 100%;
		resize: none;
		outline: none;
		border: 1px silver solid;
		border-radius: 2px 2px;
	}
	
	.inquiryTxt {
		width: 800px;
		outline: none; 
		resize: none;
	}
	
	.reply_form {
		margin: 0px 70px 0px 70px;
	}
	.reply_form_header {
		padding: 15px 0px 15px 0px;
		background-color: rgb(241, 241, 241); 
		border-radius: 0px; 
		border-top: solid 1px silver;
	}
</style>
</head>
<body>

 
<div>
<div class="read_form">
	
<div style="padding: 20px 15px 10px 15px; background-color: lightslategrey">
	<div class="center_header" style="border-radius: 0px;">
			<h2>문의 내역</h2>
		</div>	

</div>	
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
					<input id="userID" type="text" name="member_id" value="${CenterVO.member_id }"/>			
				</div>	
				</li>
			
				<li class="form_list">
				<div class="label">
					<label for="userName">
						<span>이름</span>
					</label>
				</div>
				<div class="input">
					<input id="userName" type="text" name="center_name" value="${CenterVO.center_name }"/>
				</div>
				</li>
			
				<li class="form_list">
				<div class="label">
					<label for="userEmail">
						<span>이메일</span>
					</label>
				</div>
				<div class="input">
					<input type="text" name="center_email" value="${CenterVO.center_email }" /> 
				</div>
				</li>
			
				<li class="form_list">
				<div class="label">	
					<label>
					<span>문의 유형</span>
					</label>		
				</div>
				<div class="input">
					<input type="text" name="center_type" value="${CenterVO.center_type }">
				</div>
				</li>
				
			
				<li class="form_list">
				<div class="label">
					<label for="inquiryTitle">
						<span>제목</span>
					</label>
				</div>
				<div class="input">
					<input id="inquiryTitle" type="text" name="center_title" value="${CenterVO.center_title }">
				</div>				
				</li>
			
				<li class="form_list">
				<div class="label">
					<label for="inquiryTxt">
						<span>내용</span>
					</label>
				</div>
				<div class="input">
					<textarea style="background-color: lightgrey;" cols="30" rows="10" class="inquiryTxt" style="border: 1px solid grey;;" name="center_content">${CenterVO.center_content }</textarea> 
				</div>
				</li>
			</ul> 
			
		</div>	
	</form>	
			
</div>
		
		<div class="reply_form">
			<div class="reply_form_header" style="display: flex; justify-content: center; align-items: center;">
				<div><strong>문의 답변</strong></div> 
				<div></div> 
			</div>
			<div class="reply_form_body" style="height:150px; margin:0px 0px 20px 0px; border: 1px solid silver;  border:none; border-bottom: 1px solid silver; border-radius:0px;">			
				<p>${CenterVO.center_reply }</p>	
			
			</div>
			
				
		<div class="btn_group">
			<ul style="list-style: none; display: flex; justify-content: space-between;">
			<li><button id="delete_btn" class="btn_list_delete" type="button">삭제하기</button></li>
			</ul>
		</div>
		</div>
	

			
	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
	<div class="reply_form">
		<form id="reply_form" action="/service/com_register" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">	
			<input type="hidden" name="center_bno" value="${CenterVO.center_bno }">
			<textarea cols="10" rows="5" class="rep_txt" name="center_reply"></textarea>	
			<button id="com_reply" type="button" style="background-color: lightslategrey; margin-bottom: 20px;">답글</button>
		</form>
	</div>
	</sec:authorize>
</div>
	
	

	
	
	
	<div class="d-none">
		<form id="form" action="/service/member" >
			<input type="text" name="pageNum" value="${cri.pageNum }">
			<input type="text" name="amount" value="${cri.amount }">				
			<input type="submit"/>
		</form>
	</div>

</body>
</html>