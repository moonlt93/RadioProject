<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		
		var modifyForm = $("#modifyForm");
		
		$("button[data-oper='modify']").click(function(e){
			
			
			modifyForm.submit();
		});

		
		$("button[data-oper='cancel']").click(function(e){
			modifyForm.append("<input type='hidden' name='board_bno' value='"+${boardVO.board_bno}+"'>");
			modifyForm.attr("method", "get");
			modifyForm.attr("action", root + "/board/read");
			
			modifyForm.submit();
		});
		
		
	});

</script>

<title>Insert title here</title>
</head>
<body>
<div class="container-sm">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<h1>게시물 수정하기</h1>
			</div>
		</div>	
			
		<div class="row justify-content-center">
			<div class="col-lg-12">	
		
				<form id="modifyForm" action="${root }/board/modify" method="post">
					<div class="form-group">
								<label for="input3">번호</label>
								<input class="form-control" name="board_bno" type="text" id="input3" readonly value="${boardVO.board_bno }" />
					</div>
							
					<div class="form-group">
						<label for="input1">제목</label> <input value='<c:out value="${boardVO.board_title}" />' type="text"
									name="board_title" class="form-control" id="input1" >
					</div>
		
					<div class="form-group">
							<label for="textarea1">내용</label>
							<textarea class="form-control" id="textarea1" name="board_content"
									rows="3"><c:out value="${boardVO.board_content}" /></textarea>
					</div>
					
					<div class="form-group">
						<label for="input2">작성자</label> <input name="board_id" type="text"
							class="form-control" readonly value='<c:out value="${boardVO.board_id }" />' id="input2" placeholder="이름을 입력하세요.">
					</div>
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
			
			
		<div class="btn-group btn-group-lg">
	  		<button data-oper="modify" type="button" class="btn btn-secondary">수정하기</button>
	  		<button data-oper="cancel" type="button" class="btn btn-light">취소</button>
		</div>
</div>







</body>
</html>