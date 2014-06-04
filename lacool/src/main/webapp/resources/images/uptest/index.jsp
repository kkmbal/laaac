<%@page contentType="text/html;charset=UTF-8" %>

<html>
 <head>
  <title> image test </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="js/jquery.form.js"></script>
  <script type="text/javascript" src="js/tea.js"></script>
 </head>

 <body>
  <%--
  <div id="dropbox" style="width: 360px; height: 80px; border: 1px solid #aaa;">
    <span id="droplabel">
      이곳에 파일을 드랍해 주세요...
    </span>
  </div>
<img id="preview" alt="[ preview will display here ]" />
  
  
  <h1>File API Demo</h1>
  <h3>파일(들)을 선택하세요.</h3>
  <!-- multiple 속성을 이용하면 파일을 다중으로 업로드 할 수 있음 -->
  <input id="files-upload" type="file" multiple>
  
  <h3>Uploaded files</h3> 
  <ul id="file-list"> 
    <li class="no-items">(파일이 선택되 않음)</li> 
  </ul>  
  
  <script type="text/javascript">
 
  // dnd *******************************************************
  
  function dragEnter(event) {
      event.stopPropagation();
      event.preventDefault();
    }
    function dragExit(event) {
      event.stopPropagation();
      event.preventDefault();
    }
    function dragOver(event) {
      event.stopPropagation();
      event.preventDefault();
    }
    function drop(event) {
      event.stopPropagation();
      event.preventDefault();
       
      var files = event.dataTransfer.files;
      var count = files.length;
       
      // 오직 한개 이상의 파일이 드랍된 경우에만 처리기를 호출한다.
      if (count > 0)
        handleFiles(files);
    }
    function handleFiles(files) {
      var file = files[0];
       
      document.getElementById("droplabel").innerHTML = "Processing " + file.name;
       
      var reader = new FileReader();
       
      // 파일 리더의 이베트 핸들러 정의
      reader.onloadend = handleReaderLoadEnd;
       
      // 파일을 읽는 작업 시작
      reader.readAsDataURL(file);
    }
    function handleReaderLoadEnd(event) {
      var img = document.getElementById("preview");
      img.src = event.target.result;
    }

    var dropbox = document.getElementById("dropbox")
     
    // 이벤트 핸들러 할당
    dropbox.addEventListener("dragenter", dragEnter, false);
    dropbox.addEventListener("dragexit", dragExit, false);
    dropbox.addEventListener("dragover", dragOver, false);
    dropbox.addEventListener("drop", drop, false);
  
    
    
    //file ************************************************************8
    
    var filesUpload = document.getElementById("files-upload"),
    fileList = document.getElementById("file-list");

	function traverseFiles (files) {
	  var li,
	      file,
	      fileInfo;
	  fileList.innerHTML = "";
	    
	  for (var i=0, il=files.length; i<il; i++) {
	    li = document.createElement("li");
	    file = files[i];
	    fileInfo = "<div><strong>Name:</strong> " + file.name + "</div>";
	    fileInfo += "<div><strong>Size:</strong> " + file.size + " bytes</div>";
	    fileInfo += "<div><strong>Type:</strong> " + file.type + "</div>";
	    li.innerHTML = fileInfo;
	    fileList.appendChild(li);
	  };
	  
	  
	  
	};
	
	filesUpload.onchange = function () {
	  traverseFiles(this.files);
	};


  </script>  
--%>

<%--
  <div id="page-wrapper">

    <h1>Text File Reader</h1>
    <div>
      Select a text file: 
      <input type="file" id="fileInput">
    </div>
    <pre id="fileDisplayArea"></pre>

  </div>
  
  <script type="text/javascript">
  window.onload = function() {
	    var fileInput = document.getElementById('fileInput');
	    var fileDisplayArea = document.getElementById('fileDisplayArea');

	    fileInput.addEventListener('change', function(e) {
	      // Put the rest of the demo code here.
		  var file = fileInput.files[0];
		  var textType = /text.*/;
		  
		  alert(textType);
		  alert(file.type);
		  
		  if (file.type.match(textType)) {
			  var reader = new FileReader();

			  reader.onload = function(e) {
			    fileDisplayArea.innerText = reader.result;
			  }

			  reader.readAsText(file);  
			} else {
			  fileDisplayArea.innerText = "File not supported!";
			}		  
	    });
	}
  
  </script>
  
 --%>

