<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	var root = '${root}';
</script>

<script type="text/javascript">
	$(document).ready(function(e){
	
		var registerForm = $('#registerForm');
		var todoForm = $('#todoForm');
		
		$('button[data-oper=register]').click(function(e){
			if(!registerForm.find("[name='video_title']").val()){
				alert("제목을 입력하세요");
				return false;
			}
			
			if(!registerForm.find("[name='thumbnail']").val()){
				alert("썸네일을 선택하세요");
				return false;
			}
			
			if(!registerForm.find("[name='vod']").val()){
				alert("영상을 선택하세요");
				return false;
			}
			
			if(!registerForm.find("[name='video_date']").val()){
				alert("방송일을 선택하세요");
				return false;
			}
			console.log("submit before");
			registerForm.submit();
		});
		
		$('button[data-oper=cancel]').click(function(e){
			todoForm.submit();
		});
});
</script>


<style>
.video-register {
	margin: 3%;
	padding: 3%;
}

.header_title { 
		border-bottom: 1px silver solid; 
		margin-top: 10px;	
		padding: 5px 0px 0px 0px;
		height: 30px;
	} 
.header_title h6 {
		margin-left: 10px;	 
	} 
.form-floating :placeholder-shown{
}

.tit_content {
		padding: 40px 100px 40px 100px;  
		background-color: white;
		margin-bottom: 10px;
		margin-left: 10px;
		margin-right: 10px;
		border-radius: 5px 5px;
}

.tit_content input {
	margin-bottom: 20px;
	border: 1px solid grey;
}

.reg_btn {
	background-color: lightgrey;
	color: grey;
	padding: 2px 4px 2px 4px;
	border-radius: 3px;
	height: 27px;
	margin-right: 5px;
}
.tit_content {
		padding: 0px 100px 20px 100px;  
		background-color: rgb(241, 241, 241);
		margin-bottom: 10px;
		margin-left: 20px;
		margin-right: 20px;
		border-radius: 5px 5px;
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
	
	<div class="header_title" style="border-radius: 0px;">
		<h6>보이는 라디오</h6>
	</div>
		
<div class="video-register">
	
		<form id="registerForm" action="${root }/video/video_register" 
	               enctype="multipart/form-data" method="post">
		
		<div class="tit_content">
			<div class="tit_header">글 등록</div>
		
			<span>제목</span>
			<input id="input1" type="text" name="video_title" class="form-control"  placeholder="제목을 입력하세요.">
		
			<span>방송일</span>
			<input id="input2" type="date" name="video_date" class="form-control"  value="2020-01-01"
      			 min="2021-01-01" max="2022-12-31">
      	
      		<div class="file_content">
      		<span>썸네일</span>
			<input name="thumbnail" type="file" accept="image/*" class="form-control" 
					placeholder="썸네일" id="input3" >
		
			<span>영상</span>
			<input name="vod" type="file" accept="video/*" class="form-control" 
					placeholder="영상" id="input4" >
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
      		</div>
		
	
			<input type="hidden" name="video_thumbnail" value="">
			<input type="hidden" name="video_vod" value="">

			<input type="submit" hidden/>
	
		</div>
	</form>



	
	<div class="btn-group" style="display: flex; justify-content: space-between;">
		<button data-oper="register" type="button" class="reg_btn">작성하기</button>
	  	<button data-oper="cancel" type="button" class="reg_btn">취소</button>
	</div>
	
	<div class="d-none">
		<form id="todoForm" action="${root }/video/video_list">
			<input type="hidden" name="pageNum" value="${video_Criteria.pageNum }">
			<input type="hidden" name="amount" value="${video_Criteria.amount }">
			
		</form>
	</div>
	
</div>

</body>
</html>
