<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<title>Insert title here</title>
<style type="text/css">
	body {
		background-image: url("${root}/resources/pic/Lovepik_com lake boat night backgroun.jpg");
		background-size:contain;
	}
	
	.nav-menu {
   	   display: flex;
   	   text-decoration: none;
   	   color: white;   	  
       padding: 10px 30px 10px 30px;
   }
   
   .nav-menu:hover {
   	   text-decoration: none;
   }
</style>
</head>
<body>
<div class="header2">
        <jsp:include page="/resources/include/main_header.jsp" />
    </div>
    <div class="wrapper">  

        <div class="header">
            <h1><a class="moon" href="${root }/">Moon's radio</a></h1>
        </div> 

        <div class="nav">
            <jsp:include page="/resources/include/main_nav.jsp" />                
        </div>

        <div class="weekday">
            <jsp:include page="/resources/include/main_dayintro.jsp" />
        </div>  
        					

       <div class="main" style="padding: 100px">
			<h1>비밀번호 재설정</h1><br><br>
			<form action="/member/resetpw" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
						<div class="form-group">
						  <input readonly type="hidden"  name="id" type="text" class="form-control" value="${id }" id="input-id" style="width: 300px;">
						</div>				
						<div class="form-group">
						    <label for="input-pw">비밀번호</label>
						    <input name="password" type="password" class="form-control"  id="input-pw" style="width: 300px;">
						</div>				
						<div class="form-group">
						    <label for="input-pwch">비밀번호 확인</label>
						   <input name="ch_password" type="password" class="form-control"  id="input-pwch" style="width: 300px;">
						    <br>
						    ${unEqual }
							
							
						</div>				

				<button id="loginBtn" type="submit" style="margin-top: 20px;">변경</button>
			</form>
       </div>
       
        <div class="empty1">

        </div>
        
    </div>
    
    <div class="footer">
        <jsp:include page="/resources/include/main_footer.jsp" />
    </div>

</body>
</html>