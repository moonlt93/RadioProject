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
   .main {
   		position: relative; 
   }
   .findId {
   		padding: 60px 40px;
		background: #f1f1f1;
		height: 400px;    
		width: 360px;	 
		margin: 60px 0px 0px 0px;  
		position: absolute;  
		left: 30%; 
   }
   
   .email_input {
   	margin-top: 20px; 
   } 
   
   .email_input input {
   		height: 40px;
   		border-radius: 5px 5px;
   		outline: none;
   		border: 1px solid grey; 
   		margin-bottom: 20px;
   }
   .loginBtn {
   		width: 100%;
		height: 50px;
		border: none;
		color: #fff;
		outline: none;
		background-color: lightslategrey;
		border-radius: 5px 5px;   
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
        					

       <div class="main">
       
       		<div class="findId">
       		
			
				<form action="${root }/member/findid" method="post">
						<div class="form_header">
						<h3>아이디 찾기</h3>
						<p>회원가입시 사용한 <br> 
						이메일을 입력해주세요.</p>
						</div>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
					<div class="email_input">
				   	 	<label for="input-email">이메일</label>
				    	<input name="email" type="email"id="input-email">
					</div>		
				
				<button class="loginBtn" type="submit" >아이디 찾기</button>
				</form>
       		</div>
       </div>
       
        <div class="empty1">

        </div>
        
    </div>
    
    <div class="footer">
        <jsp:include page="/resources/include/main_footer.jsp" />
    </div>
    


</body>

</html>