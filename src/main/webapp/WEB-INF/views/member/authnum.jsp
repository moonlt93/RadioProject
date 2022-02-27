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
   
   .find_id {
   		padding: 60px 40px;
		background: #f1f1f1; 
		height: 400px;    
		width: 360px;	 
		margin: 60px 0px 0px 0px;  
		position: absolute;  
		left: 30%; 
   }
   
   .find_input {
   		margin-top: 20px;
   }
   
   .find_input input {
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
        					

       <div class="main" style="padding: 100px">
       	<div class="find_id">
      		<h3>아이디 찾기</h3>
       		<c:if test="${not empty id }">
				<p>메일로 전송된 인증번호를 입력하세요.</p>
				<form action="/member/yourid" method="post">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
					<input type="hidden" name="serverKey" value="${AuthenticationKey }">
					<input type="hidden" name="id" value="${id }">
					<div class="find_input">
						<input type="text" name="userKey">
					</div>
					<button class="loginBtn" type="submit">확인</button>	
				</form>
				</c:if>
				
				<c:if test="${empty id }">
				
					<h3>일치하는 정보가 없습니다.</h3>
					<form action="${root }/member/findid" method="post">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
						<div class="find_input">
						    <label for="input-email">이메일</label>
						    <input name="email" type="email" id="input-email">
						</div>
					
						
						<button id="loginBtn" type="submit">아이디 찾기</button>
					</form>

			</c:if>
       	</div>
       </div>
       
        <div class="empty1">

        </div>
        
    </div>
    
    <div class="footer">
        <jsp:include page="/resources/include/main_footer.jsp" />
    </div>
    


</body>
<body>


</body>
</html>