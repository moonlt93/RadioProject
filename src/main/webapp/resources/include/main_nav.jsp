<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.nav-flex {
       display: flex;
       padding-left: 30px;
       padding-right: 30px;
       border: none;
       outline: none;
       border-radius: 5px 5px; 
       align-items: center;
       justify-content: center; 
       background-color: peru; 
       
   }
   
   .nav-menu {
   	   display: flex;
   	   text-decoration: none;
   	   color: white;   	  
       padding: 10px 30px 10px 30px;
       font-weight: bold;
   }
   
   .nav-menu:hover {
   	   text-decoration: none;
   }

</style>
<title>Insert title here</title>
</head>
<body>
	 <div class="nav-flex">               
          <a class="nav-menu" href="${root}/mini/list">mini메시지</a>
          <a class="nav-menu" href="${root}/playlist/play">선곡표</a>
          <a class="nav-menu" href="${root}/board/dayintro">코너소개</a>
          <a class="nav-menu" href="${root}/replay/list">다시듣기</a>                  
          <a class="nav-menu" href="${root}/picroom/list">사진방</a>     
          <a class="nav-menu" href="${root}/video/video_list">보이는라디오</a>              
     </div>   
</body>
</html>