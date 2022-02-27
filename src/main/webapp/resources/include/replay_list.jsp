<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


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

<script>
	$(document).ready(function() {
		
		var result = '${result}';
		var message = '${message}';
		var actionForm = $("#actionForm");
		
		//checkModal(result);
		checkModal2(message);
		
		history.replaceState({}, null, null);
		
		function checkModal2(message) {
			if (message && history.state == null) {
				$("#myModal .modal-body p").html(message);
				$("#myModal").modal("show");
			}
		}
		
		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}
			
			if (parseInt(result) > 0) {
				$("#myModal .modal-body p")
 				 .html("게시글 " + result + "번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
		
		
		$(".page_nav a").click(function(e) {
			e.preventDefault();
			
			actionForm.find("[name='pageNum']").val($(this).attr('href'));
			
			actionForm.submit();
		});
		
		$("button[data-oper='register']").click(function(e){
			e.preventDefault();
			
			actionForm.attr("action", root + "/replay/register");
			actionForm.submit();
			
			
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

.replyList_wrapper {
	margin: 50px 40px 10px 40px;
}

table, thead, tbody, th, tr, td {
	padding: 15px 0px 15px 0px;
}

th, tr {
	border-bottom: 1px solid lightgrey;
}

.replyList_thead tr th {
	background-color: lightgrey;
	color: grey;
	text-align: center;
}

tbody tr td {
	text-align: center;
	color: grey;
}

tbody tr td a{
	color: grey;
}

tbody tr td a:hover {
	text-decoration: none;
	color: grey;
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

.page_nav {
	list-style: none;
	display: flex;
	justify-content: center; 
}

.page_nav li {	
	background-color: snow; 	
	margin-top: 10px;
	border-radius: 5px 5px;
	
}
.page_num {
	color: grey;
	border: 1px solid grey;
	padding: 0px 8px 2px 8px;
	border-radius: 5px 5px;
} 

.page_num:hover {
	background-color: grey;
	color: snow;
	text-decoration: none;
}

</style>
<title>Insert title here</title>
</head>
<body>
<div class="header_title" style="border-radius: 0px;">
<h6>다시듣기</h6>
</div>

<div class="replyList_wrapper">
  <div class="">
    <table class="">
      <thead class="replyList_thead">
        <tr>
          <th style="width: 30px;">작성일</th>
          <th style="width: 170px;">제목</th>
          <th style="width: 50px;">작성자</th>      
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${list}" var="board" >
          <tr>
           	<td><fmt:formatDate pattern="yyyy-MM-dd" 
              value="${board.regdate}" /></td>
            <td>
            <c:url value="/replay/get" var="boardLink">
            	<c:param value="${board.bno }" name="bno" />
            	<c:param value="${pageMaker.cri.pageNum }" name="pageNum" />
            	<c:param value="${pageMaker.cri.amount }" name="amount" />
            	<c:param value="${pageMaker.cri.type }" name="type"	/>
            	<c:param value="${pageMaker.cri.keyword }" name="keyword" />
            </c:url>
            
            <a href="${boardLink }">
	            <c:out value="${board.title}" />
            </a>
            
            </td>
            <td><c:out value="${board.writer}" /></td>          
          </tr>
        </c:forEach>
      </tbody>
    </table>
    	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
    	<a class="btn_register" href="${root }/replay/register">등록</a>
	</sec:authorize>
 
 
  </div>




<div class=" ">
	<div class=" "  style="margin-top: 10px;">
		
		  <ul class="page_nav">
		  
		  	<c:if test="${pageMaker.prev }">
		  		<c:url value="/replay/list" var="prevLink">
		  			<c:param value="${pageMaker.startPage -1 }" name="pageNum" />
		  			<c:param value="${pageMaker.cri.amount }" name="amount" />
		  			<c:param name="type" value="${pageMaker.cri.type }"/>
		    		<c:param name="keyword" value="${pageMaker.cri.keyword }"/>
		  		</c:url>
			    <li class="">
			    <%-- <a class="page-link" href="${prevLink }">Previous</a> --%>
			    <a class="page_pre" href="${pageMaker.startPage -1 }">Previous</a>
			    </li>
		  	</c:if>
		    
		    <c:forEach var="num" begin="${pageMaker.startPage }"
		    					 end="${pageMaker.endPage }">
		    	<c:url value="/replay/list" var="pageLink" >
		    		<c:param name="pageNum" value="${num }" />
		    		<c:param name="amount" value="${pageMaker.cri.amount }" />
		    		<c:param name="type" value="${pageMaker.cri.type }"/>
		    		<c:param name="keyword" value="${pageMaker.cri.keyword }"/>
		    	</c:url>
		    	<li style="margin:0px; padding:0px; padding-right: 2px;" class=" ${pageMaker.cri.pageNum eq num ? 'active' : '' }">
		    	<%-- <a class="page-link" href="${pageLink }">${num }</a> --%>
		    	<a class="page_num" href="${num }">${num }</a>
		    	</li>
		    </c:forEach>
		    
		    <c:if test="${pageMaker.next }">
		    	<c:url value="/replay/list" var="nextLink">
		    		<c:param name="pageNum" value="${pageMaker.endPage +1 }"/>
		    		<c:param name="amount" value="${pageMaker.cri.amount }" />
		    		<c:param name="type" value="${pageMaker.cri.type }"/>
		    		<c:param name="keyword" value="${pageMaker.cri.keyword }"/>
		    	</c:url>
			    <li class="">
			    	<%-- <a class="page-link" href="${nextLink }">Next</a> --%>
		    		<a class="page_nex" href="${pageMaker.endPage +1 }">Next</a>
			    </li>
		    </c:if>
		  </ul>
	
	</div>
</div>

<div class="d-none">
	<form id="actionForm" action="${root }/replay/list" >
		<input name="pageNum" value="${pageMaker.cri.pageNum }" />
		<input name="amount" value="${pageMaker.cri.amount }"/>
		<input name="type" value="${pageMaker.cri.type }" />
		<input name="keyword" value="${pageMaker.cri.keyword }" />
		<input type="submit" />
	</form>
</div>

</div>
 
</body>
</html>