<form name="frm1" id="frm1" enctype="multipart/form-data" method="post" action="upload.jsp"> 
     <div id="page-wrapper">

    <h1>Image File Reader</h1>
    <div>
      Select an image file: 
      <input type="file" id="fileInput" name="file" title="찾기">
    </div>
    <div id="fileDisplayArea"></div>
    <div id="filesInfo"></div>
  </div>
  <input type="button" value="go" onclick="goUpload()">
</form> 

<form name="frm2" id="frm2" method="post" action="upload.jsp"> 
      <input type="hidden" id="fileInput2" name="image" value="">
</form>

 <canvas id="tutorial" width="100" height="100"></canvas>
 
  <script type="text/javascript">
   
  if (window.File && window.FileReader && window.FileList && window.Blob) {
	  // Great success! All the File APIs are supported.
	} else {
	  alert('The File APIs are not fully supported in this browser.');
	}  
  
  
  window.onload = function() {
	  //$('#input').get(0).files[0];
	    var fileInput = document.getElementById('fileInput');
	    var fileDisplayArea = document.getElementById('fileDisplayArea');

	    fileInput.addEventListener('change', function(e) {
	    	var file = fileInput.files[0];
	    	var imageType = /image.*/;

	    	
	    	//alert(file.type);
	    	if (file.type.match(imageType)) {
	    	  var reader = new FileReader();

	    	  reader.onload = function(e) {
	    	    fileDisplayArea.innerHTML = "";

	    	    // Create a new image.
	    	    var img = new Image();
	    	    // Set the img src property using the data URL.
	    	    //alert(reader.result)
	    	    img.src = reader.result;
	    	    //img.height = 100;
	    	    //img.width = 100;

	    	    // Add the image to the page.
	    	    fileDisplayArea.appendChild(img);
	    	    
	    	    //====>

			    img.onload = function() {
			 
			        var MAX_WIDTH = 400;
			        var MAX_HEIGHT = 300;
			        var tempW = img.width;
			        var tempH = img.height;
			        if (tempW > tempH) {
			            if (tempW > MAX_WIDTH) {
			               tempH *= MAX_WIDTH / tempW;
			               tempW = MAX_WIDTH;
			            }
			        } else {
			            if (tempH > MAX_HEIGHT) {
			               tempW *= MAX_HEIGHT / tempH;
			               tempH = MAX_HEIGHT;
			            }
			        }

			        //var canvas = document.createElement('canvas');
			        var canvas = document.getElementById('tutorial');
			        canvas.width = tempW;
			        canvas.height = tempH;
			        var ctx = canvas.getContext("2d");
			        ctx.drawImage(this, 0, 0, tempW, tempH);
			        var dataURL = canvas.toDataURL("image/jpeg");
			// alert(dataURL);
			        var xhr = new XMLHttpRequest();
			        xhr.onreadystatechange = function(ev){
			            document.getElementById('filesInfo').innerHTML = 'Done!';
			        };
			        
			        //document.getElementById('fileInput2').value = dataURL;
			        //암호화
			        var en = Tea.encrypt(dataURL.replace('data:image/jpeg;base64,',''), "1234567890123456");
			        document.getElementById('fileInput2').value = en;
			        alert(en);
			        //frm2.submit();
			 
			        //xhr.open('POST', 'upload.jsp', true);
			        //xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			        //var data = 'image=' + dataURL;
			        //alert(data)
			        //xhr.send(data);
			      }	    	    
	    	    
	    	    //====>
	    	  }

	    	  reader.readAsDataURL(file); 
	    	} else {
	    	  fileDisplayArea.innerHTML = "File not supported!";
	    	}
	    });
	}  
   
  
  //$(document).ready(function() {  
  	function goUpload(){
  		$("#frm1").ajaxSubmit();
  		$("#frm2").ajaxSubmit();
  	}
  //});
  </script>
 </body>
</html>