function makeThumbnail(fileInput, fileNm, canvasImg, imageFile, width, height) {
		    var fileInput = document.getElementById(fileInput);
		    var fileNm = document.getElementById(fileNm);
		    var maxWidth = 100;
		    var maxHeight = 100;
		    if(width) maxWidth = width;
		    if(height) maxHeight = height;

		    fileInput.addEventListener('change', function(e) {
		    	var file = fileInput.files[0];
		    	var imageType = /image.*/;

		    	if (file.type.match(imageType)) {
		    	  var reader = new FileReader();

		    	  reader.onload = function(e) {

		    	    var img = new Image();
		    	    img.src = reader.result;

		    	    //fileDisplayArea.appendChild(img);
		    	    fileNm.value = file.name;
		    	    
				    img.onload = function() {
				 
				        var MAX_WIDTH = maxWidth;
				        var MAX_HEIGHT = maxHeight;
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

				        var canvas = document.getElementById(canvasImg);
				        canvas.width = tempW;
				        canvas.height = tempH;
				        var ctx = canvas.getContext("2d");
				        ctx.drawImage(this, 0, 0, tempW, tempH);
				        var dataURL = '';
				        if(file.name.toLowerCase().indexOf(".jpg") != -1){
				        	dataURL = canvas.toDataURL("image/jpeg");
				        }else if(file.name.toLowerCase().indexOf(".png") != -1){
				        	dataURL = canvas.toDataURL("image/png");
				        }else if(file.name.toLowerCase().indexOf(".gif") != -1){
				        	dataURL = canvas.toDataURL("image/gif");
				        }

				        //var xhr = new XMLHttpRequest();
				        //xhr.onreadystatechange = function(ev){
				            //document.getElementById('filesInfo').innerHTML = 'Done!';
				        //};
				        
				        document.getElementById(imageFile).value = dataURL;
				      }	;    	    
		    	    
		    	  };

		    	  reader.readAsDataURL(file); 
		    	} else {
		    	  //fileDisplayArea.innerHTML = "File not supported!";
		    		fileNm.value = "File not supported!";
		    	}
		    });
		} 