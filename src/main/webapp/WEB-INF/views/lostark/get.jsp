<!-- 글 내용 보기 	GET -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Blog Post - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    </head>
    <body>
    <%@ include file="../includes/header.jsp" %>
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">${eventone.title }</h1>
          
                            
<%-- <c:choose>
    <c:when test="${pageContext.request.userPrincipal.name == listone.writer}">
        <div class="d-flex justify-content-end">
            <a href="/comunity/modify?comunitynumber=${listone.comunitynumber}" class="btn btn-primary btn-sm">수정</a>
            <a href="/comunity/remove?comunitynumber=${listone.comunitynumber}" class="btn btn-primary btn-sm ms-2">삭제</a>
        </div>
    </c:when>
</c:choose> --%>

<!-- Post meta content-->
<div class="text-muted fst-italic mb-2 text-end">${eventone.startDate}</div>

<!-- Post categories-->
<%-- <div class="d-flex justify-content-end">
    <a id="likebutton" class="badge bg-secondary text-decoration-none link-light me-2" 
       href="#!" data-postid="${listone.comunitynumber}" 
       data-email="${listone.writer}" data-post_type="COMUNITY">
       좋아요
    </a>
    <a class="badge bg-secondary text-decoration-none link-light me-2" href="#!">조회수 : ${listone.viewcount}</a>
    <a class="badge bg-secondary text-decoration-none link-light" href="#!">댓글수 : ${listone.replycount}</a>
</div> --%>

                        </header>
                        <!-- Post content-->
<section class="mb-5" style="min-height: 300px; text-align: center;">
    <img src="${eventone.thumbnail}" alt="Event Thumbnail" style="margin-left: auto; margin-right: auto;">
    <hr>
    이벤트 시작 날짜 : ${eventone.startDate}<br>
    이벤트 종료 날짜 : ${eventone.endDate}<br>
    이벤트 보상 수령 날짜 : ${eventone.rewardDate }<br>
    공식 홈페이지 링크 : <a href="${eventone.link}" target="_blank">${eventone.link}</a>
    <hr>
    <h1 class="fw-bolder">남겨주세요!</h1>
    <p class="lead mb-0">이벤트의 꿀팁을 남겨보세요</p>
</section>
                    </article>
                    
                    
                    <!-- 댓글 섹션 	-->
                    <section class="mb-5">
					    <div class="card bg-light">
					        <div class="card-body">
					            <!-- Comment form-->
					            <c:choose>
						            <c:when test="${pageContext.request.userPrincipal.name == null }">
						            	<textarea id="replytext" name="replytext" class="form-control" rows="3" readonly placeholder="Join the discussion and leave a comment!">댓글은 로그인한 사용자만 사용가능합니다.</textarea>
						            	<button class="btn btn-primary btn-xs pull-right"><a href="/customLogin" style='color:black;'>로그인</a></button>
						            </c:when>
						            <c:when test="${pageContext.request.userPrincipal.name != null }">
										<form id="commentForm" action="/replies/new" method="post" class="mb-4" enctype="application/x-www-form-urlencoded">
										<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
										    <textarea id="replytext" name="replytext" class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea>
										    <input type="hidden" name="postid" value="${eventone.id}">
										    <input type="text" name="post_type" value="EVENT">
										    <input type="hidden" name="email" value="${pageContext.request.userPrincipal.name }">
										    <button id="submitCommentBtn" class="btn btn-primary btn-xs pull-right">댓글 쓰기</button>
										</form>	
						            </c:when>
								
								</c:choose>	            
					            <!-- 댓글 리스트 -->
					            <ul class="chat">
					                <!-- 기존 댓글 리스트를 여기에 표시 -->
					            </ul>
					            
					            <div class="panel-footer">
					                <!-- 페이징 부분은 필요하다면 여기에 추가 -->
					            </div>
					        </div>
					    </div>
					</section>
                   <!-- 댓글 섹션 끝  -->
                   
                   
                   
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">Search</div>
                        <div class="card-body">
                            <div class="input-group">
                            	
                            	
                            	
                            	<div class="col-2 mx-auto">
				                    <select name="post_type" class="form-select">
				                        <option value="" ${pageMaker.cri.post_type == null ? 'selected' : '' }>--</option>
				                        <option value="COMUNITY" ${pageMaker.cri.post_type eq 'COMUNITY' ? 'selected' : ''}>제목 or 내용</option>
				                    </select>
				                </div>
				                <div class="col-7 mx-auto">
				                    <input class="form-control" type="text" name='keyword' value="${pageMaker.cri.keyword }" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search">
				                </div>
				                <div class="col-2 mx-auto">
				                    <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}' >
				                    <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				                    <button class="btn btn-primary">검색</button>
				                </div>
				                            
                            
                            
                            </div>
                        </div>
                    </div>
                    <!-- Categories widget-->

                    <!-- Side widget-->
					<div class="card mb-4 " style='height: 500px;'>
					    <div class="card-header">광고 배너</div>
					    <div class="card-body d-flex align-items-center justify-content-center">
					        <!-- 광고 내용을 추가하세요 -->
					    </div>
					</div>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->
        <!-- Core theme JS-->
     
     
     
