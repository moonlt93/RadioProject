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
var pictroomStaticPath = '${picRoomStaticPath}';
$(document).ready(function() {
	$("#pictureRoom-modify-btn1").hide();
	// $("#pictureRoom-delete-btn1").hide();
	$("#pictureRoom-file1").hide();
	
	var picRoomModal = $("#pictureRoom-modal1");
	$("#pictureRoom-modify-btn1").click(function() {
		picRoomModal.find(".modal-title").text("글 수정");
		picRoomModal.find(".modal-body").
		text("수정하시겠습니까?");
		$("#pictureRoom-modal-confirm-btn1").show();
		$("#pictureRoom-modal-delete-btn2").hide();
		picRoomModal.modal("show");
	});
	
	$("#pictureRoom-delete-btn1").click(function() {
		picRoomModal.find(".modal-title").text("글 삭제");
		picRoomModal.find(".modal-body").text("삭제하시겠습니까?");
		$("#pictureRoom-modal-confirm-btn1").hide();
		$("#pictureRoom-modal-delete-btn2").show();
		picRoomModal.modal("show");
	});
	
	$("#pictureRoom-modify-btn2").click(function() {
		$("#pictureRoom-modify-btn1").show();
		$("#pictureRoom-delete-btn1").show();
		$("#pictureRoom-file1").show();
		$(this).hide();
		$("#pictureRoom-form1").find("input, textarea").removeAttr("readonly");		
	});
	
	$("#pictureRoom-modal-confirm-btn1").click(ajaxModify);
	$("#pictureRoom-modal-delete-btn2").click(ajaxDelete);
	
	function ajaxDelete() {
		$("#pictureRoom-modal-delete-btn2")
		 .attr("disabled", "disabled")
		 .html('<i class="fas fa-spinner fa-spin"></i>');
		$("#modal2-success-footer").hide();
		$("#modal2-fail-footer").hide();
		var formData = new FormData($("#pictureRoom-form1")[0]);
		$.ajax({
			url: appRoot + '/picroom/delete',
			type: 'POST',
			data: formData,
	        cache: false,
	        contentType: false,
	        enctype: 'multipart/form-data',
	        processData: false,
	        beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            }
		 })
		 .done(function() {
			console.log("성공"); 
			$("#pictureRoom-modal-body3").text("삭제 성공하였습니다.");
			$("#pictureRoom-modal3").modal("show");
			$("#pictureRoom-submit-btn1").removeAttr("disabled");
			$("#modal2-success-footer").show();
		 })
		 .fail(function() {
			console.log("실패");
			$("#pictureRoom-modal-body3").text("삭제 실패하였습니다.");
			$("#pictureRoom-modal3").modal("show");
			$("#modal2-fail-footer").show();
		 });
	}
	
	function ajaxModify() {
		$("#pictureRoom-modal-confirm-btn1")
		 .attr("disabled", "disabled")
		 .html('<i class="fas fa-spinner fa-spin"></i>');
		$("#modal2-success-footer").hide();
		$("#modal2-fail-footer").hide();
		var formData = new FormData($("#pictureRoom-form1")[0]);
		$.ajax({
			url: appRoot + '/picroom/modify',
			type: 'POST',
			data: formData,
	        cache: false,
	        contentType: false,
	        enctype: 'multipart/form-data',
	        processData: false,
	        beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            }
		 })
		 .done(function() {
			console.log("성공"); 
			$("#pictureRoom-modal-body2").text("수정 성공하였습니다.");
			$("#pictureRoom-modal2").modal("show");
			$("#pictureRoom-submit-btn1").removeAttr("disabled");
			$("#modal2-success-footer").show();
		 })
		 .fail(function() {
			console.log("실패");
			$("#pictureRoom-modal-body2").text("수정 실패하였습니다.");
			$("#pictureRoom-modal2").modal("show");
			$("#modal2-fail-footer").show();
		 });
	}
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
	
	.fmt {
		padding: 0px 10px 0px 10px;
		height: 50px;
		background-color: lightslategrey;
		margin-top: 20px;
		margin-bottom: 20px;
		align-items: center; 
	}
	
	.fmt input {		
		border-radius: 5px 5px;
		outline: none;
		border: none;
		background-color: lightslategrey;
	}
	.title_input input {
		color: white;
		font-weight: bold;
	}
	.pic {
		margin-bottom: 20px;
	}
	.con textarea {
		border: none;
		outline: none;
		background-color: snow;
		text-align: center;
		resize: none;
	}
	.sub_btn {
		background-color: lightgrey;
		color: grey;
		padding: 2px 4px 2px 4px;
		border-radius: 3px;
		height: 27px;
		margin-right: 5px;
		margin-bottom: 10px;
	}
	
	.sub_btn:hover {
		color: grey;
	}
	
	.list_btn {
		background-color: lightslategrey;
		padding: 2px 4px 2px 4px;
		border-radius: 3px; 
		height: 27px;
		color: white;
	}
	
	.list_btn:hover {
		text-decoration: none;
		color: white;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="header_title" style="border-radius: 0px;">
<h6>사진방</h6>
</div>
<div class="container-fluid">
<form id="pictureRoom-form1" action="${root }/picroom/register" method="post" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/> 
   
   <div class="fmt" style="display: flex; justify-content: space-between;">
   		<div class="title_input">
    		<input readonly name="title" value="${vo.title }" type="text">
   		</div>
   		<div>
    		<fmt:formatDate pattern="yyyy-MM-dd" 
              value="${vo.regdate }" />
   		</div>
   </div>
 	
  <div class="pic" style="justify-content: center;">
	<img class="img-fluid" src="${picRoomStaticPath}${vo.fileName}" />
  </div>
 
  <div class="con">
    <textarea readonly name="content" id="pictureRoom-textarea1" rows="5"><c:out value="${vo.content }" /></textarea>
  </div>
  
   
  
  <div id="pictureRoom-file1" class="form-group">
    <input type="file" name="file" accept="image/*" class="form-control-file" id="pictureRoom-file1">
  </div>
  <input type="hidden" name="memberId" value="${vo.memberId }"/>
  <input type="hidden" name="id" value="${vo.id }" />
  
	  
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	  <button id="pictureRoom-modify-btn1" type="button" class="sub_btn">수정</button>
	  <button id="pictureRoom-modify-btn2" type="button" class="sub_btn">수정</button>
	  <button id="pictureRoom-delete-btn1" type="button" class="sub_btn">삭제</button>
	</sec:authorize>
	
	<div style="float: right; margin-bottom: 10px;">
 	 <a href="${root }/picroom/list" class="list_btn">목록</a>
	</div>
  
</form>
</div>

</body>
</html>