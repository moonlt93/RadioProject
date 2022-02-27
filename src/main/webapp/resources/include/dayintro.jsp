<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	.header_title {
		border-bottom: 1px silver solid;
		margin-top: 10px;	
		padding: 5px 0px 0px 0px;
		height: 30px;
	}
	.header_title h6 {
		margin-left: 10px;	
		text-shadow: 1px 1px darkgrey;
	}
	 
	.corner_list {
		margin: 30px 40px 20px 40px;
	}
	
	.corner_list ul {
		list-style: none;
	}
	
	.li {
		border-bottom: 2px rgb(241, 241, 241) solid;
	}
	
	.day_btn {
		background-color: lightslategrey;
		color: snow;
		height: 40px;
		border-radius: 5px 5px;
		padding: 8px 4px 0px 4px;		 
		font-weight: bold;
	}
	
	.day_btn:hover {
		text-decoration: none;
		color: snow;
	}
	
	.p_header {
		font-weight: bold;
		color: lightslategrey;
		margin: 5px; 
	}
	
	.p_content {
		padding-left: 20px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="header_title">
<h6>코너소개</h6>
</div>


	
	
<div class="corner_list">
	<ul>			
		<li class="li">
			<div class="day_1" style="display: flex; justify-content: space-between;">
				<div class="header_content">
				
					<div class="p_header">
						[월요일] 영업합니다
					</div>		
								
					<div class="p_content">
						<p>
							"당신이 미처 몰랐던 숨겨진 노래들, 영업해드립니다"
							<br/>
							"데이브레이크 문진수님과 함께하는, 본격 곡 영업소"
						</p>					
					</div>
					
				</div>
				
				<div>
				<a class="day_btn" href="${root }/board/list?day=1">참여하기</a>				
				</div>	
			</div>		
		</li>
			
		<li class="li">
			<div class="day_2" style="display: flex; justify-content: space-between;">
				<div class="header_content">
					<div class="p_header">
						[화요일] 뮤직에세이, 노래 속 책갈피
					</div>
					
					<div class="p_content">
						<p>
							"당신에게 음악이란 무엇입니까?"
							<br/>
							"음악에 대한 여러분의 생각과 또 그렇게 생각하게 된 사연을"
							<br/>
							"자유롭게 올려주세요~"
							
						</p>					
					</div>
				</div>
				
					<div>
						<a class="day_btn" href="${root }/board/list?day=2">참여하기</a>
					</div>				
			</div>
		</li>
			
		<li class="li">
			<div class="day_3" style="display: flex; justify-content: space-between;">
				<div class="header_content">
					<div class="p_header">
						[수요일] 뮤직에세이, 노래 속 책갈피
					</div>
					
					<div class="p_content">
						<p>
							"당신에게 음악이란 무엇입니까?"
							<br/>
							"음악에 대한 여러분의 생각과 또 그렇게 생각하게 된 사연을"
							<br/>
							"자유롭게 올려주세요~"
						</p>					
					</div>
				</div>
			
				<div>
				<a class="day_btn" href="${root }/board/list?day=3">참여하기</a>
				</div>
			</div>				
		</li>
			
		<li class="li">
			<div class="day_4" style="display: flex; justify-content: space-between;">
				<div class="header_content">
					<div class="p_header">
						[목요일] 극한일상
					</div>
					
					<div class="p_content">
						<p>
							"극으로 치닿는 고민부터"
							<br/>
							"극까이거 싶은 고민까지!"
							<br/>
							"극정없는 DJ, 문진수님과"
							<br/>
							"극렬하게, 여러분의 일상의 짐을 나눠드릴게요"
						</p>					
					</div>
				</div>
				
					<div>
						<a class="day_btn" href="${root }/board/list?day=4">참여하기</a>
					</div>
			</div>
				
		</li>
			
		<li class="li">
			<div class="day_5" style="display: flex; justify-content: space-between;">
				<div class="header_content">
					<div class="p_header">
						[금요일] 전지적 작사 시점
					</div>
					
					<div class="p_content">
						<p>
							"그냥 듣던 노래도, 전지적 작사 시점으로 들으면 다르다?"
							<br/>
							"평소에 마음을 흔들거나, 힘을 주는 가사말 들을 알려주세요"
						</p>					
					</div>
				</div>
				
					<div>
						<a class="day_btn" href="${root }/board/list?day=5">참여하기</a>
					</div>
			</div>
		</li>
			
		<li class="li">
			<div class="day_6" style="display: flex; justify-content: space-between;">
				<div class="header_content">
					<div class="p_header">
						[토요일] SoSo썰_의뢰 사연
					</div>
					
					<div class="p_content">
						<p>
							"살다보면 찾아오는 선택의 순간!"
							<br/>
							"혹시 그 선택의 순간에서 길을 잃으셨나요?"
							<br/>
							"그럴때  &ltSoSo썰&gt에 찾아와 사연을 올려주세요~"
						</p>					
					</div>
				</div>
				
				<div>
				<a class="day_btn" href="${root }/board/list?day=6">참여하기</a>
				</div>
			</div>
		</li>
			
		<li class="li">
			<div class="day_7" style="display: flex; justify-content: space-between;">
				<div class="header_content">
					<div class="p_header">
						[일요일] 북 트래블러
					</div>
					
					<div class="p_content">
						<p>
							"어디든 보내드립니다."
							<br/>
							"책 속에서 떠나는 일요일 밤의 배낭여행"
						</p>					
					</div>
				</div>
				
					<div>
						<a class="day_btn" href="${root }/board/list?day=7">참여하기</a>
					</div>
			</div>
		</li>	
	</ul>
		
</div>
		


</body>
</html>