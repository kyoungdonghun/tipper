<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style>
    table {
        table-layout: fixed;
        width: 100%;
    }
        th, td {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    
    /* 각 열의 너비를 지정하세요. 예를 들어, 첫 번째 열은 10%, 두 번째 열은 20%로 지정합니다. */
    th:nth-child(1),
    td:nth-child(1) {
        width: 5%;
        max-height: 10px;
    }

    th:nth-child(2),
    td:nth-child(2) {
        width: 5%;
        max-height: 10px;
    }
    
        th:nth-child(3),
    td:nth-child(3) {
        width: 50%;
        max-height: 10px;
    }
	
	    th:nth-child(4),
    td:nth-child(4) {
        width: 5%;
        max-height: 10px;
    }
    /* 글 내용 열은 남은 공간을 모두 차지하도록 설정 */
    th:nth-child(5),
    td:nth-child(5) {
        width: 5%;
        max-height: 10px;
    }
    
        th:nth-child(6),
    td:nth-child(6) {
        width: 5%;
        max-height: 10px;
    }
    
         th:nth-child(7),
    td:nth-child(7) {
        width: 10%;
        max-height: 10px;
    } 
    
</style>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
 		<link href="/resources/css/mainstyles.css" rel="stylesheet"/> 	
     </head>
    <body>
    <%@ include file="../includes/header.jsp" %>
		<div class="container">
			<header class="py-5 bg-light border-bottom mb-4">
	            <div class="container">
	                <div class="text-center my-5">
	                    <h1 class="fw-bolder">자유게시판</h1>
	                    <p class="lead mb-0">자유롭게 대화를 나눠보세요!</p>
	                </div>
	            </div>
	            
	            
	<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
    
    
        <div class="carousel-item active">
            <div class="d-flex">
             <c:forEach items="${list}" var="board" varStatus="loop">
   				 <c:if test="${loop.index < 5}">
	                <div class="card" style="width: 18rem;">
	                    <div class="card-body">
	                        <h5 class="card-title" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${board.title}</h5>
	                        <p class="card-text">${board.comunitynumber }</p>
	                    </div>
	                </div>
				</c:if>
             </c:forEach>   
            </div>
        </div>
        
        
		<div class="carousel-item">
            <div class="d-flex">
             <c:forEach items="${list}" var="board" varStatus="loop">
   				 <c:if test="${loop.index >= 5 && loop.index <= 10}">
	                <div class="card" style="width: 18rem;">
	                    <div class="card-body">
	                        <h5 class="card-title" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${board.title}</h5>
	                        <p class="card-text">${board.writer }</p>
	                    </div>
	                </div>
				</c:if>
             </c:forEach>   
            </div>
        </div>

       

        <!-- Add more carousel items with pairs of cards as needed -->
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
	        </header>
	            <div class="row">
	                <div class="col-lg-12">
	                    <h1 class="page-header">댓글수 정렬</h1>
	                </div>
	            </div>
	            <!-- /.row -->
	            <hr>
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
            <div class="panel-heading d-flex justify-content-between">
                <span>작성글 수 : ${total}</span>
                <button id="regBtn" type="button" class="btn btn-xs btn-primary"><a href="/comunity/insert" style='color:white; text-decoration: none;'>글쓰기</a></button>
            </div>
            <hr>
	                        <!-- /.panel-heading -->
	                        <div class="panel-body">
	                            <table width="100%" class="table table-striped table-bordered table-hover" id=""><!-- dataTables-example -->
	                                <thead>
	                                    <tr>
	                                        <th>글 번호</th>
	                                       <!--  <th>내용</th> -->
	                                        <th>작성자</th>
	                                        <th>제목</th>
	                                        <th><a href="/comunity/listview" style='text-decoration: none;'>조회수</a></th>
	                                       <th><a href="/comunity/listreply" style='text-decoration: none;'>댓글수</a></th>
	                                        <th><a href="/comunity/listlikes" style='text-decoration: none;'>좋아요</a></th>
	                                        <th>작성일</th>
	                                    </tr>
	                                </thead>
	                               <!-- 우리 데이터 출력 위치  -->
	                               <c:forEach items="${list }" var="board">
	                               	<tr>
	                               		<td>${board.comunitynumber }</td>
	                               		<td>${board.writer }</td>
	                               		<td><a class='move' style=' text-decoration: none;' href="<c:out value='${board.comunitynumber }'/>"><c:out value="${board.title }"/></a>
	                               		<%-- <td>${board.comunitytext }</td> --%>
	                               		<td>${board.viewcount }</td>
	                               		<td>${board.replycount }</td>
	                               		<td>${board.likecount }</td>
	                               		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.createdate }"/></td>
	                               	</tr>
	                               </c:forEach>
	                            </table>
	                            <!-- /.table-responsive -->
