<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<script>
var root = '${root}';
var bno = ${board.bno};
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
<script src="${root }/resources/js/board_replay.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	var operForm = $("#oper-Form");
	$("button[data-oper='delete']").click(function(e){
		if(parent.flag) { // 댓글이 있으면
			alert("댓글이 존재하는 게시글은 삭제할 수 없습니다.");  
			return;	
		}
	
		operForm.append("<input type='hidden' name='bno' value='"+${board.bno}+"'>");
		operForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token }'>");

		operForm.attr("method", "post");
		operForm.attr("action", root + "/replay/remove");
	
		operForm.submit();
	});
	
	

});
</script>
<style type="text/css">
	body {
		height: 100%; 
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
	
	.replay_get { 
		width: 100%;  
		margin: 50px 0px 20px 0px;
		padding: 0px 50px 0px 50px;
	}
	
	.tit_con {
		border-bottom: 1px solid silver; 
		margin-bottom: 10px;
		height: 300px; 
	}
	
	.t_fmt {
		height: 50px;
		background-color: lightslategrey;
		align-items: center;
		padding: 0px 10px 0px 10px;
		border-top: 1px solid black;
	}
	
	.mod_div {
		margin-top: 10px;
	}
	
	audio { 
		width: 100%;  
		
	}
	
	.reply_btn {
		background-color: snow;
		border: 1px solid lightslategrey; 
		border-radius: 5px 5px;
		color: lightslategrey; 
		weight: 30px;
		height: 35px; 
		padding: 0px 5px 0px 5px;	 
	} 
	
	.mod_btn {
		background-color: lightgrey;
		color: grey;
		margin-right: 5px;
		padding: 2px 4px 2px 4px;
		border-radius: 3px;
		height: 27px;
		outline: none;
	}
	.mod_btn:hover {
		color: grey;
		text-decoration: none;
		outline: none;
	}

	.media-body {
		background-color: snow;
		margin-top: 10px;
	}
	.reply_txt {
		border-top: 2px solid white;
		width: 820px; 
	}
	
	.reply_body {
		margin-top: 10px;
		height: 100%;
		background-color: snow;
		font-size: 15px;
	}
	.media-body .re {
		font-weight: bold;
		text-size: 16px;
	}
	
	.reply_list {
		margin-top: 50px;
	}
</style>
<title>Insert title here</title>
</head>
<body>

<div>
	<div class="header_title">
		<h6>다시듣기</h6>
	</div>

<div class="">
	<div class="replay_get"> 
		<div class="tit_con" style="border-radius: 0px;">
				<div>
					<div class="t_fmt" style="display: flex; justify-content: space-between;">
						<div class="tit">
							<span style="color: white; font-weight: bold; font-size: 18px;"><c:out value="${board.title }" /></span>			
						</div>
						<div>
							<span class="fmt_date"><fmt:formatDate pattern="yyyy-MM-dd" value= "${board.regdate }"/></span>
						</div>
					</div>
					
					<div class="audio_div">
						 <%-- <img alt="" class="img-fluid" src="${staticPath}${board.filename }">--%>						
						 <audio src="${ReplayStaticPath}${board.filename }" width='600' controls autoplay></audio>
		
					</div>
				</div>
		</div>
				
					
					<div class="mod_div" style="display: flex; justify-content: flex-end;">
					<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
					<button data-oper="delete" type="button" class="mod_btn">삭제</button>	  
							<c:url value="/replay/modify" var="modifyLink">
							<c:param name="bno" value="${board.bno }"></c:param>
							<c:param name="pageNum" value="${cri.pageNum }"></c:param>
							<c:param name="amount" value="${cri.amount }"></c:param>
							<c:param name="type" value="${cri.type }" ></c:param>
							<c:param name="keyword" value="${cri.keyword }" ></c:param>
							</c:url>
						<div>
							<a href="${modifyLink }" class="mod_btn">
								수정
							</a>
						</div>
						
						</sec:authorize>
					</div>
					
<div class="d-none">
	<form id="oper-Form" method="get">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<input type="hidden" name="pageNum" value="${cri.pageNum }">
		<input type="hidden" name="amount" value="${cri.amount }">
		<input type="hidden" name="type" value="${cri.type }">
		<input type="hidden" name="keyword" value="${cri.keyword }">	
		<input type="submit"/>
	</form>

</div>
				

	<!-- 댓글 목록 container -->			
				<div class="reply_list">
					<div class="list_button" style="display: flex; justify-content: space-between;">
						<span>댓글</span>			
						<button class="reply_btn" id="new-reply-button">댓글 쓰기</button> 												
					</div>

				 </div>
							
			
		 
	
		</div>
	</div>
</div>


<script>
</body>
</html>




