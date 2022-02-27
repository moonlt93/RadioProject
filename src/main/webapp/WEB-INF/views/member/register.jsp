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

@charset "UTF-8";
*{
        margin: 0;
        padding: 0;
    }

   .wrapper{      
        display: grid;
        grid-gap: 15px;
        height: 100%;
        grid-template-columns: 1fr 300px 300px 300px 300px 1fr ;
        grid-template-rows:  200px 50px 1fr 1fr 1fr 1fr ;
        grid-template-areas: 'empty2 header header header header empty3' 
                             'empty2 nav nav nav nav empty3'
                             'empty2 main main main main empty3'
                             'empty2 main main main main empty3'
                             'empty2 main main main main empty3'
                             'empty2 main main main main empty3'                             
   }
   .wrapper div {
        border-radius: 5px 5px;      
        text-align: inherit;
        display: grid;
   }
   .header {
    grid-area: header;
    color: thistle;
   }
   .nav {
    background-color: snow;
    grid-area: nav;
   } 
  
   .main {
    background-color: snow;
    grid-area: main;
   }
   .empty1 {
    grid-area: empty1;
   }
   
   .moon {
   	text-decoration: none;
   	color: thistle;
   }
   
   .moon:hover {
   	text-decoration: none;
   	color: thistle
   }
   button {      
       padding-left: 30px;
       padding-right: 30px;
       border: none;
       outline: none;
       border-radius: 5px 5px;
       background-color: thistle; 
       color: white;
   }
   button:hover {      
       cursor: pointer; 
   }
   .nav .nav-flex {
       display: flex;
       padding-left: 30px;
       padding-right: 30px;
       border: none;
       outline: none;
       border-radius: 5px 5px;
       align-items: center;
       justify-content: center;
       background-color: thistle;     
   }
   .title1 {
       padding: 10px 10px 0px 10px;
       font-size: 15px;
   }

   .header h1 {
       text-align: center;
       margin-top: 80px;
   }
   .footer{
       height: 200px;
       background-color: rgb(216, 161, 88);
       margin-top: 30px;
       width: 100%;
   }
 
   i { 
       color: grey;
       margin-right: 5px;
   }

   .week {
       background-color: black;
       color: white;
   }
   
   #minListIframe {
   	width: 100%;
   	height: 100%;
   	border-radius: 5px 5px;
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
        				
       <div class="main">
       		<jsp:include page="/resources/include/member_register.jsp" />
       </div>
       
       <div class="empty1">

       </div>
        
    </div>
    
    <div class="footer">
        <jsp:include page="/resources/include/main_footer.jsp" />
    </div>
    


</body>
</html>