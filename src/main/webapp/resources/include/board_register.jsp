<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
var root = '${root}';
</script>
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

	$(document).ready(function(e){
		
		var registerForm = $("#registerForm");
		
		$("button[data-oper='register']").click(function(e){
			
			
			registerForm.submit();
		});

		
		$("button[data-oper='cancel']").click(function(e){
			
			registerForm.attr("method", "get");
			registerForm.attr("action", root + "/board/list");
			registerForm.submit();
		});
		
		
	});

</script>
<style type="text/css">
	.header_title {
		border-bottom: 1px silver solid;
		margin-top: 10px;	
		padding: 5px 0px 0px 0px;
		height: 30px;
	}
	
	.header_title h6 {
		margin-left: 10px;	 
	} 
	
	.register_wrapper {
		margin: 30px 40px 10px 40px;
	}
	
	.tit_input {
		margin-bottom: 20px;
	}
	.tit_input input {
		outline: none;
		border: 1px solid silver;
		border-radius: 5px 5px; 
		padding-left: 10px;
	}
	
	.con_input textarea {
		resize: none;
		outline: none;
		border: 1px silver solid;
		margin-bottom: 10px;
		border-radius: 5px 5px;
		padding-left: 10px;
		padding-top: 10px;
	}
	
	.reg_btn {
		background-color: lightgrey;
		color: grey;
		padding: 2px 4px 2px 4px;
		border-radius: 3px;
		height: 27px;
		margin-right: 5px;
	}
	
	.wri_input {
		outline: none;
		border: none;
		background-color: snow;
		color: grey;
	}
	.tit_input {
		height: 40px;
		margin-bottom: 20px;
	}
	.tit_input input {
		outline: none;
	}
	.tit_content {
			padding: 0px 100px 20px 100px;  
		background-color: rgb(241, 241, 241);
		margin-bottom: 10px;
		margin-left: 20px;
		margin-right: 20px;
		border-radius: 5px 5px;
	}
	.wri_input input {
		border: none;
		background-color: snow;
		color: grey;
		
	}
	
	.wri_input {
		margin-bottom: 20px;	
	}
		
	.reg_btn:hover {
		border: none;
		outline: none;
	}
	
	.tit_header {
		padding: 30px 0px 10px 0px;
		margin:0px 5px 20px 10px;
		font-weight: bold;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
<div class="header_title">
<h6>요일코너</h6>
</div>

<div class="register_wrapper">				
				<form id="registerForm" action="${root }/board/register" method="post">
							
				<div class="tit_content">
				<div class="tit_header">글 등록</div>
					<div class="tit_input">
						<input  type="text" name="board_title" class="" placeholder="제목을 입력하세요.">
					</div>
		
					<div class="con_input">		
						<textarea wrap="hard" name="board_content"
									cols="10" rows="10" placeholder="내용을 입력하세요."></textarea>
					</div>
				</div>
					
					
					<div class="wri_input" style="float:right;">
						<span style="margin-left: 20px;">작성자 :
						<input readonly name="board_id" type="text" value="<sec:authentication property='principal.username'/>"  >
						</span> 
					</div>
					<input type="hidden" name="board_day" value="${board_Criteria.day }">
					<input type="hidden" name="pageNum" value="${board_Criteria.pageNum }">
					<input type="hidden" name="amount" value="${board_Criteria.amount }">
					<input type="hidden" name="type" value="${board_Criteria.type }">
					<input type="hidden" name="keyword" value="${board_Criteria.keyword }">
					<input type="hidden" name="day" value="${board_Criteria.day }">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					
					<input hidden type="submit" />
					
					
					
				</form>
				
				
				
				
			
			
			
		<div class="btn-group" style="display:flex; justify-content: space-between;">
			<div>
	  			<button data-oper="register" type="button" class="reg_btn">작성하기</button>
			</div>
			<div>
	  			<button data-oper="cancel" type="button" class="reg_btn">취소</button>
			</div>
		</div>
</div>








</body>
</html>