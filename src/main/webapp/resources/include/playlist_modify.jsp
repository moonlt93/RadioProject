<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<script>
var bno = $
{
	board.bno
};

</script>
<style type="text/css">
	body{
		padding: 0px;
		margin: 0px;
	}
	
	.mod_wrapper {
		margin: 30px 40px 10px 40px;
	}
	
	.title_input {
		height: 40px;
		margin-bottom: 20px;
	}
	.title_input input {
		outline: none;
		border: 1px silver solid;
		border-radius: 5px 5px; 
		padding-left: 10px;
	}
	
	.content_txt {
		resize: none;
		outline: none;
		border: 1px silver solid;
		margin-bottom: 10px;
		border-radius: 5px 5px;
		padding-left: 10px;
		padding-top: 10px;		
	}
	
	.writer_input {
		margin: 10px;
	}
	
	.writer_input input {
		outline: none;
		border: none;
		background-color: white;
	}
	.mod_del {
		background-color: lightgrey;
		color: grey;
		padding: 2px 4px 2px 4px;
		border-radius: 3px;
		height: 27px;
		margin-right: 5px;
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
	.con {
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
<div class="header_title">
<h6>선곡표</h6>
</div>

<div class="mod_wrapper">
	<div class="">
		<div class="">
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">		

				<form id="modify-form" method="post" action="${root }/playlist/modify">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				
			<div class="con">				
					<input hidden name="bno" type="text" readonly value="${board.bno }" />
					<div class="tit_header">글 수정</div>
					<div class="title_input">
					    <input name="title" type="text"
						class="" value='<c:out value="${board.title }" />' >
					</div>


					<div class="content_input">						
						<textarea wrap="hard" name="content" class="content_txt" cols="10" rows="10">
						<c:out value="${board.content }" />
						</textarea>
					</div>

					<div class="writer_input">
					 <input name="writer" type="text"
							hidden readonly value='<c:out value="${board.writer }" />'>
					</div>
			</div>	
			
					<input type="hidden" value="${cri.pageNum }" name="pageNum" />
					<input type="hidden" value="${cri.amount }" name="amount" />
					<input type="hidden" value="${cri.keyword }" name="keyword" />
					<input type="hidden" value="${cri.type }" name="type" />
					
			<sec:authentication property="principal" var="pinfo"/>
	  	
			  	<sec:authorize access="isAuthenticated()">
			  		<c:if test="${pinfo.username eq board.writer }">
					  	<button type="submit" class="mod_del">수정</button>
					  	<button id="remove-btn" type="submit" class="mod_del">삭제</button>
			  		</c:if>
			  	</sec:authorize>
			</form>
			
			</sec:authorize>  	
			</div>
		</div>
	</div>
<script>
$(document).ready(function(){
	$("#remove-btn").click(function(e) {
		e.preventDefault();
		
		$("#modify-form").attr("action", root + "/playlist/remove");
		
		$("#modify-form").submit();
	});
});
</script>
</body>
</html>




