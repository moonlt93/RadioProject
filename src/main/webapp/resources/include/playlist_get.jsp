<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link href="${root }/resources/css/all.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${root }/resources/js/reply.js"></script>
<script>
	var root = '${root}'; // contextRoot를 root라는 이름으로 저장.
	var bno = $
	{
		board.bno
	}; // board안의 bno를 저장.
</script>
<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
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

.playGet_wrapper {
	
	margin: 30px 40px 10px 40px; 
} 

.title_content {
	border-bottom: 1px silver solid;
	margin-bottom: 10px;
}
.t_fmt {
	background-color: lightslategrey; 
	display: flex;
	height: 50px;
	align-items: center;
	border-radius: 0px;
	border-bottom: 1px solid silver;
	padding: 0px 10px 0px 10px;
}

.pre_content pre{
	text-align: center;
}

.a_root a {
	background-color: lightgrey;
	color: grey;
	margin-right: 5px;
	padding: 2px 4px 2px 4px;
	border-radius: 3px;
	height: 27px;
}

.a_root a:hover {
	text-decoration: none;
	color: grey;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<div class="header_title" style="border-radius: 0px;">
<h6>선곡표</h6>
</div>

	<div class="playGet_wrapper">
	
		<div class="title_content" style="border-radius: 0px;">
			<div class="t_fmt" style="display: flex; justify-content: space-between;">
				<div class="date_div">
					<span style="color: white; font-weight: bold; font-size: 18px;"><c:out value="${board.title }" /></span>			
				</div>
				<div>
					<span class="fmt_date"><fmt:formatDate pattern="yyyy-MM-dd" value= "${board.regdate }"/></span>
				</div>
			</div>
				
			<div class="pre_content">
				<pre>
					<c:out value="${board.content }" />
				</pre>
			</div>

		
		</div>   
	<div class="a_root" style="display: flex; justify-content:flex-end;">
		<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
		
		<c:url value="/playlist/modify" var="modifyLink">
		<c:param value="${board.bno}" name="bno"></c:param>
		<c:param value="${cri.pageNum}" name="pageNum"></c:param>
		<c:param value="${cri.amount}" name="amount"></c:param>
		<c:param value="${cri.type}" name="type"></c:param>
		<c:param value="${cri.keyword}" name="keyword"></c:param>
		</c:url>				 		  	
			<a href="${modifyLink}" class="">수정</a>
		</sec:authorize>  			
			<a href="${root}/playlist/play" style="background-color:lightslategrey
			; color: white;">목록</a> <br/>
	</div>
	

	
</div>
</div>
	
</body>
</html>