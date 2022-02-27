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
	
	$(document).ready(function(e){
		var root = '${root}';
		var todoForm = $('#todoForm');
		
		
		$('button[data-oper=modify]').click(function(e){
			todoForm.append('<input type="hidden" name="video_bno" value="${videoVO.video_bno }">');
			todoForm.append("<input type='hidden' name='video_title' value='${videoVO.video_title}'>");
			todoForm.append("<input type=text name='video_date' value='${videoVO.video_date}'>");
			todoForm.append("<input type=text name='video_thumbnail' value='${videoVO.video_thumbnail}'>");
			todoForm.append("<input type=text name='video_vod' value='${videoVO.video_vod}'>");
			
			todoForm.attr("action", root+'/video/video_modify');
			
			todoForm.submit();
		});
		
		$('button[data-oper=list]').click(function(e){
			
			todoForm.submit();
		});
		
		$('button[data-oper=delete]').click(function(e){
			
			todoForm.append("<input type='hidden' name='video_bno' value='${videoVO.video_bno}'>");
			todoForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>");
			
			todoForm.attr("method", "post");
			todoForm.attr("action", root+"/video/video_delete");
			todoForm.submit();
		});
	});
</script>
<title>Insert title here</title>
<style type=text/css>
.video-read {
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
	
	.video {
		margin-top: 20px;
		display: flex;
		justify-content: center;
		margin-bottom: 20px;
	}
	
	.admin_btn {
		background-color: lightgrey;
		color: grey;
		padding: 2px 4px 2px 4px;
		border-radius: 3px;
		height: 27px;
		margin-right: 5px;
		margin-bottom: 10px;
	}
</style>
</head>
<body>




<div class=" ">
		<div class="header_title" style="border-radius: 0px;">
			<h6>보이는 라디오</h6>
		</div>
		
	<div class="video-read">	 
		<div>
		<div style="border-bottom: 1px solid grey; border-radius: 0px;"> 
			<div style="border-top: 1px grey solid;background-color: lightslategrey; height: 50px; padding: 0px 10px 0px 10px;">
				<div class="read_cnt" style="display: flex; justify-content: space-between;align-items:center;" > 		 	
				<strong class="title" style="color: white; font-weight: bold;"><c:out value='${videoVO.video_title }'/></strong>
					<span><i style="color: black;" class="far fa-laugh"></i><c:out value="${videoVO.video_view_cnt }" /></span>
				</div>
		</div>
			
						<div class="video">
							<video width="500" height="300" controls autoplay>
  							<source src="${BoardStaticPath}${videoVO.video_vod}" >
  							이 브라우저는 재생할 수 없습니다.
							</video>
						</div>
				
		</div>
			
			<div class="btn_broup" style="display:inline-flex; justify-content: space-between; margin-top: 20px;">
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
			<div style="display:inherit;">
				<button type="button" data-oper="modify" class="admin_btn">수정</button>
				<button type="button" data-oper="delete" class="admin_btn">삭제</button>
			</div>
			</sec:authorize> 
			<div>
				<button type="button" data-oper="list" class="admin_btn" style="background-color: lightslategrey; color: white;">목록</button>
			</div>
		</div>
		
		</div>
			</div>
		</div>
											

	
	

	
	
	<div class="d-none">
		<form id="todoForm" action="${root }/video/video_list">
			<input type="hidden" name="pageNum" value="${video_Criteria.pageNum }">
			<input type="hidden" name="amount" value="${video_Criteria.amount }">
			
			<input type="submit"/>
		</form>
	</div>

	
	


	
	
			
			





</body>
</html>