<!-- 모달창 만들기이 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
                <div class="form-group1">
                    <label for="replytext">댓글 내용</label>
                    <input type="text" class="form-control" name="replytext" value="댓글 내용을 입력해주세요.">
                </div>
                <div class="form-group">
                    <input type="hidden" class="form-control" name="email" readonly value="${pageContext.request.userPrincipal.name }">
                </div>
      
                <div class="form-group">
                    <input type="hidden" class="form-control" name="post_type" value="post_type">
                </div>  
                <%-- <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/> --%>
				<div class="form-group" style='disply:none;'>
                    <input type="hidden" class="form-control" name="replyid" value="replyid">
                </div>   
                
                <div class="rereply-id" style="display: none;">
                    <input type="hidden" class="form-control" name="rereplyid" value="rereplyid" >
                </div>
                
                <div class="rereply-text" style="display: none;">
                	<label for="rereplytext" >대댓글 내용</label>
                    <input type="text" class="form-control" name="rereplytext" value="대댓글 내용을 입력해주세요.">
                </div>
                
                              
            </div>
            <div class="modal-footer">
            	<div class="modal-footer-default">
	            	<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
	            	<button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">close</button>
	            	<button id="modalClassBtn" type="button" class="btn btn-default" data-dismiss="modal">close</button>
	            	<button id="modalRegisterBtn" type="button" class="btn btn-primary">Register</button>
            	</div>
            	<div class="modal-footer-re">
	            	<button id="modalReBtn" type="button" class="btn btn-default text-end" data-dismiss="modal">대댓글 작성</button>
            	</div>
			</div>
        </div>
    </div>
</div>
     
     
    </body>

<Script type="text/javascript" src="/resources/js/reply.js"></Script>
<script type="text/javascript">
/*페이지 메이커의 자바스크립트 버전! */
var pageNum = 1;
var replyPagefooter = $(".panel-footer");
function showReplyPage(replyCnt) {
    var endNum = Math.ceil(pageNum / 10.0) * 10;
    var startNum = endNum - 9;
    var prev = startNum != 1;
    var next = false;
    if (endNum * 10 >= replyCnt) {
        endNum = Math.ceil(replyCnt / 10.0);
    }
    if (endNum * 10 < replyCnt) {
        next = true;
    }
    var str = "<ul class='pagination pull-right'>";
    if (prev) {
        str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
    }
    for (var i = startNum; i <= endNum; i++) {
        var active = pageNum == i ? "active" : "";
        str += "<li class='page-item " + active + "'><a class='page-link' href='"+i+"'>" + i + "</a>";
    }
    if (next) {
        str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
    }
    str += "</ul></div>";
    console.log(str);
    replyPagefooter.html(str); // 변수명 수정
}

