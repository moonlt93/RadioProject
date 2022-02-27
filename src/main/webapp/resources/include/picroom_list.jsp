<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${root }/resources/css/all.min.css" rel="stylesheet">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${root }/resources/css/all.min.css" />
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
var appRoot = '${root}';
var pictroomStaticPath = '${picRoomStaticPath}'
$(document).ready(function() {
	var lastId = Number.MAX_SAFE_INTEGER;
	var length = 9;
	
	loadMore();
	
	$("#pictureRoom-load-btn1").click(function() {
		loadMore();
	});
	function loadMore() {
		$("#pictureRoom-load-btn1")
		.attr("disabled", "disabled")
		.html('<i class="fas fa-spinner fa-spin"></i>');
		
		var data = {from:lastId, length: length};
		$.ajax({
			type: 'GET',
			url: appRoot + "/picroom/more",
			dataType: 'json',
			data: data
		})
		 .done(function(data) {
			 console.log(data);
			 var listContainer = $("#pictureRoom-list1");
			 
			 $.each(data, function(idx, item) {
				 listContainer.append(createCard(item));
				 console.log(item);
				 lastId = item.id;
			 });
			 if (data.length < length) {
				 $("#pictureRoom-load-btn1").text("더 없음");
			 } else {
				 $("#pictureRoom-load-btn1")
				  .removeAttr("disabled")
				  .text("더 보기");
			 }
				 
		 });
	}
	
	function createCard(item) {
		var imagePath = appRoot + "/resources/pic/새끼고양이.jfif";
		
		if (item.fileName) {
			imagePath = pictroomStaticPath + item.fileName;
		}
		
		var res = $("<div>");
		var card = $("<div>").addClass("card");
		var img = $("<img>").addClass("card-img-top").attr("src", imagePath);
		var cardBody = $("<div>").addClass("card-body");
		
		// <a href="#" class="stretched-link">Go somewhere</a>
		var link = $("<a>").attr("href", appRoot + "/picroom/id/" + item.id).addClass("stretched-link").text(item.title);
		var title = $("<h5>").append(link);
		
		/*
		var footer = $("<div>").addClass("card-footer");
		var footerSmall = $("<small>").addClass("text-muted").text("ago");
		footer.append(footerSmall);
		*/
		
		res.append(card.append(img, cardBody.append(title)));
		return res;
	}
	
	$("pictureRoom-load-btn1").click(function(e) {
		e.preventDefault();
		$(this)
		 .attr("disabled", "disabled")
		 .html('<i class="fas fa-spinner fa-spin"></i>');
		
	});
	 
});
</script>
<style>
#pictureRoom-list1 {
	grid-template-columns: 30% 30% 30%;
	justify-content: space-evenly;
	justify-items: stretch;
}
#pictureRoom-list1 div {
	display: block;
}
.header_title { 
	border-bottom: 1px silver solid; 
	margin-top: 10px;	
	padding: 5px 0px 0px 0px;
	height: 30px;
}
.header_title h6 {
	margin-left: 10px;	 
}  
	
.pic_btn {
	background-color: lightslategrey;
	color: white;
	width: 80px;
	margin: 20px;
	padding: 2px;
	text-align: center;
	border-radius: 2px 2px;
	font-weight: bold;
}

.pic_btn:hover {
	text-decoration: none;
	color: white;
	font-weight: bold;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="header_title" style="border-radius: 0px;">
<h6>사진방</h6>
</div>
<div class="container-fluid">
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	
	<a href="${root }/picroom/register" type="submit" data-oper='modify' id="pictureRoom-btn" class="pic_btn">사진 등록</a>
	</sec:authorize> 
	<div id="pictureRoom-list1" ></div>
	<div class="text-center">
		<button id="pictureRoom-load-btn1" class="btn btn-outline-secondary" style="margin-top: 20px;">더 보기</button>
	</div>
</div>
</body>
</html>