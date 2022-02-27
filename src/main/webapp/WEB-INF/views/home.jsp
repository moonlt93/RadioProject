<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
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
<script type="text/javascript">
$(document).ready(function() {
	
function locale (){ 	 
	var date = new Date().toLocaleString();
	var d = date.substring(0, date.indexOf('. 오'));
	return d; 	 
	}  

document.getElementById('sysdate').innerHTML = locale(); 
});


</script>
<style type="text/css">
	*{	
	 	margin: 0; 
      	padding: 0;
    }

	body {
		background-image: url("${root}/resources/pic/Lovepik_com lake boat night backgroun.jpg");
		background-size:cover;
	}	
	
   .wrapper{      
        margin: 0 10% 0 10%;
        display: grid;
        grid-gap: 15px;
        height: 100%;
        grid-template-columns: 1fr 300px 300px 300px 300px 1fr;   
        grid-template-rows:  400px 50px 90px 30px 70px 110px 130px 200px 100px;
        grid-template-areas: 'empty3 header header header header empty4'
                             'empty3 nav nav nav nav empty4'
                             'empty3 today today today today empty4'  
                             'empty3 playlist weekday SNS inquiry empty4'  
                             'empty3 playlist weekday SNS inquiry empty4'  
                             'empty3 playlist weekday listener inquiry empty4'
                             'empty3 playlist weekday radio radio empty4'
                             'empty3 playlist empty5 radio radio empty4'
                             'empty3 sns empty5 empty2 empty1 empty4'      
   }
   .wrapper div{
        border-radius: 5px 5px;      
        text-align: inherit;
        display: grid;
   }
   .header{
        grid-area: header;
        color: thistle;
   }
   .nav{
        background-color: snow;
        grid-area: nav;
   }
   .today{
        background-color: snow;
        grid-area: today; 
   }
   .playlist{  
       grid-area: playlist; 
       overflow:scroll;
   	   overflow-x:auto;	    
  	   text-align:inherit;   
  	   font-size:17px;
  	   background-color: snow;
   }
   .weekday{
        background-color: snow;
        grid-area: weekday;
   }
   .radio{
        background-color: snow;
        grid-area: radio;
   }
   .listener{
        background-color: snow;
        grid-area: listener;
   }
   .inquiry{
        background-color: snow;
        grid-area: inquiry;
   }
    .SNS {
        background-color: snow;
        grid-area: SNS;
   }
   
   .empty1 {
        grid-area: empty1;
   }
  
   .empty3 {
        grid-area: empty3;
   }
   .empty4 {
        grid-area: empty4;
   }
   .empty5 {
   		grid-area: empty5;
   }
   .every{
        grid-area: every;
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
       background-color: peru;
       
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
   
   .title1 {
       padding: 10px 10px 10px 10px;
            
   }
   .title2 {
      padding-top: 5px;
   }

   .header h1 {
       text-align: center;
       margin-top: 80px;
   }

   .header2 .header-nav{
       display: flex;
       background-color: black;
       height: 40px;
       justify-content: flex-end;
   }

   .header2 .header-nav .header-button {
       background-color: black;
   }

   .footer{ 
       height: 200px; 
       background-color: rgb(216, 161, 88);
       margin-top: 30px;
       width: 100%;
   }
   .font {
   		text-decoration: none;
   		font-size: 20px;
   		padding-left: 10px;
   		padding-top: 5px;
   }
   
   .font:hover {
   		text-decoration: none;
   }
   
   
   #list {
   	   margin-right: 5px;
   }
   .everyDay .evList {
       padding: 5px 5px 7px 30px;
   }
   .evA {
   	   text-decoration: none;
   	   color: grey;
   }
   
   .evA:hover {
   	   text-decoration: none;
   }
   
   .week {
       background-color: black;
       color: white;
   } 

   .play-img{
  		border:1px solid;
   		width:75px;
   		height:75px;
   		display:block;
   }
   
   .description {
   		padding-left: 20px;
   }
   
   .evlist i {
   		padding-left: 8px;
   }
   
   .li_span {
   		padding-left: 13px; 
   }
   .inquiry_body {
   		padding: 0px 20px 0px 20px;
   }
   .main_inquiry {
   		color: grey;
   }
   .description {
   		padding-top: 5px; 
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

        <div class="today" style="display: flex; padding-left: 20px; padding-top: 18px;"> 
        	<h4><strong style="margin:0px 15px 0px 20px;">Today
        	<strong style="margin:0px 15px 0px 20px; color: silver">|</strong> 
        	</strong></h4> 
        	 
        	 
        	<c:choose>
        		<c:when test="${today eq 2}">
            		<strong class="title2">[월요일] 영업합니다</strong>  
            		<div class="description">					
							"당신이 미처 몰랐던 숨겨진 노래들, 영업해드립니다"
							<br/>
							"데이브레이크 문진수님과 함께하는, 본격 곡 영업소"										
					</div>
            	</c:when>

        		<c:when test="${today eq 3}">
            		<strong class="title2">[화요일] 뮤직에세이, 노래 속 책갈피</strong> 
            		<div class="description">
							"당신에게 음악이란 무엇입니까?"
							<br/>
							"음악에 대한 여러분의 생각과 또 그렇게 생각하게 된 사연을 자유롭게 올려주세요~"					
					</div>
            	</c:when>

        		<c:when test="${today eq 4}">
            		<strong class="title2">[수요일] 뮤직에세이, 노래 속 책갈피</strong> 
            		<div class="description">
							"당신에게 음악이란 무엇입니까?"
							<br/>
							"음악에 대한 여러분의 생각과 또 그렇게 생각하게 된 사연을 자유롭게 올려주세요~"					
					</div>
            	</c:when>

        		<c:when test="${today eq 5}">
            		<strong class="title2">[목요일] 극한일상</strong> 
            		<div class="description">
							"극으로 치닿는 고민부터 그까이거 싶은 고민까지!"
							<br/>
							"극정없는 DJ 문진수님과 극렬하게 여러분의 일상의 짐을 나눠드릴게요"				
					</div>
            	</c:when>

        		<c:when test="${today eq 6}">
            		<strong class="title2">[금요일] 전지적 작사 시점</strong> 
            		<div class="description">
							"그냥 듣던 노래도, 전지적 작사 시점으로 들으면 다르다?"
							<br/>
							"평소에 마음을 흔들거나, 힘을 주는 가사말 들을 알려주세요"				
					</div>
            	</c:when>

        		<c:when test="${today eq 7}">
            		<strong class="title2">[토요일] SoSo썰_의뢰 사연</strong>  
            		<div class="description">					
							"살다보면 찾아오는 선택의 순간! 혹시 그 선택의 순간에서 길을 잃으셨나요?"
							<br/>
							"그럴때  &ltSoSo썰&gt에 찾아와 사연을 올려주세요~" 					
					</div>
            	</c:when>

				<c:otherwise>
					<strong class="title2">[일요일] 북 트래블러</strong>  
            		<div class="description">
							"어디든 보내드립니다."
							<br/>
							"책 속에서 떠나는 일요일 밤의 배낭여행"				
					</div>
				</c:otherwise>            	
            </c:choose>
        </div>
        
        
        <div class="playlist"> 
        <div>
            <strong class="title1"><i id="list" class="far fa-list-alt"></i>선곡표</strong>
        	<ul class="everyDay" style="list-style: none;">
        		<li class="evlist"><i class="fas fa-caret-right"></i><a class="evA" href="${root}/playlist/play">
        		<img class="play-img" alt="지은이" align="left" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F609%2F2021%2F01%2F27%2F202101271630342410_1_20210127180008219.jpg&type=sc960_832" >
        		celebrity<br/><span class="li_span">아이유(IU)</span></a></li> <br>
        		<li class="evlist"><i class="fas fa-caret-right"></i><a class="evA" href="${root}/playlist/play">
        		<img class="play-img" alt="경서" align="left" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDEyMTNfODEg%2FMDAxNjA3NzkyNjIzMDgw.0RxK0w5_tuPeEPc9Sw05PTIQX08elGEfGN23icLsZXgg.11j9A48fhN_8kR6jrmM4nn42QyQeG9kclr4lQ5AF7w0g.JPEG.chris1677%2FIMG_5490.jpg&type=sc960_832" >
        		밤하늘의 별을<br/><span class="li_span">경서</span></a></li><br>
        		<li class="evlist"><i class="fas fa-caret-right"></i><a class="evA" href="${root}/playlist/play">
        		<img class="play-img" alt="머쉬베놈" align="left" src="https://musicmeta-phinf.pstatic.net/album/005/100/5100782.jpg?type=r360Fll&v=20210121091405" >
        		VVS<br/><span class="li_span">미란이&먼치맨</span></a></li><br>
        		<li class="evlist"><i class="fas fa-caret-right"></i><a class="evA" href="${root}/playlist/play">
        		<img class="play-img" alt="장범준" align="left" src="https://dimg.donga.com/a/581/0/90/5/wps/NEWS/IMAGE/2020/10/24/103605963.2.jpg" >
        		잠이 오질 않네요 <br/><span class="li_span">장범준</span></a></li><br>
        		<li class="evlist"><i class="fas fa-caret-right"></i><a class="evA" href="${root}/playlist/play">
        		<img class="play-img" alt="방탄소년단" align="left" src="http://spnimage.edaily.co.kr/images/photo/files/NP/S/2020/10/PS20102700044.jpg" >
        		DYNAMITE<br/><span class="li_span">방탄소년단</span></a></li><br>
        		<li class="evlist"><i class="fas fa-caret-right"></i><a class="evA" href="${root}/playlist/play">
        		<img class="play-img" alt="아이유" align="left" src="https://cdnimg.melon.co.kr/cm2/album/images/104/26/648/10426648_20200506153340_500.jpg?0ed92b652a9149e26387233529a32781" >
        		에잇<br/><span class="li_span">아이유(IU&BTS)</span></a></li><br>
        		<li class="evlist"><i class="fas fa-caret-right"></i><a class="evA" href="${root}/playlist/play">
        		<img class="play-img" alt="10CM" align="left" src="http://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/858/755/81858755_1611302348643_1_600x600.JPG" >
        		이밤을 빌려 말해요<br/><span class="li_span">10CM</span></a></li><br>
        		<li class="evlist"><i class="fas fa-caret-right"></i><a class="evA" href="${root}/playlist/play">
        		<img class="play-img" alt="방탄소년단" align="left" src="https://image.bugsm.co.kr/album/images/350/9887/988734.jpg" >
        		취기를 빌려<br/><span class="li_span">산들</span><br><span class="li_span">(취향저격그녀&산들)</span></a></li>        		
        	</ul>
        </div>
        </div>
        
        <div class="weekday"> 
               <jsp:include page="/resources/include/homeintro.jsp" />
        </div> 

        <div class="radio">
            <strong class="title1"><i id="list" class="far fa-list-alt"></i>보이는라디오</strong>
            <div class="box box_short photo" id="bora"> 
				<a href="${root }/video/video_read?video_bno=104&pageNum=1&amount=5">
				<span style="padding-left: 180px;" class="img"><img src="https://i1.sndcdn.com/artworks-000049909608-wpupq6-t500x500.jpg" 	
				width="250px" height="200"></span> 
				</a>
				<span>
				<a href="${root }/video/video_read?video_bno=104&pageNum=1&amount=5">
				<span style="padding-left: 180px; color: grey;" >채형's security강의방송일 2021-02-18</span>
				</a>
				</span>				 
				  
			</div>
        </div>

        <div class="listener">
            <strong class="title1"><i id="list" class="far fa-list-alt"></i>다시듣기</strong> 
            <div style="margin-left: 45px; display: flex; items-align: center;">
            	<i style="font-size: 40px; color: black;" class="far fa-play-circle"></i>          	
                <span id="sysdate" style="color:grey; padding-left: 20px; padding-top: 10px; font-size: 15px;"></span>   
            </div>    
            <div>
            	  
            </div> 
        </div> 
  
        <div class="inquiry">
            <strong class="title1"><i id="list" class="far fa-list-alt"></i>고객센터</strong>
            <div class="inquiry_body">
            	<h2><strong style="margin-bottom: 30px;">1 : 1 문의하기</strong></h2>
            	<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_MEMBER')">
 	           		<a class="main_inquiry" href="${root }/service/member"><i id="list" class="fas fa-caret-right"></i>고객센터</a> 
            	</sec:authorize>
            	
            	<sec:authorize access="hasRole('ROLE_ADMIN')">
            		<a class="main_inquiry" href="${root }/service/admin"><i id="list" class="fas fa-caret-right"></i>관리자 고객센터</a>
            	</sec:authorize>
            </div>  
        </div>

        <div class="empty1"></div>
        <div class="SNS">
        	<strong class="title1"><i id="list" class="far fa-list-alt"></i>SNS</strong>   
        	<div style="margin-bottom: 30px; margin-left: 50px; display: flex; align-items: center;"> 
        		<a href="https://www.instagram.com/jangyoura/"> 
        			<i style="font-size: 40px; color: black;" class="fab fa-instagram"></i>	 
        		</a>
        		<a class="font" href="https://www.instagram.com/jangyoura/">
        			<span class="font" style="color:grey; padding-left: 10px;"><strong>인스타그램</strong></span> 
        		</a>
        	</div>  
        </div>    
        
        <div class="empty3"></div>
        <div class="empty4"></div> 
        <div class="empty5"></div> 
       
    </div>   
    
    <div class="footer">
        <jsp:include page="/resources/include/main_footer.jsp" />
    </div>
</body>
</html>
 