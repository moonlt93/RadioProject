<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var root = '${root}';
</script>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${root}/resources/css/all.min.css" rel="stylesheet">  
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var form = $("#serviceForm");
		
		$(".page_nav a").click(function(e) {
			e.preventDefault();
			
			form.find("[name='pageNum']").val($(this).attr('href'));
			
			form.submit();
		});
		
			$(".move").click(function(e){
			
			e.preventDefault();
			
			form.append("<input type='hidden' name='center_bno' value='"+$(this).attr("href")+"'>");
			form.attr("action", root + "/service/read");
			
			form.submit();
		});	
	});
</script>
<title>Insert title here</title>
<style type="text/css">
	.center_list {
		padding: 3%;
		margin: 3%;
	}
		
	.center_header { 
		border-bottom: 2px solid snow;
		
	}
		
	.center_header h2 {
		text-align: center;		
		color: white;
		font-weight: bold;
	}
	
	.menu_button ul{
		list-style: none;
		display: flex;
		justify-content: center;
	}
	
	.menu_button ul li {
		font-size: 20px;
		padding: 5px 10px 5px 10px;
	}
	
	</style>
</head>
<body>
	
	<div class="center_list">

<div style="padding: 20px 15px 10px 15px; background-color: lightslategrey">
	<div class="center_header" style="border-radius: 0px;">
			<h2>고객 센터</h2>
		</div>	
		
		<div class="menu_button">
			<ul>
				<li><a href="${root }/service/admin" style="color: white;"><strong>문의 내역</strong></a></li> 
			</ul>	 
		</div> 
</div>	
		
		<div class="list_table">
		
		<c:if test="${empty list }">문의 내역이 없습니다.</c:if>
		
			<table>
			
				<thead>
					<tr>
						<th>문의유형</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록 일</th>
					</tr>
				</thead>
			
				<tbody>
				<c:forEach items="${list }" var="CenterVO">
					<tr>
						<td>${CenterVO.center_type }</td>
						<td>
							<a class="move" href="<c:out value='${CenterVO.center_bno }'/>">
								<c:out value="${CenterVO.center_title }"/>
							</a>
						</td>
						<c:set var="loginID">
							<sec:authentication property='principal.username' />
						</c:set>
						<td>${CenterVO.member_id}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${CenterVO.center_regdate }"/></td>
					</tr>
				</c:forEach>		
				</tbody>			
			
			</table>
		
		</div>
	</div>
	
	<div class="page_nav">
		<ul>
			<c:if test="${page.prev }">
				<li class="">
					<a class="" href="${page.startPage-1 }">이전</a>
				</li>
			</c:if>
			
			<c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
				<li class="${page.cri.pageNum == num ? 'active' : '' }">
					<a class="" href="${num }">${num }</a>
				</li>
			</c:forEach>
			
			<c:if test="${page.next }">
				<li>
					<a href="${page.startPage+1 }">다음</a>
				</li>
			</c:if>
		</ul>		
	</div>
	
	<div class="d-none">
	<form id="serviceForm" action="${root }/service/member"> 
		<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
		<input type="hidden" name="amount" value="${page.cri.amount }">		
		<input type="submit" />
	</form>	
</div>

</body>
</html>




