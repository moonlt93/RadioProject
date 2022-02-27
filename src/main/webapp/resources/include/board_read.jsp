<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var root = '${root}'
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
<script type="text/javascript" src="${root }/resources/js/board_reply.js"></script>


<script type="text/javascript">


	$(document).ready(function(e){
		
		var operForm = $("#operForm");
		$("button[data-oper='list']").click(function(e){
			
			operForm.attr("action", root + "/board/list");
			
			operForm.submit();
		});

		
		$("button[data-oper='modify']").click(function(e){
			operForm.append("<input type='hidden' name='board_bno' value='"+${boardVO.board_bno}+"'>");
			operForm.attr("action", root + "/board/modify");
			
			operForm.submit();
		});
		
		
		$("button[data-oper='delete']").click(function(e){
			if(parent.flag) { // 댓글이 있으면
				alert("댓글이 존재하는 게시글은 삭제할 수 없습니다.\n관리자에게 문의하세요.");
				return;	
			}
			
			operForm.append("<input type='hidden' name='board_bno' value='"+${boardVO.board_bno}+"'>");
			operForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token }'>");
		
			operForm.attr("method", "post");
			operForm.attr("action", root + "/board/delete");
			
			operForm.submit();
		});
		
		
		
		
		
		
		
	});
</script>
<style type="text/css">
	body {
		height: 100%; 
	}
	.board_read { 	
		width: 100%;  
		margin: 50px 0px 20px 0px;
		padding: 0px 50px 0px 50px;
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
	
	.title {
		color: black; 
		font-weight: bold; 
		font-size: 30px;
		margin-bottom: 10px;
	} 
	
	.tit_cnt {
		height: 50px;
		background-color: rgb(241, 241, 241);
		align-items: center;
		padding: 0px 10px 0px 10px;
		border-top: 1px solid silver;
	}
	 
	.pre_content pre{
		text-align: center;
	}
	
	.tit_con {
		border-bottom: 1px solid silver; 
		margin-bottom: 10px;
		height: inherit; 
	}
	.pre_content {
		margin-top: 10px;
	}
	
	.user_btn {
		background-color: lightgrey;
		color: grey; 
		padding: 2px 4px 2px 4px;
		border-radius: 3px;
		height: 27px;
		margin-right: 5px;
		margin-bottom: 10px;
	}
	.user_btn:hover {
		color: grey;
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
	.admin_btn:hover {
		color: grey; 
	}
	
	.media-body {
		background-color: snow;
		margin-top: 10px;
	}
	.reply_txt {
		border-top: 3px solid white;
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
	
	.reply_btn {
		background-color: snow;
		border: 1px solid lightslategrey; 
		border-radius: 5px 5px;
		color: lightslategrey; 
		weight: 30px;
		height: 35px; 
		padding: 0px 5px 0px 5px;	 
	}
	
	.reply_list {
		margin-top: 50px;
	}
</style> 
<title>Insert title here</title>
</head>
<body>

<div> 

	<div class="header_title" style="border-radius: 0px;">
		<h6>요일코너</h6>
	</div>
	
<div class="board_read">	
	<strong class="title"><c:out value="${boardVO.board_title}" /></strong> 
			
	<div class="tit_con" style="border-radius: 0px;"> 
		
		<div> 
			<div class="tit_cnt" >
				<div class="" style="display: flex; justify-content: space-between;">
					<span><i style="color: black;" class="far fa-user"></i><c:out value="${boardVO.board_id }" /></span>
					<span><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value= "${boardVO.board_regdate }"/></span>
				</div>			 
				<div class="bno_tit">
					<input hidden type="text" readonly value="${boardVO.board_bno }" />
				</div>
				
				<div class="read_cnt" style="display: flex; justify-content: space-between;" > 
					<div></div>			 	
					<span><i style="color: black;" class="far fa-laugh"></i><c:out value="${boardVO.board_read_cnt }" /></span>
				</div>
			   
			</div>

			<div class="pre_content">
				<pre>
					<c:out value="${boardVO.board_content}" />
				</pre>
			</div>
		</div>

			
			
		</div>
		
		
			
		
		
		<c:choose>		
			<c:when test="${boardVO.board_bno eq 1 }">
			<div class="admin_group" style="display:inline-flex; justify-content: space-between;">
				<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')" >
					<div style="display:inherit;">
  						<button data-oper="modify" type="button" class="admin_btn">수정</button>
  						<button data-oper="delete" type="button" class="admin_btn">삭제</button>
					</div>
				</sec:authorize>
					<div >
						<button data-oper="list" type="button" class="admin_btn" style="background-color: lightslategrey; color: white;">목록</button>
					</div>
			</div>
			</c:when>
			
			<c:otherwise>
				<div class="user_group" style="display:inline-flex; justify-content: space-between;"> 	
					<div style="display:inherit;"> 
  						<button data-oper="modify" type="button" class="user_btn">수정</button>			
  						<button data-oper="delete" type="button" class="user_btn">삭제</button>					
					</div>	
					<div>
  						<button data-oper="list" type="button" class="user_btn" style="background-color: lightslategrey; color: white;">목록</button>
					</div>
				
				</div>				
			</c:otherwise>
		</c:choose>		

<!-- 댓글목록 -->

		
		
				<div class="reply_list">
				
					<div style="display: flex; justify-content: space-between">
						<span>댓글</span>
						<sec:authorize access="isAuthenticated()">
						<button class="reply_btn" id="new-reply-btn">댓글 쓰기</button>
						</sec:authorize>
					</div>
					 
					<div class="">
						<ul class="list-unstyled" id="reply-ul">
							
						</ul>
						
					</div>
				</div>
			
	</div>
</div>




<div class="d-none">
	<form id="operForm" action="/board/list" method="get">
		<input type="hidden" name="pageNum" value="${board_Criteria.pageNum }">
		<input type="hidden" name="amount" value="${board_Criteria.amount }">
		<input type="hidden" name="type" value="${board_Criteria.type }">
		<input type="hidden" name="keyword" value="${board_Criteria.keyword }">
		<input type="hidden" name="day" value="${board_Criteria.day }">
		
		<input type="submit"/>
	</form>

</div>



</body>
</html>