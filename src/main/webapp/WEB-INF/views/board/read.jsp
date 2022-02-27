<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
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
<script type="text/javascript" src="${root }/resources/js/board_reply.js"></script>
<script type="text/javascript">
var root = '${root}';
</script>
<script>

var num = ${boardVO.board_bno };
var replyer= null;
<sec:authorize access="isAuthenticated()">
	replyer = '<sec:authentication property="principal.username"/>';
</sec:authorize>
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
var flag = false; 

	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	}); 
	$(document).ready(function(){
		//날짜 형식 바꾸는 함수 dateString
		function dateString(date) {
			var d = new Date();
			return d.toISOString().split("T")[0];
		}
		
		
		//댓글 목록 가져오기 function
		function showList() {
			
			replyService.getList(
					{num:num}, 
					function(list){
					//console.log(list.length);
					//위에 list는 controller에서 ResponseEntity에 붙여준 list
					var replyUl = $("#reply-ul");
					if(list.length > 0) {
						flag = true;
					} else {
						flag = false;
					}
					
					//console.log(flag);
					//이전에 append된 것 비우기
					replyUl.empty();
					for (var i = 0; i < list.length; i++) {
						var replyLi = '<li class="media" data-rno="' 
						+ list[i].reply_bno + '"><div class="reply_txt" style="border-radius: 0px;">'
						+ "<div class='media-body' style='border-radius: 0px; display:flex; justify-content: space-between;'><span class='re'>"
						+ list[i].reply_id + '</span><span class="float-right">' 
						+ dateString(list[i].regdate) + "</span></div><div class='reply_body'>"  + 
						list[i].reply_content + '</div></li></div>';
						
						replyUl.append(replyLi);
					}
			});
		}
			
		
		//새 댓글 버튼 클릭 이벤트 처리
		$("#new-reply-btn").click(function(){
			$("#replyer-input").val(replyer);
			$("#new-reply-modal").modal("show");
		});
		
		
		//새 댓글등록 버튼 클릭 이벤트 처리
		$("#reply-submit-btn").click(function(){
			
			var reply = $("#reply-input").val();
			
			var reply = {board_bno:num, reply_content:reply, reply_id:replyer};
			
			
			replyService.add(reply, 
					function(){
						//성공했을 때 실행
						showList();
						alert("댓글 등록에 성공하였습니다.");
					},
					
					function(){
						alert("댓글 등록에 실패하였습니다.");
				
			});
			
			//모달 닫기
			$("#new-reply-modal").modal("hide");
			
			//모달 내 input element value 초기화
			$("#new-reply-modal input").val("");
			
		});
		
		$("#reply-ul").on("click", "li", function(){
			//li들 중 click받은 li의 data-rno를 출력하도록
			console.log($(this).attr("data-rno"));
			console.log("***************");
			
			//modify modal form으로 댓글내용 get
			var rno = $(this).attr("data-rno");
			
			
			replyService.get(rno, function(data) {
				$("#rno-input2").val(rno);
				$("#reply-input2").val(data.reply_content);
				$("#replyer-input2").val(data.reply_id);
				//modal show도 replyService.get이 성공하면!
				$("#modify-reply-modal").modal("show");
			});
			
			
		});
		
		//수정 버튼 이벤트 처리
		$("#reply-modify-btn").click(function(){
			var originalReplyer = $("#replyer-input2").val();
			console.log("Original Replyer: " + originalReplyer);
			
			var rno = $("#rno-input2").val();
			var reply = $("#reply-input2").val();
			
			console.log("rno:"+  rno + "reply : " + reply);
			
			var data = {reply_bno: rno, reply_content: reply, reply_id: originalReplyer};
			
			if (!replyer) {
				alert("로그인 후에 수정이 가능합니다.");
				$("#modify-reply-modal").modal("hide");
				return;
				
			}
			
			
			if (replyer != originalReplyer) {
				alert("자신이 작성한 댓글만 수정이 가능합니다.");
				$("#modify-reply-modal").modal("hide");
				return;
			}
			
			
			replyService.update(
				data,
				function() {
					alert("수정이 완료되었습니다.");
					showList();
				}
			);
			
			$("#modify-reply-modal").modal("hide");
		});
		
		$("#reply-delete-btn").click(function(){
			var rno = $("#rno-input2").val();
			console.log("RNO: " + rno);
			console.log("REPLYER: " + replyer);
			
			
			if (!replyer) {
				alert("로그인 후에 삭제가 가능합니다.");
				$("#modify-reply-modal").modal("hide");
				return;
				
			}
			var originalReplyer = $("#replyer-input2").val();
			console.log("Original Replyer: " + originalReplyer);
			
			if (replyer != originalReplyer) {
				alert("자신이 작성한 댓글만 삭제가 가능합니다.");
				$("#modify-reply-modal").modal("hide");
				return;
			}
			
			replyService.remove(
					rno, replyer,
					function(){
						alert("삭제가 완료되었습니다.");
						showList();
			});
			
			$("#modify-reply-modal").modal("hide");
			
		});
		//댓글 목록 가져오기 실행
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
       		 <jsp:include page="/resources/include/board_read.jsp" />
       </div>
       
       <div class="empty1">

       </div>
       
        <div class="empty2">
       
       </div>
       
       <div class="empty3"> 
       
       </div> 
       
       <div class="empty4">
       
       </div>
        
    </div>
    
    <div class="footer">
        <jsp:include page="/resources/include/main_footer.jsp" />
    </div>
    

<!-- 댓글작성 modal  -->
	
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
						<label for="reply-input" class="col-form-label">댓글</label>
						<input type="text" class="form-control" id="reply-input">
					</div>
					<div class="form-group">
						<label for="replyer-input" class="col-form-label">작성자</label>
						<input type="text" class="form-control" id="replyer-input" readonly>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button id="reply-submit-btn" type="button" class="btn btn-primary" >등록</button>
				</div>
			
			
			</div>
			
		</div>
	</div>


<!-- 수정하기 modal -->	
	<div class="modal fade" id="modify-reply-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						수정/삭제
					</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<input type="hidden" id="rno-input2" type="text" class="form-control" id="reply-input2">
					<div class="form-group">
						<label for="reply-input2" class="col-form-label">댓글</label>
						<input type="text" class="form-control" id="reply-input2">
					</div>
					<div class="form-group">
						<label for="replyer-input2" class="col-form-label">작성자</label>
						<input readonly type="text" class="form-control" id="replyer-input2">
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button id="reply-modify-btn" type="button" class="btn btn-primary" >수정</button>
					<button id="reply-delete-btn" type="button" class="btn btn-danger" >삭제</button>
				</div>
			
			
			</div>
			
		</div>
	</div>
	


</body>
</html>