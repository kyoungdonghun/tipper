<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>







<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script type="text/javascript">

	//div박스 정보 가져오기
	function submitContent() {
		  // contentEditable 요소 가져오기
		  var editableDiv = document.getElementById("editableContent");

		  // 편집된 내용 가져오기
		  var editedContent = editableDiv.innerHTML;

		  // 서버에 전송할 수 있도록 Ajax 또는 기타 방법을 사용하여 서버에 데이터 전송
		  // 이 예제에서는 간단히 콘솔에 출력하는 것으로 대체
		  console.log("편집된 내용:", editedContent);

		  // 실제로는 서버로 데이터를 전송하는 코드를 추가해야 합니다.
		}
	
	
	
	
	//이미지 클릭시 원본이미지 보여주기
	function showImage(fileCallPath) {
	    $(".bigPictureWrapper").css("display", "flex").show();
	    $(".bigPicture").html("<img src='/display?fileName=" + fileCallPath + "'>").animate({width: '100%', height: '100%'}, 1000);
	}

	
	
	
	
		$(document).ready(function(){
			
			var cloneObj = $(".uploadDiv");
			var uploadResult = $(".uploadResult ul");
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
				alert("dd");
				return true;
			}
	
	//업로드한 파일의 이름 출력 함수
	function showUploadedFile(uploadResultArr){
		var str="";
		$(uploadResultArr).each(function(i,obj){
			
			if (!obj.image) {
			    str += "<li><5img src='/resources/img/attach.png'>" + obj.fileName + "</li>"; // 이 부분 수정
			} else {
			    var fileCallPath = encodeURIComponent(obj.uploadPath + "/"+"s_" + obj.uuid + "_" + obj.fileName);
			    var originPath = obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName; // 이미지 클릭시 원본 이미지 보여주기 위해서 원본이미지의 경로도 설정.
			    str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\"><img src='/display?fileName=" + fileCallPath + "'></li>"; //이미지 올린거 클릭할떄 원본 이미지를 위한 스크립트, a 링크
			    //str += "<li><img src='/display?fileName=" + fileCallPath + "'></li>"; // 이 부분 수정
			}
		});
		uploadResult.append(str);
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
</head>
<style>
  textarea {
    width: 100%;
    height: 6.25em;
    border: none;
    resize: none;
  }
</style>
<body>
	<h1>Upload with Ajax</h1>
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	<button id="uploadBtn">Upload</button>

	
<!-- 	사진 업로드 하고 올라간 사진 썸네일 가져오는 디브 -->
	<div contentEditable='true' class='uploadResult'>
		사용이 되는거같나
		<ul>
		
		</ul>
	</div>

	
	
	<!-- 사진 업로드 하고 올라간 사진 클릭하면 원본 보여주는 디브 -->
	<div class='bigPictureWrapper'>
		<div class='bigPicture'>
		</div>
	</div>
<!-- 	
	<div class="css-1fyhyja exmnnzq4"><article class="toastui-editor-contents"><p><img src="https://opgg-com-image.akamaized.net/attach/images/20240109014918.2805785.jpg" alt="image.png"></p></article></div>
	
	<div contenteditable="true" translate="no" class="ProseMirror toastui-editor-contents"><p>ㅁㅇㄴㄹㅁㄴㅇㄹㅁㄹㄴㅇ<img src="https://opgg-com-image.akamaized.net/attach/images/20240109075022.4083579.jpg" contenteditable="false"><img class="ProseMirror-separator" alt=""><br class="ProseMirror-trailingBreak"></p></div>
	
	 -->
	
	<button onclick="submitContent()">내용 제출</button>
	
	
	
	
	
</body>
</html>