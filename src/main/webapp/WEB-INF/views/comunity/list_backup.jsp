<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
	                    <h1 class="fw-bolder">Welcome to Blog Home!</h1>
	                    <p class="lead mb-0">A Bootstrap 5 starter layout for your next blog homepage</p>
	                </div>
	            </div>
	        </header>
	            <div class="row">
	                <div class="col-lg-12">
	                    <h1 class="page-header">게시판 목록</h1>
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	            <!-- /.row -->
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
	                            Board List Table 글 갯수 : ${total}<!-- <a href="register"><input type="button" value="Register New Board"></a> -->
	                            <button id="regBtn" type="button" class="btn btn-xs btn-info pull-right">신규등록</button>
	                        </div>
	                        <!-- /.panel-heading -->
	                        <div class="panel-body">
	                            <table width="100%" class="table table-striped table-bordered table-hover" id=""><!-- dataTables-example -->
	                                <thead>
	                                    <tr>
	                                        <th>#번호</th>
	                                        <th>제목</th>
	                                        <th>댓수~</th>
	                                        <th>작성자</th>
	                                        <th>생성일</th>
	                                        <th>수정일</th>
	                                    </tr>
	                                </thead>
	                               <!-- 우리 데이터 출력 위치  -->
	                               <c:forEach items="${list }" var="board">
	                               	<tr>
	                               		<td>${board.comunitynumber }</td>
	                               		<td><a class='move' href="<c:out value='${board.comunitynumber }'/>"><c:out value="${board.title }"/></a>
	                               		<td>${board.writer }</td>
	                               		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.createdate }"/></td>
	                               		<td>${board.updatedate }</td>
	                               	</tr>
	                               </c:forEach>
	                            </table>
	                            <!-- /.table-responsive -->
	                            <div class="row">
	                            	<div class="col-lg-12">
	                            		<form id="searchForm" action="/comunity/list" method="get">
	                            			<select name="type" >
	                            				<option value="" ${pageMaker.cri.post_type == null ? 'selected' : '' }>--</option>
												<option value="T" ${pageMaker.cri.post_type eq 'T' ? 'selected' : ''}>제목</option>                            			
												<option value="C" ${pageMaker.cri.post_type eq 'C' ? 'selected' : '' }>내용</option>                            			
												<option value="W" ${pageMaker.cri.post_type eq 'W' ? 'selected' : '' }>작성</option>                            			
												<option value="TC" ${pageMaker.cri.post_type eq 'TC' ? 'selected' : '' }>제목 or 내용</option>                            			
												<option value="TW" ${pageMaker.cri.post_type eq 'TW' ? 'selected' : '' }>제목 or 작성자</option>                            			
												<option value="TWC" ${pageMaker.cri.post_type eq 'TWC' ? 'selected' : '' }>제목 or 내용 or 작성자</option>                            			
	                            			</select>
	                            			<input type="text" name='keyword' value="${pageMaker.cri.keyword }">
	                            			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					            			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	                            			<button class="btn btn-info">검색</button>
	                            		</form>
	                            	
	                            	</div>
	                            </div>
	                            
<div class="card mb-4">
	<div class="card-header">Search</div>
	<div class="card-body">
		<div class="input-group">
			<input class="form-control" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search" />
			<button class="btn btn-primary" id="button-search" type="button">Go!</button>
		</div>
	</div>
</div>
	                            
<nav aria-label="Pagination">
    <ul class="pagination justify-content-center my-4">
        <c:if test="${pageMaker.prev}">
            <li class="page-item">
                <a class="page-link" th:href="${pageMaker.startPage-1}">Previous</a>
            </li>
        </c:if>
        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            <li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                <a class="page-link" th:href="${num}">${num}</a>
            </li>
        </c:forEach>
        <c:if test="${pageMaker.next}">
            <li class="page-item">
                <a class="page-link" th:href="${pageMaker.endPage + 1}">Next</a>
            </li>
        </c:if>
    </ul>
</nav>
	                            
	                            
	                          <%--페이징 버튼 관련 원본 지우지말고 냅두기. <div class ="pull-right">
	                           	<ul class="pagination">
									
									<c:if test="${pageMaker.prev }">
										<li class="paginate_button previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
									</c:if>
									
									<c:forEach var="num" begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }">
										<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' :''}">
											<a href="${num }">${num}</a></li>
									</c:forEach>
													
									<c:if test="${pageMaker.next}">
										<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
									</c:if>
													                          	
	                           	</ul>
	                           </div>  --%>
	                           
	                           
	                           <form id='actionForm' action="/comunity/list" method='get'>
	                           	<input type='hidden' name='pageNum' value=${pageMaker.cri.pageNum }>
	                           	<input type='hidden' name='amount' value=${pageMaker.cri.amount }>
	                           	<input type='hidden' name='type' value='${pageMaker.cri.post_type }'>
	                           	<input type="text" name='keyword' value="${pageMaker.cri.keyword }">
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
											<div class="modal-body">처리가 완료되었습니다.</div>
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
            
