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
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
	.main_header ul {
		list-style: none;
		display: flex;
		background-color: black;
		height: 55px;
		justify-content: flex-end;
		align-items: center; 
	}
	
	.nav_list {
		text-decoration: none;
		color: white; 
				
	}
	
	.nav_list:hover {
		text-decoration: none;
		color: white; 
	} 
	
	.nav_btn {
		padding: 0px 2px 0px 2px;
		background-color: black;
		outline: none;
		border: none;
		text-decoration: none;
	}
	
	.nav_btn:hover {
		outline: none;
		border: none;
		text-decoration: none;
	}
</style>

<title>Insert title here</title>
</head>
<body>
	<div class="main_header"> 
		<ul>
	     <sec:authorize access="isAnonymous()">
   			<li class="">
   				<a href="${root }/member/register" class="nav_list">회원가입</a>
   			</li>
   		</sec:authorize>
	      <sec:authorize access="isAnonymous()">
		      <li class="">
		        <a class="nav_list" href="${root}/customLogin">로그인</a>
		      </li>
	      </sec:authorize>
	      
	      <sec:authorize access="isAuthenticated()">
	      <li>
	      	<form action="${root}/member/mypage">      
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">	
		  		<button type="submit" class="nav_btn" style="margin-right: 20px;">마이페이지</button>
	      	</form>
	      </li>
		  <li class="">
	      	<form action="${root}/logout" method="post">
		        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		        <button type="submit" class="nav_btn">로그아웃</button>
	      	</form>
		   </li>
	      </sec:authorize>
   		</ul>
	</div>

</body>
</html>