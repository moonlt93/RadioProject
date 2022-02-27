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

<title>Insert title here</title>
</head>
<body>
<div class="container-sm">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<h1>게시물 작성하기</h1>
			</div>
		</div>	
			
		<div class="row justify-content-center">
			<div class="col-lg-12">	
		
				<form id="registerForm" action="${root }/board/register" method="post">
							
					<div class="form-group">
						<label for="input1">제목</label> 
						<input  type="text" name="board_title" class="form-control" >
					</div>
		
					<div class="form-group">
						<label for="textarea1">내용</label>
						<textarea class="form-control" id="textarea1" name="board_content"
									rows="3"></textarea>
					</div>
					
					<div class="form-group">
						<label for="input2">작성자</label> 
						<input readonly name="board_id" type="text" class="form-control" value="<sec:authentication property='principal.username'/>"  >
					</div>
					<input type="hidden" name="board_day" value="${board_Criteria.day }">
					<input type="hidden" name="pageNum" value="${board_Criteria.pageNum }">
					<input type="hidden" name="amount" value="${board_Criteria.amount }">
					<input type="hidden" name="type" value="${board_Criteria.type }">
					<input type="hidden" name="keyword" value="${board_Criteria.keyword }">
					<input type="hidden" name="day" value="${board_Criteria.day }">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					
					<input type="submit" />
					
					
					
				</form>
				
				
				</div>
				
			</div>
			
			
		<div class="btn-group">
	  		<button data-oper="register" type="button" class="btn btn-secondary">작성하기</button>
	  		<button data-oper="cancel" type="button" class="btn btn-light">취소</button>
		</div>
</div>








</body>
</html>