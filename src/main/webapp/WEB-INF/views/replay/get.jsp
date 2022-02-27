<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="${root }/resources/js/board_replay.js"></script>

<script>
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

var flag = false;

	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});

	$(document).ready(function() {
		// 날짜 형식
		function dateString(date) {
			var d = new Date(date);
			return d.toISOString().split("T")[0];
		}
		
		// 댓글 목록 가져오기 함수
		function showList() {
			replyService.getList(
					{bno: bno}, 
					function(list) {
				// console.log(list);
				console.log(list);
				var replyUL = $("#reply-ul");
				
				console.log(list.length);
				if (list.length > 0) {
					flag = true;
				} else {
					flag = false;
				}
				replyUL.empty();
				for (var i = 0; i < list.length; i++) {
					var replyLI = '<li class="media" data-rno="' 
					+ list[i].rno + '" ><div class="reply_txt" style="border-radius: 0px;">'
					+"<div class='media-body' style='border-radius: 0px; display:flex; justify-content: space-between;'><span class='re'>"
					+ list[i].replyer + '</span><span class="float-right">' 
					+ dateString(list[i].regDate) + "</span></div>" 
					+ "<div class='reply_body'>" 
					+ list[i].reply + "</div></li></div>";
					
					replyUL.append(replyLI);
				}
			});
		}
		
		// 새 댓글 버튼 클릭 이벤트 처리
		$("#new-reply-button").click(function() {
			console.log("new reply button clicked....");
			$("#new-reply-modal").modal("show");
			
		});
		
		// 새 댓글 등록 버튼 클릭 이벤트 처리
		$("#reply-submit-button").click(function() {
			 
			// input에서 value 가져와서 변수에 저장
			var reply = $("#reply-input").val();
			var replyer = $("#replyer-input").val();
			
			console.log(reply);
			console.log(replyer);
			// ajax 요청을 위한 데이터 만들기
			var data = {bno: bno, reply:reply , replyer:replyer};
			
			
			replyService.add(data,
					function() {
						// 댓글 목록 가져오기 실행
						showList();
						alert("댓글 등록에 성공하였습니다.");
					},
					function() {
						alert("댓글 등록에 실패하였습니다.")
					}
			);
			
			// 모달창 닫기
			$("#new-reply-modal").modal("hide");
			// 모달창 내의 input 요소들 value를 초기화
			$("#new-reply-modal input").val("");
			
			
		});
		
		// reply-ul 클릭 이벤트 처리
		$("#reply-ul").on("click", "li", function() {
			// console.log("reply ul clicked......");
			console.log($(this).attr("data-rno"));
			
			// 하나의 댓글 읽어오기
			var rno = $(this).attr("data-rno");
			replyService.get(rno, function(data) {
				$("#rno-input2").val(rno);
				$("#reply-input2").val(data.reply);
				$("#replyer-input2").val(data.replyer);
				$("#modify-reply-modal").modal('show');
			});
			
		});
		
		// 수정 버튼 이벤트 처리
		$("#reply-modify-button").click(function() {
			var rno = $("#rno-input2").val();
			var reply = $("#reply-input2").val();
			var data = {rno:rno , reply: reply};
			
			replyService.update(data, function() {
				alert("댓글을 수정하였습니다.");
				$("#modify-reply-modal").modal('hide');
				showList();
			});
		});
		
		// 삭제 버튼 이벤트 처리
		$("#reply-delete-button").click(function() {
			var rno = $("#rno-input2").val();
			var replyer = $("#replyer-input2").val();
			replyService.remove(rno, replyer, 
					function() {
				alert("댓글을 삭제하였습니다.");
				showList();
			});
				$("#modify-reply-modal").modal('hide');
		});
		
		// 댓글 목록 가져오기 실행
		showList();
		
		
		
	});
</script>

<style type="text/css">
	 body {
		background-image: url("${root}/resources/pic/Lovepik_com lake boat night backgroun.jpg");
		background-size:contain;
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
        
        <div class="weekday">
            <jsp:include page="/resources/include/main_dayintro.jsp" />
        </div>  
        					

       <div class="main">
       		<jsp:include page="/resources/include/replay_get.jsp"/>
       </div>
       
       <div class="empty1">

       </div>
        
    </div>
    
    <div class="footer">
        <jsp:include page="/resources/include/main_footer.jsp" />
    </div>
    

	<%-- modal 새 댓글 form --%>
	<div class="modal fade" id="new-reply-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						새 댓글
					</h5>		
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>		
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="reply-input" class="col-form-label">
							댓글
						</label>
						<input type="text" class="form-control" id="reply-input">
					</div>
					<div class="form-group">
						<label for="replyer-input" class="col-form-label">
							작성자
						</label>
						<input type="text" class="form-control" id="replyer-input" value="${id }">
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button id="reply-submit-button" type="button" class="btn btn-primary">등록</button>				
				</div>
			</div>
		</div>
	</div>
	
	<%-- modal 수정 form --%>
	<div class="modal fade" id="modify-reply-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						수정 / 삭제
					</h5>		
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>		
				</div>
				<div class="modal-body">
					<input id="rno-input2" type="hidden" />
					<div class="form-group">
						<label for="reply-input2" class="col-form-label">
							댓글
						</label>
						<input type="text" class="form-control" id="reply-input2">
					</div>
					<div class="form-group">
						<label for="replyer-input2" class="col-form-label">
							작성자
						</label>
						<input readonly type="text" class="form-control" id="replyer-input2">
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button id="reply-modify-button" type="button" class="btn btn-primary">수정</button>
					<button id="reply-delete-button" type="button" class="btn btn-danger">삭제</button>				
				</div>
			</div>
		</div>
	</div>

</body>
</html>