<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>블로그 글 - Start Bootstrap 템플릿</title>
    <!-- 파비콘-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
</head>
<body>
    <%@ include file="../includes/header.jsp" %>
    <!-- 페이지 내용-->
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-8">
            <!-- 글 작성 폼 -->
	            <form action="/comunity/insert" method="post" id="writeForm">
	                <div class="mb-3">
	                    <label for="title" class="form-label">제목</label>
	                    <input type="text" class="form-control" id="title" name="title" required>
	                </div>
	                <div class="mb-3">
	                    <label for="writer" class="form-label">작성자</label>
	                    <input type="text" class="form-control" id="writer" name="writer" required>
	                </div>
					<div class="mb-3" style="display:none;">
	                    <label for="comunitytext" class="form-label">본문내용</label>
	                    <input type="text" class="form-control" id="comunitytext" name="comunitytext" required>
	                </div>
	                <div class="mb-3">
	                    <label for="comunitytextdiv" class="form-label">내용</label>
	                    <div contentEditable='true' class="form-control" id="comunitytextdiv" name="comunitytextdiv" rows="5" required>내용을 입력해주세요.<ul></ul></div>
	                </div>
	                <button type="button" class="btn btn-primary" onclick="submitContent()">글 작성</button>
	            </form>
                <div class="uploadDiv">
                    <input type="file" name="uploadFile" multiple>
                    <button id="uploadBtn">Upload</button>
                </div>
	        </div>
            
            <!-- 사이드 위젯 -->
            <div class="col-lg-4">
                <!-- 검색 위젯 -->
                <div class="card mb-4">
                    <div class="card-header">검색</div>
                    <div class="card-body">
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="검색어를 입력하세요..." aria-label="검색어를 입력하세요..." aria-describedby="button-search" />
                            <button class="btn btn-primary" id="button-search" type="button">검색</button>
                        </div>
                    </div>
                </div>
                
                <!-- 카테고리 위젯 -->
                <div class="card mb-4">
                    <div class="card-header">카테고리</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <ul class="list-unstyled mb-0">
                                    <li><a href="#!">웹 디자인</a></li>
                                    <li><a href="#!">HTML</a></li>
                                    <li><a href="#!">무료 자료</a></li>
                                </ul>
                            </div>
                            <div class="col-sm-6">
                                <ul class="list-unstyled mb-0">
                                    <li><a href="#!">JavaScript</a></li>
                                    <li><a href="#!">CSS</a></li>
                                    <li><a href="#!">튜토리얼</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 사이드 위젯 -->
                <div class="card mb-4">
                    <div class="card-header">사이드 위젯</div>
                    <div class="card-body">이 사이드 위젯에 원하는 내용을 넣을 수 있습니다. Bootstrap 5 카드 컴포넌트를 사용하기 쉽고 기능적입니다!</div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 푸터 -->
    <footer class="py-5 bg-dark">
        <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
    </footer>
    
    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Core theme JS -->
    <script type="text/javascript" src="/resources/js/reply.js"></script>
    <script type="text/javascript">
        // 여러분의 JavaScript 코드가 여기에 들어갑니다.
    </script>
    
    <!-- 모달 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <!-- 모달 내용이 여기에 들어갑니다. -->
    </div>
</body>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script type="text/javascript">

	//div박스 정보 가져오기
	function submitContent() {
        // contentEditable 요소 가져오기
        var editableDiv = $("#comunitytextdiv").html();

        // 작성한 내용을 hidden input에 설정
        $("#comunitytext").val(editableDiv);

        // 폼 제출
        $("#writeForm").submit();
    }
	
	
	
	
	//이미지 클릭시 원본이미지 보여주기
	function showImage(fileCallPath) {
	    $(".bigPictureWrapper").css("display", "flex").show();
	    $(".bigPicture").html("<img src='/display?fileName=" + fileCallPath + "'>").animate({width: '100%', height: '100%'}, 1000);
	}
	
	
		$(document).ready(function(){
			
			var cloneObj = $(".uploadDiv");
			var comunitytextdiv = $("#comunitytextdiv ul");
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880;
	//파일 사이즈 확장자 체크 함수
			function checkExtension(fileName, fileSize){
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과 했습니다.");
					return false;
				}
				if(regex.test(fileName)){
					alert("해당 파일종류는 업로드 할 수 없습니다.");
					return false;
				}
				return true;
			}
	
	//업로드한 파일의 이름 출력 함수
	function showUploadedFile(uploadResultArr){
		alert("파일 이름 출력 함수");
		var str="";
		$(uploadResultArr).each(function(i,obj){
			
			if (!obj.image) {
			    str += "<li><5img src='/resources/img/attach.png'>" + obj.fileName + "</li>"; // 이 부분 수정
			} else {
			    var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
			    var originPath = obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName; // 이미지 클릭시 원본 이미지 보여주기 위해서 원본이미지의 경로도 설정.
			    str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\"><img src='/display?fileName=" + fileCallPath + "' class='img-fluid'></li><br>"; //이미지 올린거 클릭할떄 원본 이미지를 위한 스크립트, a 링크
			    //str += "<li><img src='/display?fileName=" + fileCallPath + "'></li>"; // 이 부분 수정
			}
		});
		comunitytextdiv.append(str);
		alert(str);
	}
	
	//파일 업로드 	
			$('#uploadBtn').on("click", function(e){
			    var formData = new FormData();
			    var inputFile = $("input[name='uploadFile']");
			    var files = inputFile[0].files;
			    console.log(files);
			    
			    for(var i = 0; i < files.length; i++){
			        if(!checkExtension(files[i].name, files[i].size)){
			            return false;
			        }
			        formData.append("uploadFile", files[i]);
			    }
			    
			    $.ajax({
			        url: '/uploadAjaxAction',
			        processData: false,
			        contentType: false,
			        data: formData,
			        type: 'POST',
			        success: function(result){
			            alert("Upload");
			            showUploadedFile(result);
			            
						//업로드 버튼 처리 함수		
			            $(".uploadDiv").html(cloneObj.html());
			        }
			    });
			});
		});
	
	
		
		
	</script>

</html>