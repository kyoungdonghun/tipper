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
	            <form role="form" action="/comunity/insert" method="post" id="writeForm">
	            	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	                <div class="mb-3">
	                    <label for="title" class="form-label">제목</label>
	                    <input type="text" class="form-control" id="title" name="title" required>
	                </div>
	                <div class="mb-3">
	                    <label for="writer" class="form-label">작성자</label>
	                    <input type="text" class="form-control" id="writer" name="writer" value="${pageContext.request.userPrincipal.name}" readonly required>
	                </div>
					<div class="mb-3" style='display:none;'>
	                    <label for="comunitytext" class="form-label">본문내용</label>
	                    <input type="text" class="form-control" id="comunitytext" name="comunitytext" value="테스트?" required>
	                </div>
	                <div class="mb-3">
	                    <label for="comunitytextdiv" class="form-label">내용</label>
	                    <div contentEditable='true' class="form-control" id="comunitytextdiv" name="comunitytextdiv" rows="5" required>내용을 입력해주세요.<ul></ul></div>
	                </div>
	                <button type="submit" class="btn btn-primary">글 작성</button>
                </form>
                
                <!-- 파일 첨부 부분을 폼 밖으로 이동 -->
                <hr>
                <div class="panel-heading"><h2>파일첨부</h2></div>
                <div class="panel-body">
                    <div class="uploadDiv">
                        <input type="file" name="uploadFile" multiple>
                    </div>
                    
                    <div class="uploadResult">
                        <ul></ul>
                    </div>
	                <!-- </div> -->
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
                					<div class="card mb-4 " style='height: 500px;'>
					    <div class="card-header">광고 배너</div>
					    <div class="card-body d-flex align-items-center justify-content-center">
					        <!-- 광고 내용을 추가하세요 -->
					    </div>
					</div>
                
                <!-- 사이드 위젯 -->
            </div>
        </div>
    </div>
    
    <!-- 푸터 -->
    <footer class="py-5 bg-dark">
        <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
    </footer>
    
    <!-- Bootstrap core JS -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->
    
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

<!-- <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script> -->
	<script type="text/javascript">

		$(document).ready(function(){
			var csrfHeaderName ="${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";

			var formObj = $("form[role='form']");
			$("button[type='submit']").on("click", function(e){
				e.preventDefault();
				console.log("submit clicked");
				
		        // contentEditable 디브에서 내용 추출
		        var comunityTextContent = $("#comunitytextdiv").html();

		        // 추출된 내용을 comunitytext 입력 필드의 값으로 설정
		        $("input[name='comunitytext']").val(comunityTextContent);
				
				var str = "";
				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					console.dir(jobj);
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].type' value='"+jobj.data("type")+"'>";
				});
				formObj.append(str).submit();
			});
			
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
	
			//파일 업로드 	
			$("input[type='file']").change(function(e){
				
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
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
					beforeSend: function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data: formData,
					
					type: 'POST',
					dataType: 'json',
					success: function(result){
						console.log(result);
						showUploadResult(result); // 업로드 결과 처리 함수
					}
				});//$.ajax
				
			});//$("input[type='file']")
			
			
			function showUploadResult(uploadResultArr) {
			    if (!uploadResultArr || uploadResultArr.length == 0) {
			        return;
			    }
			    var uploadUL = $(".uploadResult ul");
			    var uploadUL2 = $("#comunitytextdiv ul");
			    
			    $(uploadResultArr).each(function (i, obj) {
			        var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			        var imageSrc = "/display?fileName=" + fileCallPath;
			        
			        var str = "<li data-path='" + obj.uploadPath + "'";
			        str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'";
			        str += " ><div>";
			        str += "<img src='" + imageSrc + "'><br>";
			        str += "<span> " + obj.fileName + "</span>";
			        str += "<button type='button' data-file=/" + fileCallPath + " data-type='image' class=''><i class=''>x</i></button>";
			        str += "</div>";
			        str += "</li>";
			        
			        uploadUL.append(str);
			        
			        // Reversed image source for uploadUL2
			        var fileCallPath2 = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
			        var imageSrc2 = "/display?fileName=" + fileCallPath2;
			        
			        var str2 = "<li data-path='" + obj.uploadPath + "'";
			        str2 += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'";
			        str2 += " style='list-style:none;'><div>";
			        str2 += "<img src='" + imageSrc2 + "' class='img-fluid'><br>";
			        str2 += "</div>";
			        str2 += "</li>";
			        
			        uploadUL2.append(str2);
			    });
			}
			
			$(".uploadResult").on("click", "button", function(e){
				
				console.log("delete file");
				
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				
				var targetLi = $(this).closest("li");
				
				$.ajax({
					url: '/deleteFile',
					data: {fileName: targetFile, type:type},
					beforeSend: function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					dataType: 'text',
					type: 'POST',
					success: function(result){
						targetLi.remove();
						
						//큰사진도 같이 지우는 란
						var uploadUL2 = $("#comunitytextdiv ul");
			            var dataUUID = targetLi.data("uuid");
			            uploadUL2.find("li[data-uuid='" + dataUUID + "']").remove();
			           	//=========
					}
				}); //$.ajax
				
			});
/* 			var cloneObj = $(".uploadDiv");
			var comunitytextdiv = $("#comunitytextdiv ul");
	*/
		});
	</script>
</html>