<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
var root = '${root}';
</script>
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
<script>
	$(document).ready(function() {
		
		
	var message = '${message}';
	
		
		//checkModal(result);
		checkModal2(message);
		
		history.replaceState({}, null, null);
		
		function checkModal2(message) {
			if (message && history.state == null) {
				
				$("#myModal").modal("show");
			}
		}
		
		
	
	});
</script>


<script type="text/javascript">
	
	$(document).ready(function() {
		
		
		
		
		var actionForm = $("#actionForm");
		
		
		
		
		
		
		$(".page-nav a").click(function(e) {
			e.preventDefault();
			
			actionForm.find("[name='pageNum']").val($(this).attr('href'));
			
			actionForm.submit();
		});
		
		
		$(".move ").click(function(e){
			e.preventDefault();
			
			actionForm.append("<input type='hidden' name='board_bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", root + "/board/read");
			
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		$("#searchForm button").click(function(e){
			if(!searchForm.find("[name='keyword']").val()){
				alert("검색 키워드를 입력하세요");
				return false;
			}
			
			e.preventDefault;
			searchForm.find("[name='pageNum']").val("1");
			
			searchForm.submit();
			
		});
		
		$("button[data-oper='register']").click(function(e){
			
			actionForm.attr("action", root + "/board/register");
			actionForm.submit();
			
			
		});
		$("button[data-oper='modify']").click(function(e){
			actionForm.append("<input type='hidden' name='board_bno' value='"+${notiNum}+"' />");
			
			
			actionForm.attr("action", root+"/board/modify");
			
			actionForm.submit();
		});
	});

</script>
<style type="text/css">
.move{
	color : black;
}
.weekList {
	margin: 3%;
	padding: 3%;
}
.listHeader {
	padding: 20px 20px;
	margin-bottom: 30px;
	font-weight: bold;
	color: lightslategrey;
}

.h5message {
	text-align: center;
	font-size: 18px;
}


tr { 
	border-bottom: solid 1px silver;
}

table tbody tr td {
	padding: 3px 0px 3px 0px;
}
.list_table th {
	text-align: center;
	padding: 8px 0px 8px 0px;
}

.tx {
	text-align: center;
}
.page-nav {
	display: flex;
}
.page-nav ul {
	display: flex;
	list-style: none;
	justify-content: center;
}

.page-nav ul li {
	color: snow;
}

.search-form {
	border: solid 1px rgb(241, 241, 241);
	display: flex;
	justify-content: center;
	padding: 20px 30px 20px 30px;
	background-color: rgb(241, 241, 241);
}
.page-nav ul {
		display: flex;
		list-style: none;
		justify-content: center;
		margin-top: 16px;
	}
	
	.num {
		border-radius: 3px 3px;
		text-decoration: none;
		border: 1px silver solid;		
		display: inline-block;
		width: 30px;
		background-color: lightslategrey; 
		text-align: center;
		color: white; 
	}
	
	.priLi, .numLi, .nexLi {
		padding: 0;
	}
	
	.pri, .nex {
		border-radius: 3px 3px;
		text-decoration: none;
		border: 1px silver solid;
		display: inline-block;
		width: 50px;
		background-color: lightslategrey; 
		text-align: center;
		color: white;
		
	}
	
	.pri:hover {
		text-decoration: none;
		background-color: snow;
		color: lightslategrey;
	}
	
	.num:hover {
		text-decoration: none;
		background-color: snow;
		color: lightslategrey;
	}
	
	.nex:hover {
		text-decoration: none;
		background-color: snow;
		color: lightslategrey;
	}
	.reg_btn {
		padding: 2px 4px 2px 4px;
		margin-right: 5px;
		background-color: lightgrey;
		border-radius: 2px 2px;
		outline: none;
		border: none; 
		color: grey;
	}
	
	.reg_btn:hover {
		outline: none;
		border: none;
	}
</style>

<title>Insert title here</title>
</head>
<body>

<!-- board -->

<div class="weekList">
  <div class="listHeader">
        	<c:choose>
        		<c:when test="${pageInfo.board_Criteria.day eq 1}">
            		<strong class="title1">[월요일] 영업합니다</strong> 
            		<div class="description">
						<p>
							"당신이 미처 몰랐던 숨겨진 노래들, 영업해드립니다"
							<br/>
							"데이브레이크 문진수님과 함께하는, 본격 곡 영업소"
						</p>					
					</div>
            	</c:when>

        		<c:when test="${pageInfo.board_Criteria.day eq 2}">
            		<strong class="title1">[화요일] 뮤직에세이, 노래 속 책갈피</strong> 
            		<div class="description">
						<p>
							"당신에게 음악이란 무엇입니까?"
							<br/>
							"음악에 대한 여러분의 생각과 또 그렇게 생각하게 된 사연을 자유롭게 올려주세요~"
						</p>					
					</div>
            	</c:when>

        		<c:when test="${pageInfo.board_Criteria.day eq 3}">
            		<strong class="title1">[수요일] 뮤직에세이, 노래 속 책갈피</strong> 
            		<div class="description">
						<p>
							"당신에게 음악이란 무엇입니까?"
							<br/>
							"음악에 대한 여러분의 생각과 또 그렇게 생각하게 된 사연을 자유롭게 올려주세요~"
						</p>					
					</div>
            	</c:when>

        		<c:when test="${pageInfo.board_Criteria.day eq 4}">
            		<strong class="title1">[목요일] 극한일상</strong> 
            		<div class="description">
						<p>
							"극으로 치닿는 고민부터 극까이거 싶은 고민까지!"
							<br/>
							"극정없는 DJ 문진수님과 극렬하게 여러분의 일상의 짐을 나눠드릴게요"
						</p>					
					</div>
            	</c:when>

        		<c:when test="${pageInfo.board_Criteria.day eq 5}">
            		<strong class="title1">[금요일] 전지적 작사 시점</strong> 
            		<div class="description">
						<p>
							"그냥 듣던 노래도, 전지적 작사 시점으로 들으면 다르다?"
							<br/>
							"평소에 마음을 흔들거나, 힘을 주는 가사말 들을 알려주세요"
						</p>					
					</div>
            	</c:when>

        		<c:when test="${pageInfo.board_Criteria.day eq 6}">
            		<strong class="title1">[토요일] SoSo썰_의뢰 사연</strong> 
            		<div class="description">
						<p>
							"살다보면 찾아오는 선택의 순간! 혹시 그 선택의 순간에서 길을 잃으셨나요?"
							<br/>
							"그럴때  &ltSoSo썰&gt에 찾아와 사연을 올려주세요~"
						</p>					
					</div>
            	</c:when>

				<c:otherwise>
					<strong class="title1">[일요일] 북 트래블러</strong> 
            		<div class="description">
						<p>
							"어디든 보내드립니다."
							<br/>
							"책 속에서 떠나는 일요일 밤의 배낭여행"
						</p>					
					</div>
				</c:otherwise>            	
            </c:choose>
            </div>
  
  <div class="">
    <table class="list_table"> 
    
    	<thead class="list_thead" style="background-color: lightgrey; color: snow;">
    		<tr>
    			<th>번호</th>
    			<th>제목</th>
    			<th>작성자</th>
    			<th>작성일</th>   		
    		</tr>    		    		
    	</thead>
    	
    	<tbody >
    	<c:forEach items="${list }" var="boardVO">
    		<tr id="li">
    			<c:choose>
    				<c:when test="${boardVO.board_pin eq 1 }">
    					<td class="tx" style="width:70px"><c:out value="[공지]"/></td>
    				</c:when>
    				<c:otherwise>
    					<td class="tx" style="width:70px">${boardVO.board_bno }</td>
    				</c:otherwise>
    			</c:choose>
    			<td class="tx">
    				<!-- 관리자 or 매니저 권한 로그인 시 모든글 읽기 가능 -->
    				<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')" >
    						<a class="move" href="<c:out value='${boardVO.board_bno}'/>">
    							<c:out value="${boardVO.board_title }"/>
    						</a>
 					</sec:authorize>
 					
 					<!-- 로그인 안했을 시 공지글 제외하고는 못읽음 -->
 					<sec:authorize access="isAnonymous()">
 						<c:choose>
 							<c:when test="${boardVO.board_bno eq 383 }">
 								<a class="move" href="<c:out value='${boardVO.board_bno}'/>">
    								<c:out value="${boardVO.board_title }"/>
    							</a>
 							</c:when>
 							<c:otherwise>
 								<c:out value="${boardVO.board_title }"/>
 							</c:otherwise>
 						</c:choose>
 					</sec:authorize>
 					
 					<!-- 일반 회원 로그인 했을때는 본인글과 공지글 읽기 가능 -->
 					<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_MEMBER')">
 						<c:set var="loginID" >
 							<sec:authentication property='principal.username'/>
 						</c:set>
 						<c:choose>
 							<c:when test="${(boardVO.board_bno eq 383) or (boardVO.board_id eq loginID)  }">
 								<a class="move" href="<c:out value='${boardVO.board_bno}'/>">
    								<c:out value="${boardVO.board_title }"/>
    							</a>
 							</c:when>
 							<c:otherwise>
 								<c:out value="${boardVO.board_title }"/>
 							</c:otherwise>
 						</c:choose>
 					</sec:authorize>
    					
					
    				
    			</td>
    			
    			<td class="tx" style="text-align: center; width: 80px;">${boardVO.board_id }</td>
    			
    			<td style="text-align: center; width:100px"><fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.board_regdate}"/><td>
    		</tr>		    			
    	</c:forEach>
    	
    	</tbody>    	
	</table>
  </div>
  
  
 
 	 <div id="write-button" style="display: flex; margin-top: 20px; justify-content: space-between;">
 	 	<div>
  		<button data-oper="register" type="button" class="reg_btn">글쓰기</button> 
 	 	</div>
 	 	<div>
  		<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
  		<button data-oper="modify" type="button" class="reg_btn" 
  		style="color: lightslategrey; font-weight: bold; background-color: snow; border: 1px solid lightslategrey">공지사항 수정</button>
  		</sec:authorize>
 	 	</div>
  	</div> 
 
  

 
 
 
 
 <!-- pagination -->
 
	<div class="page-nav">
		<ul class=""> 		
		<!-- prev -->
		<c:if test="${pageInfo.prev }">
			<li class="priLi">
			<a class="pri" href="${pageInfo.startPage-10 }">이전</a>
			</li>
		</c:if>
		
		<!-- pageButton -->
		<c:forEach var="num" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			
			<li class="numLi ${pageInfo.board_Criteria.pageNum == num ? 'active' :'' }">
			<a class="num" href="${num }">${num }</a>
			</li>
		</c:forEach>
		
		<!-- next -->
		<c:if test="${pageInfo.next }">
		
			<li class="nexLi">
			<a class="nex" href="${pageInfo.startPage+10 }">다음</a>
			</li>
			
		</c:if>
		</ul>
	</div>

<div class="d-none">
	<form id="actionForm" action="${root }/board/list">
		<input type="hidden" name="pageNum" value="${pageInfo.board_Criteria.pageNum }">
		<input type="hidden" name="amount" value="${pageInfo.board_Criteria.amount }">
		<input type="hidden" name="type" value="${pageInfo.board_Criteria.type }">
		<input type="hidden" name="keyword" value="${pageInfo.board_Criteria.keyword }">
		<input type="hidden" name="day" value="${pageInfo.board_Criteria.day }">
		
		
		<input type="submit" />
	</form>	
</div>



 <!-- searchForm -->

	<div class="search-form">
	
		<form id="searchForm" action="${root }/board/list" class="form-inline my-2 my-lg-0" > 
			<select name='type' class="custom-select my-1 mr-sm-2"  id="type">
				<option value="T" <c:out value="${pageInfo.board_Criteria.type eq 'T' ? 'selected' : '' }"/>>제목</option>
				<option value="I" <c:out value="${pageInfo.board_Criteria.type eq 'I' ? 'selected' : '' }"/>>아이디</option>
				<option value="N" <c:out value="${pageInfo.board_Criteria.type eq 'N' ? 'selected' : '' }"/>>게시물번호</option>
			</select>
				<input type="text" name="keyword" class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요." value='<c:out value="${pageInfo.board_Criteria.keyword }"/>'>
				<input type="hidden" name="pageNum" value="${pageInfo.board_Criteria.pageNum }">
				<input type="hidden" name="amount" value="${pageInfo.board_Criteria.amount }">
				<input type="hidden" name="day" value="${pageInfo.board_Criteria.day }">
	
				<button class="btn btn-light my-2 my-sm-0"" >검색</button>
		</form>
	
	</div>


</div>





</body>
</html>