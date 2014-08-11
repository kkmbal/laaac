String.prototype.trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
};

String.prototype.isMail = function(){
	try{
		console.log(typeof this)
		console.log(this)
		console.dir(this)
		var elem = this.trim().match(/^[_\-\.0-9a-zA-Z]{3,}@[-.0-9a-zA-Z]{2,}\.[a-zA-Z]{2,4}$/);
		return (elem)?true:false;
	}catch(e){}
};

String.prototype.isPwd = function(){
	try{
		var elem = this.trim().match(/([0-9a-zA-Z]){6,}/);
		if(elem){
			if(this.search(/[0-9]/g)<0 || this.search(/[a-z]/gi)<0){
				return false;
			}
			return true;
		}else{
			return false;
		}
	}catch(e){}
};

function drawCircle(id, colors) {
	for(var i=0;i<colors.length;i++){
		var el = document.getElementById(id); // get canvas

		var options = {
			percent:  el.getAttribute('data-percent') || 0,
			size: el.getAttribute('data-size') || 71,
			lineWidth: el.getAttribute('data-line') || 7,
			rotate: el.getAttribute('data-rotate') || 0
		};

		var lineWidth = options.lineWidth;
		var percent = 0;
		if(i == 0) percent = 100 / 100; 
		else	percent = options.percent / 100;
		
		var canvas = document.createElement('canvas');
		
		var span = document.createElement('span');
		if(i == 0){
			var t = document.createTextNode ( options.percent + '%' );
			span.appendChild(t);
			
		}
			
		if (typeof(G_vmlCanvasManager) !== 'undefined') {
			G_vmlCanvasManager.initElement(canvas);
		}

		var ctx = canvas.getContext('2d');
		canvas.width = canvas.height = options.size;

		el.appendChild(span);
		el.appendChild(canvas);

		ctx.translate(options.size / 2, options.size / 2); // change center
		ctx.rotate((-1 / 2 + options.rotate / 180) * Math.PI); // rotate -90 deg

		//imd = ctx.getImageData(0, 0, 240, 240);
		var radius = (options.size - options.lineWidth) / 2;

		percent = Math.min(Math.max(0, percent || 1), 1);
		ctx.beginPath();
		ctx.arc(0, 0, radius, 0, Math.PI * 2 * percent, false);
		ctx.strokeStyle = colors[i];
        ctx.lineCap = 'butt'; // butt, round or square
		ctx.lineWidth = lineWidth;
		ctx.stroke();
	}
}

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

//function makeThumbnail2(fileInput, fileNm, imageDiv, width, height) {
function makeThumbnail2(data) {
	var fileInput = document.getElementById(data.fileInput);
	var fileNm = document.getElementById(data.fileNm);
	var imageDiv = document.getElementById(data.imageDiv);
	
	fileInput.addEventListener('change', function(e) {
		var file = fileInput.files[0];
		var imageType = /image.*/;
		console.log(file)
		if (file.type.match(imageType)) {
			var reader = new FileReader();
			console.log(reader)
			reader.onload = function(e) {
				var img = new Image();
				img.src = reader.result;
				
				img.width = data.width;
				img.height = data.height;
				console.log(reader.result);
				imageDiv.appendChild(img);
				document.getElementById("imageFile").value = reader.result;
				
				fileNm.value = file.name;
				
			};
			
			reader.readAsDataURL(file); 
		} else {
			fileNm.value = "File not supported!";
		}
	});
} 