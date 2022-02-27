<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${root }/resources/css/all.min.css" rel="stylesheet">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${root }/resources/css/all.min.css" />
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
var appRoot = '${root}';

$(document).ready(function() {
	$("#pictureRoom-submit-btn1").click(function(e) {
		e.preventDefault();
		$(this)
		 .attr("disabled", "disabled")
		 .html('<i class="fas fa-spinner fa-spin"></i>');
		
		var formData = new FormData($("#pictureRoom-form1")[0]);
		
		$.ajax({
			url: appRoot + '/picroom/register',
			type: 'POST',
			data: formData,
	        cache: false,
	        contentType: false,
	        enctype: 'multipart/form-data',
	        processData: false,
	        //headers: {${_csrf.headerName}: '${_csrf.token}'}
	        beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            } 
		 })
		 .done(function(data) {
			console.log("성공");
			$("#pictureRoomToGetLink1").attr("href", $("#pictureRoomToGetLink1").attr("href") + data);
			$("#pictureRoom-modal-body1").text("새 글을 등록하였습니다.");
			$("#pictureRoom-modal1").modal("show");
			$("#pictureRoom-submit-btn1").removeAttr("disabled");
		 })
		 .fail(function() {
			console.log("실패");
			$("#pictureRoom-modal-body1").text("등록 실패하였습니다.");
			$("#pictureRoom-modal1").modal("show");
		 });
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
	
	.pic_wrapper {
		margin: 30px 40px 10px 40px;
		
	}
	.pic_subWrp {
		padding: 30px 200px 0px 200px;
		border: 1px solid white;
		margin: 10px 200px 10px 200px;
		background-color: white; 
	}
	
	.tit_input {
		height: 40px; 
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
	
	.reg_btn:hover{
		color: grey;
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
<h6>사진방</h6>
</div>
<div class="pic_wrapper">
	
		<form id="pictureRoom-form1" action="${root }/picroom/register" method="post" enctype="multipart/form-data">
 		 <%-- <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/> --%> 
 	<div class="tit_content">
 		 <div class="tit_header">사진 등록</div>
 		 <div class="tit_input">
   			 <input name="title" type="text" placeholder="제목을 입력하세요.">
 		 </div>  
 		  
 		 <div class="con_input"> 	
    		 <textarea wrap="hard" cols="10" rows="10" name="content" placeholder="내용을 입력하세요."></textarea>
  		</div> 
   		<div class="">  
    		 <input type="file" name="file" accept="image/*">
			<input type="hidden" name="memberId"  value='<sec:authentication property="principal.username"/>' />
   		</div> 			 
 	</div> 
  			 <button id="pictureRoom-submit-btn1" type="submit" class="reg_btn">등록</button>
		</form>
	
</div>


</body>
</html>