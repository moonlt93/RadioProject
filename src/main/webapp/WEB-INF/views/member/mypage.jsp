<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
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
   
   .mypage_title {
   		margin: 100px: 
   		
   }
</style>

<title>Insert title here</title>
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
       		<div class="container" style="margin: 100px; ">
       			<div class="mypage_title">
	       			<h1>마이 페이지</h1>
       			</div>
								
       			
       			<div class="mypage_body" style= "margin-top: 60px;">
	       			<form>
						  <div class="form-row">
							    <div class="form-group col-md-6">
							      <label for="mypage_id">이름</label>
							      <input value='<sec:authentication property="principal.member.name"/>' class="form-control" id="mypage_id">
							    </div>
							    <div class="form-group col-md-6">
							      <label for="mypage_id">아이디</label>
							      <input value='<sec:authentication property="principal.username"/>' class="form-control" id="mypage_id">
							    </div>
							    <div class="form-group col-md-6">
							      <label for="mypage_email">이메일</label>
							      <input value='<sec:authentication property="principal.member.email"/>' type="email" class="form-control" id="mypage_email">
							    </div>
							  <div class="form-group col-md-6">
							    <label for="add1">시/도</label>
							    <input value='<sec:authentication property="principal.member.add1"/>' type="text" class="form-control" id="add1" placeholder="1234 Main St">
							  </div>
							  <div class="form-group col-md-6">
							    <label for="add2">시/군/구</label>
							    <input value='<sec:authentication property="principal.member.add2"/>' type="text" class="form-control" id="add2" placeholder="1234 Main St">
							  </div>
							  <div class="form-group col-md-6">
							    <label for="add3">읍/면/동</label>
							    <input value='<sec:authentication property="principal.member.add3"/>' type="text" class="form-control" id="add3" placeholder="1234 Main St">
							  </div>
							  <div class="form-group col-md-6">
							    <label for="add4">상세주소</label>
							    <input value='<sec:authentication property="principal.member.add4"/>' type="text" class="form-control" id="add4" placeholder="1234 Main St">
							  </div>
						  </div>

						</form>      	
       			</div>
       			
       			<div class="mypage_btn_for_changepw" style="width: 200px; margin-top: 50px;">
       				 <a href="${root }/member/findpw" type="button" class="btn btn-outline-dark">비밀번호 변경</a>
       			</div>
       			
       		</div>
       </div>
       
        <div class="empty1">

        </div>
        
    </div>
    
    <div class="footer">
        <jsp:include page="${root }/resources/include/main_footer.jsp" />
    </div>
    

</body>
</html>