<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
		
		$(".page_nav a").on("click", function(e) {
			e.preventDefault();

			actionForm.find("[name='pageNum']").val($(this).attr('href'));
			actionForm.submit();
		});
		
		var formObj = $("form");

		$('#button2').on("click", function(e) {
			e.preventDefault();

			var register = $(this).data("form");

			formObj.attr("action", root + "/playlist/register").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			 

			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);

			formObj.submit();
		});
	});

</script>
<style type="text/css">
.header_title {
	border-bottom: 1px silver solid;
	margin-top: 10px;	
	padding: 5px 0px 0px 0px;
	height: 30px;
}
.header_title h6 {
	margin-left: 10px;	
}
.playList_wrapper {
	margin: 50px 40px 10px 40px;
}

table, thead, tbody, th, tr, td {
	padding: 15px 0px 15px 0px;
}

th, tr {
	border-bottom: 1px solid silver;
}

.list-thead tr th {
	background-color: lightgrey;  
	color: grey;
}

.a_title {
	color: grey;
}

.a_title:hover {
	color: grey;
	text-decoration: none;
}
.page_nav {
	margin-top: 10px;
}
.page_nav .nav_ul {
	display: flex;
	list-style: none;	
	justify-content: center;
}
.page_num {
	color: grey;
	border: 1px solid grey;
	padding: 0px 8px 2px 8px;
	border-radius: 5px 5px;
	margin:0px;
	
} 

.page_num:hover {
	background-color: grey;
	color: snow;
	text-decoration: none;
}

.search_form {
	border: solid 1px rgb(241, 241, 241);
	display: flex;
	justify-content: center; 
	padding: 20px 30px 20px 30px;
	background-color: rgb(241, 241, 241);
}

.date_input {
	border: 1px solid silver;
	color: silver;
}

.btn_register {
	background-color: lightgrey;
	color: grey; 
	margin-top: 10px;
	padding: 2px 4px 2px 4px;
	border-radius: 3px;
	height: 27px;
	width: 45px;
	text-align: center;
}
.btn_register:hover {
	text-decoration: none;
	color: grey;
} 



</style>

<title>playlist</title>
</head>
<body>

<div class="header_title">
<h6>선곡표</h6>
</div>
<div class="playList_wrapper">
	<div class="playList">
		
		<div class="">
			<table class="list-table">


				<thead class="list-thead">
					<tr>
						
						<th style="text-align: center; width: 30px">방송일</th>
						<th style="text-align: center; width: 170px">제목</th>
						<th style="text-align: center; width: 50px">조회수</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${list}" var="board">
						<tr id="li">
						
							<td style="text-align: center; color: grey;">
							<fmt:formatDate	pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
							<td class="tx" style="text-align: center;">
							<c:url	value="/playlist/get" var="boardLink">
									<c:param value="${board.bno }" name="bno" />
									<c:param value="${board.writer }" name="id" />
									<c:param value="${pageMaker.cri.pageNum }" name="pageNum" />
									<c:param value="${pageMaker.cri.amount }" name="amount" />
									<c:param value="${pageMaker.cri.type }" name="type" />
									<c:param value="${pageMaker.cri.keyword }" name="keyword" />
								</c:url> <a class="a_title" href="${boardLink }"> <c:out value="${board.title}" />
							</a></td>				
							<td style="text-align: center; color: grey;"><c:out
									value="${board.hit }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
			<div class="btn_sub" style="display: flex;">
				<div >
				<button type="submit" data-oper='modify' class="btn_register" id="button2">등록</button>
				</div>
				</div>		
			</sec:authorize>  
			
		</div>
	
	<div class="page_nav">		
		  <ul class="nav_ul">		  
		  	<c:if test="${pageMaker.prev }">
		  		<c:url value="${root }/playlist/play" var="prevLink">
		  			<c:param value="${pageMaker.startPage -1 }" name="pageNum" />
		  			<c:param value="${pageMaker.cri.amount }" name="amount" />
		  			<c:param name="type" value="${pageMaker.cri.type }"/>
		    		<c:param name="keyword" value="${pageMaker.cri.keyword }"/>
		  		</c:url>
			    <li>
			    <%-- <a class="page-link" href="${prevLink }">Previous</a> --%>
			    <a class="page_pre" href="${pageMaker.startPage -1 }">이전</a>
			    </li>
		  	</c:if>
		    
		    <c:forEach var="num" begin="${pageMaker.startPage }"
		    					 end="${pageMaker.endPage }">
		    	<c:url value="${root }/playlist/play" var="pageLink" >
		    		<c:param name="pageNum" value="${num }" />
		    		<c:param name="amount" value="${pageMaker.cri.amount }" />
		    		<c:param name="type" value="${pageMaker.cri.type }"/>
		    		<c:param name="keyword" value="${pageMaker.cri.keyword }"/>
		    	</c:url>
		    	<li class=" ${pageMaker.cri.pageNum eq num ? 'active' : '' }" style="padding:0px; margin-right:2px;">
		    	<%-- <a class="page-link" href="${pageLink }">${num }</a> --%>
		    	<a class="page_num" href="${num }">${num }</a>
		    	</li>
		    </c:forEach>
		    
		    <c:if test="${pageMaker.next }">
		    	<c:url value="${root }/playlist/play" var="nextLink">
		    		<c:param name="pageNum" value="${pageMaker.endPage +1 }"/>
		    		<c:param name="amount" value="${pageMaker.cri.amount }" />
		    		<c:param name="type" value="${pageMaker.cri.type }"/>
		    		<c:param name="keyword" value="${pageMaker.cri.keyword }"/>
		    	</c:url>
			    <li class="">
			    	<%-- <a class="page-link" href="${nextLink }">Next</a> --%>
		    		<a class="page_nex" href="${pageMaker.endPage +1 }">다음</a>
			    </li>
		    </c:if>
		  </ul>
	</div>
</div>
	
	<div class="d-none">
		<form id="actionForm" action="${root }/playlist/play">
			<input name="pageNum" value="${pageMaker.cri.pageNum }" /> <input
				name="amount" value="${pageMaker.cri.amount }" /> <input
				name="type" value="${pageMaker.cri.type }" /> <input name="keyword"
				value="${pageMaker.cri.keyword }" /> <input type="submit" />
		</form>
	</div>


	<div class="search_form">
		<form action="${root }/playlist/play" id="searchForm" class="form-inline my-2 my-lg-0">
		
			<select name="type" class="custom-select my-1 mr-sm-2"
				id="inlineFormCustomSelectPref">
				<option value="T" ${pageMaker.cri.type eq 'T' ? 'selected' : '' }>제목</option>
				<option value="C" ${pageMaker.cri.type eq 'C' ? 'selected' : '' }>가수</option>
				<option value="W" ${pageMaker.cri.type eq 'W' ? 'selected' : '' }>작성자</option>
			</select> 
			<input name="keyword" required value="${pageMaker.cri.keyword }"
				class="form-control mr-sm-2" type="search" placeholder="검색"
				aria-label="Search"> 
				<input type="hidden" name="pageNum" value="1" /> 
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			
		</form> 
	</div>
</div>


</body>
</html>