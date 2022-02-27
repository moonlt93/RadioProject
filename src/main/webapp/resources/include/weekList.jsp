<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	});

</script>
<style type="text/css">
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

.listTable {
	height: 500px;
	
}
tr { 
	border-bottom: solid 1px silver;
}
th {
	text-align: center;
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
	

#write-button {	
	margin-top: 20px;
	width: 100px;
}
.write-button {
	padding: 0;
	background-color: silver;
}

.write-button:hover {
	color: lightslategrey; 
}
</style>

<title>Insert title here</title>
</head>
<body>

<!-- board -->

<div class="weekList">
  <div class="listHeader">
  	<strong class="h5message">제목지어주기</strong>
  </div>
  
  <div class="">
    <table class="list-table"> 
    
    	<thead class="list-thead" style="background-color: darkgrey; color: snow;">
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
    			<td class="tx" style="width:70px">${boardVO.board_bno }</td>
    			
    			<td class="tx">
    				<a class="move" href="<c:out value='${boardVO.board_bno}'/>">
    					<c:out value="${boardVO.board_title }"/>
    				</a>
    			</td>
    			
    			<td class="tx" style="text-align: center; width: 80px;">${boardVO.board_id }</td>
    			
    			<td style="text-align: center; width:100px"><fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.board_regdate}"/><td>
    		</tr>		    			
    	</c:forEach>
    	
    	</tbody>    	
	</table>
  </div>
  <div id="write-button">
  		<button data-oper="register" type="button" class="write-button">글쓰기</button>
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
	
	<form id="searchForm" action="${root }/board/list">
		<select name='type' id="type">
			<option value="T" <c:out value="${pageInfo.board_Criteria.type eq 'T' ? 'selected' : '' }"/>>제목</option>
			<option value="I" <c:out value="${pageInfo.board_Criteria.type eq 'I' ? 'selected' : '' }"/>>아이디</option>
			<option value="N" <c:out value="${pageInfo.board_Criteria.type eq 'N' ? 'selected' : '' }"/>>게시물번호</option>
		</select>
		<input type="text" name="keyword" value='<c:out value="${pageInfo.board_Criteria.keyword }"/>'>
		<input type="hidden" name="pageNum" value="${pageInfo.board_Criteria.pageNum }">
		<input type="hidden" name="amount" value="${pageInfo.board_Criteria.amount }">
		<input type="hidden" name="day" value="${pageInfo.board_Criteria.day }">
	
		<button class="">검색</button>
	</form>
	
	</div>


</div>





</body>
</html>