<div class="card mb-4">
    <div class="card-header">Search</div>
    <div class="card-body">
        <form id="searchForm" action="/comunity/list" method="get">
            <div class="row g-3 align-items-center">
                <div class="col-1 mx-auto">
                    <select name="post_type" class="form-select">
                        <option value="" ${pageMaker.cri.post_type == null ? 'selected' : '' }>--</option>
                        <option value="COMUNITY" ${pageMaker.cri.post_type eq 'COMUNITY' ? 'selected' : ''}>제목 or 내용</option>
                    </select>
                </div>
                <div class="col-10 mx-auto">
                    <input class="form-control" type="text" name='keyword' value="${pageMaker.cri.keyword }" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search">
                </div>
                <div class="col-1 mx-auto">
                    <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}' >
                    <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                    <button class="btn btn-primary">검색</button>
                </div>
            </div>
        </form>
    </div>
</div>
						</div>
	                         <div class ="pull-right">
	                           	<ul class="pagination justify-content-center my-4">
									
									<c:if test="${pageMaker.prev }">
										<li class="page-item previous"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
									</c:if>
									
									<c:forEach var="num" begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }">
										<li class="page-item ${pageMaker.cri.pageNum == num ? 'active' :''}">
											<a class="page-link" href="${num }">${num}</a></li>
									</c:forEach>
													
									<c:if test="${pageMaker.next}">
										<li class="page-link" class="page-item next"><a href="${pageMaker.endPage +1 }">Next</a></li>
									</c:if>
													                          	
	                           	</ul>
	                           </div>
	                           
	                           <form id='actionForm' action="/comunity/list" method='get'>
	                           	<input type='hidden' name='pageNum' value=${pageMaker.cri.pageNum }>
	                           	<input type='hidden' name='amount' value=${pageMaker.cri.amount }>
	                           	<input type='hidden' name='type' value='${pageMaker.cri.post_type }'>
	                           	<input type="hidden" name='keyword' value="${pageMaker.cri.keyword }">
	                           </form>
	                        </div>
	                        <!-- /.panel-body -->
	                            <!-- Modal  추가 -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">Modal title</h4>
											</div>
											<!-- <div class="modal-body">처리가 완료되었습니다.</div> -->
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
												<button type="button" class="btn btn-primary" data-dismiss="modal">Save
													changes</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- /.modal -->
	                            
	                            
	                            
	                            
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
	                <!-- /.col-lg-6 -->
	            </div>
            <!-- /.row -->
           	</body> 
 <script>
   $(document).ready(function(){
      var result='<c:out value="${result}"/>';
      if (result !== '' && !history.state) {
          //alert(result);
       }
      
      //checkModal(result);
      
      history.replaceState({}, null, null);
      
      /* function checkModal(result){
         if(result ==='' || history.state){
            return;
         }
         if(parseInt(result) > 0){
            $(".modal-body").html("게시글 "+parseString(result)+"이 등록되었습니다.");
         }
            $("#myModal").modal("show");
      } */
      $("#regBtn").on("click",function(){
         self.location="/comunity/insert";
      });
      
      var actionForm= $("#actionForm");
      $(".page-item a").on("click", function(e){
         e.preventDefault();
         
         console.log('click');
         actionForm.find("input[name='pageNum']").val($(this).attr("href"));
         actionForm.submit();
      });
      
     /*  $(".move").on("click", function(e){
         
         e.preventDefault();
         
         actionForm.append("<input type='hidden' name='postid' value='"+$(this).attr("href")+"'> ");
         
         actionForm.attr("action","/board/get");
         actionForm.submit();
      }); */
      
      var searchForm = $("#searchForm");
      $("#searchForm button").on("click",function(e){
         if(!searchForm.find("option:selected").val()){
            alert("검색종류를 선택하세요");
            return false;
         }
         if(!searchForm.find("input[name='keyword']").val()){
            alert("키워드를 입력하세요");
            return false;
         }
         e.preventDefault();
         
         searchForm.find("input[name='pageNum']").val("1");
         
         searchForm.submit();
      });
      
      $(".move").on("click", function(e){
          
    	  
          var existingPbnoInput = actionForm.find('input[name="comunitynumber"]');
          if (existingPbnoInput) {
              existingPbnoInput.remove();
          }
          e.preventDefault();
          
          actionForm.append("<input type='hidden' name='comunitynumber' value='"+$(this).attr("href")+"'> ");
          
          actionForm.attr("action","/comunity/get");
          actionForm.submit();
       });
      
   });
   
   $(".card-text").on("click", function(e){
	   var cardText = $(this).text();
	   // 이동할 링크 주소 설정
	    var link = "/comunity/get?comunitynumber=" + encodeURIComponent(cardText);

	    // 현재 창에서 링크로 이동
	    window.location.href = link;
   })
   
</script>