$(document).ready(function(){
	var replyer = null;
	 var nowreplyer='<c:out value='${pageContext.request.userPrincipal.name}'/>';
	
	$(document).ajaxSend(function(e,xhr,options){
		var csrfHeaderName ="${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
	
	(function(){
		var postid = '<c:out value="${eventone.id}"/>';
		var post_type='EVENT';
		
		$.getJSON("/comunity/getAttachList",{comunitynumber:postid,post_type:post_type},function(arr){
			console.log(arr);
		});
	})();
	 var cnValue = '<c:out value="${eventone.id}"/>';
	    var ptValue = 'EVENT';
	    var replyUL = $(".chat");
	    showList(1);

	    $("#commentForm").submit(function (e) {
	        e.preventDefault(); // 기본 submit 동작 방지
	        $.ajax({
	            type: "POST",
	            url: "/replies/new",
	            data: $("#commentForm").serialize(), // 폼 데이터를 직렬화하여 전송
	            success: function (result) {
	                //alert(result); // 생성 결과에 따라 적절한 알림창 또는 처리를 수행
	                showList(-1); // 댓글 목록 갱신
	            },
	            error: function (xhr, status, error) {
	                console.error(xhr.responseText);
	            }
	        });
	    });
	    
	    function showList(page) {
	        console.log("show list " + page);
	        replyService.getList({ postid: cnValue, post_type: ptValue , page: page || 1 }, function (replyCnt, list) {
	            if (page == -1) {
	                pageNum = Math.ceil(replyCnt / 10.0);
	                showList(pageNum);
	                return;
	            }
	            var str = "";
	            if (list == null || list.length == 0) {
	                return;
	            }
	            for (var i = 0, len = list.length || 0; i < len; i++) {
	                var date = new Date(list[i].createdate);
	                var formattedDate = date.toLocaleString();
	                
	                if(list[i].isdelete == "delete"){
	                	str += "<li class='ms-3' >"; 
		                str += "<div class='ms-3 d-flex justify-content-between'>";
		                str += "<div class='text-end'>" + "삭제된 댓글입니다." + "</div>";
		                str += "</div>";
		                str += "<hr></li>";
	                }else if(list[i].depth > 0){
	                	str += "<ul>";
	                	str += "<li class='ms-3' data-replyid='" + list[i].replyid + "' data-post_type='" + list[i].post_type + "' data-replytext='" + list[i].replytext + "' data-email='" + list[i].email + "'>"; 
	                	str += "<div class='ms-3 d-flex justify-content-between'>";
	                	str += "<div class='fw-bold'>" + list[i].email + "</div>";
	                	str += "<div class='text-end'>" + formattedDate + "</div>";
	                	str += "</div>";
	                	str += "<div class='ms-3 d-flex justify-content-between align-items-center'>"; // 변경된 부분
	                	str += "<div><span>" + list[i].replytext + "</span></div>";
	                	if (nowreplyer == list[i].email) {
	                	    str += "<div>"; // 추가된 부분
	                	    str += "<a href='#' class='delete-link' style='text-decoration: none;'>삭제</a>";
	                	    str += "</div>"; // 추가된 부분
	                	}
	                	    str += "<a href='#' class='rereply-link ms-2' style='text-decoration: none;'>대댓글</a>"; // 오른쪽으로 간격 추가
	                	str += "</div>";
	                	str += "<hr></li></ul>";
					}else{
						str += "<li class='ms-3' data-replyid='" + list[i].replyid + "' data-post_type='" + list[i].post_type + "' data-replytext='" + list[i].replytext + "' data-email='" + list[i].email + "'>"; 
						str += "<div class='ms-3 d-flex justify-content-between align-items-center'>";
						str += "<div class='fw-bold'>" + list[i].email + "</div>";
						str += "<div class='text-end'>" + formattedDate + "</div>";
						str += "</div>";
						str += "<div class='ms-3 d-flex justify-content-between'>";
						str += "<div ><span >" + list[i].replytext + "</span></div>";
						if (nowreplyer == list[i].email) {
						    str += "<div class='d-flex'>"; // 변경된 부분
						    str += "<a href='#' class='delete-link me-2' style='text-decoration: none;'>삭제</a>"; // 오른쪽으로 간격 추가
						    str += "</div>";
						}
						    str += "<a href='#' class='rereply-link' style='text-decoration: none;'>대댓글</a>";
						str += "</div>";
						str += "<hr></li>";
					}
	            }
	            replyUL.html(str);
	            showReplyPage(replyCnt);
	        })
	    }
	    $(".chat").on("click", ".delete-link, .delete-btn", function (e) {
	        e.preventDefault();
	        e.stopPropagation(); // 이벤트 전파 방지

	        var replyid = $(this).closest("li").data("replyid");

	        // 사용자에게 확인 메시지 표시
	        var confirmDelete = confirm("댓글을 삭제하시겠습니까?");

	        if (confirmDelete) {
	            // Ajax를 이용하여 댓글 삭제
	            $.ajax({
	                type: "delete",
	                url : '/replies/' + replyid,
	                data: { replyid: replyid },
	                success: function (result) {
	                    alert(result);
	                    showList(pageNum);
	                },
	                error: function (xhr, status, error) {
	                    console.error(xhr.responseText);
	                }
	            });
	        }
	    });


		var modal2 = $(".modal2");
		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='replytext']");
		var modalInputReplyer = modal.find("input[name='email']");
		var modalInputReplyType = modal.find("input[name='post_type']");
		var modalInputReplyId = modal.find("input[name='replyid']");

		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		var modalReBtn = $("#modalReBtn");
		
		var modalFooterDe = $(".modal-footer-default");
		var modalFooterRe = $(".modal-footer-re");

		$("#addReplyBtn").on("click", function(e) {
		    modal.find("input").val("");
		    modal.find("input[name='replyer']").val(replyer);
		    modalInputReplyId.closest("div").hide();
		    modal.find("button[id != 'modalcloseBtn']").hide();

		    modalRegisterBtn.show();
		    modal.modal("show");
		});
		
		modalRegisterBtn.on("click", function(e) {
		    var reply = {
		        replytext: modalInputReply.val(),
		        email: modalInputReplyer.val(),
		        postid: cnValue,
		        post_type : modalInputReplyType.val()
		    };

		    replyService.add(reply, function(result) {
		        alert(result);
		        modal.find("input").val("");
		        modal.modal("hide");
		       	showList(-1);
		    });
		});
		
		$(".chat").on("click", "li", function (e) {
			
		    var replyid = $(this).data("replyid");
		    var post_type = $(this).data("post_type"); 
		    var replytext = $(this).data("replytext");
		    var email = $(this).data("email");
			
		    
		    if(email == nowreplyer){
			    
			   	/* 조건에 맞게 창 보이고 말고 하기. */
			    modalFooterDe.show();
			   	modalFooterRe.hide()
			   	$('.rereply-text').hide();
			   	$('.form-group1').show();
			    
			/* 이런식으로 모달창 쓰잘때기 없는 화면들 없애버리자. */   
			    modalInputReplyId.hide();
			    modalInputReplyType.hide();
			 /* ===================================	 */   
			    modalReBtn.hide();
			    modalFooterDe.show();
			    replyService.get(replyid, post_type, function (reply) {
			        modalInputReply.val(replytext);
			        modalInputReplyer.val(email);
			        modalInputReplyType.val(post_type);
			        modalInputReplyId.val(replyid);
	
			        modal.find("button[id!='modalCloseBtn']").hide(); // 수정: '!='로 변경
			        modalModBtn.show();
			        modalRemoveBtn.show();
			        modalReBtn.show();
	
			        $(".modal").modal("show");
			    });
		    }else{ e.preventDefault();}
		    
		});

		 $(".chat").on("click", ".rereply-link", function (e) {
		    e.preventDefault();
		    e.stopPropagation(); // 이벤트 전파 방지
		    $('#myModal').modal('show');
		    
		    var $li = $(this).closest("li");

		    // li 엘리먼트의 데이터 속성 가져오기
		    var replyid = $li.data("replyid");
		    var post_type = $li.data("post_type");
		    var email = "<c:out value='${pageContext.request.userPrincipal.name}'/>";
	        modalInputReplyer.val(email);
	        modalInputReplyType.val(post_type);
	        modalInputReplyId.val(replyid);
		   	
		   	/* 조건에 맞게 창 보이고 말고 하기. */
		    modalFooterDe.hide();
		   	modalFooterRe.show()
		   	$('.rereply-text').show();
		   	$('.form-group1').hide();
		    
		    modal.find("#modalReBtn").on("click", function(e) {
		        var reply = {
		            replytext: modal.find("input[name='rereplytext']").val(),
		            email: email,
		            postid: cnValue,
		            post_type: "EVENT",
		            rereplyid: replyid
		        };
		        replyService.readd(reply, function(result) {
		            alert(result);
		            modal.find("input").val("");
		            modal.modal("hide");
		            showList(-1);
		        });
		    });

		});
 


		
		modalModBtn.on("click",function(e){
			var reply = {replyid:modalInputReplyId.val(),email:modalInputReplyer.val() , post_type:modalInputReplyType.val() , replytext:modalInputReply.val()};
			
			replyService.update(reply, function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		modalRemoveBtn.on("click",function(e){
			var replyid = modalInputReplyId.val();
			replyService.remove(replyid,function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		replyPagefooter.on("click","li a",function(e){
			e.preventDefault();
			console.log("page click");
			
			var targetPageNum = $(this).attr("href");
			
			console.log("targetPageNum : "+targetPageNum);
			
			pageNum = targetPageNum;
			showList(pageNum);
		});

    $(".btn-primary.btn-sm.pull-right").on("click", function(e) {
        // 클릭한 버튼의 href 속성을 가져옴
        var linkHref = $(this).attr("href");

        // 사용자에게 확인 메시지 표시
        var confirmAction = confirm("정말로 진행하시겠습니까?");

        // 확인을 선택한 경우에만 해당 링크로 이동
        if (confirmAction) {
            window.location.href = linkHref;
        } else {
            // 취소한 경우 추가 동작을 넣을 수 있음
            // 예: 취소한 경우 아무 동작도 하지 않거나, 다른 동작 수행
            e.preventDefault(); // 기존 클릭 이벤트의 동작을 취소
        }
    });
    
    
 // 좋아요 버튼 클릭 이벤트
    $("#likebutton").on("click", function(e){
        e.preventDefault();
        
		var postid = $(this).data("postid");
    	var email = $(this).data("email");
    	var post_type = $(this).data("post_type");
        if ($(this).hasClass("liked")) {
			//좋아요 취소하는 일련의 과정
        } else {
            var likesvo = {
                postid: postid,
                email: email,
                post_type: post_type
            };

            $.ajax({
                type: 'POST',
                url: '/likes/new',
                contentType: 'application/json',
                data: JSON.stringify(likesvo),
                success: function(response){
                    // Handle success
                    if (response=="success") {
                    	$('#likebutton').removeClass('badge bg-secondary').addClass('badge bg-danger');
                    } else {
                        // Handle failure, show a message, or perform other actions
                        $('#likebutton').removeClass('badge bg-danger').addClass('badge bg-secondary');
                    }
                },
                error: function(xhr, status, error){
                    console.error("AJAX Error: " + status + " - " + error);
                }
            });
        }
    });
 
});


</script> 

    
    
</html>

