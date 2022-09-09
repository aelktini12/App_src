<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>



<title>Depot</title>

	  <style>
         #droppable { 
            width: 60px; height: 60px; padding: 0.5em; float: center; 
            margin: ; 	color: black;
         }
         #dropContainer {
         	vertical-align: middle;
         	background-color: #FAF0E6;
			border: 4px dotted #2F4F4F;
			width: 600px;
			height:200px;
		 }
		 #imp {
		 	padding-top: 30px;
		 }
      </style>  
</head>

<body>


<%@ include file="Menu.jsp" %>

<h3 style="text-align:center; padding-top: 20px;">Page de dépôt du Cv</h3>

	
	
	<p id="imp" >
	<fieldset id="importzone" style="padding-left: 30px; margin: 30px; border: 2px solid black; background-color: #F5F5F5;">
		<legend style="font-weight: bold; ">Import your resume here</legend>

		<input type="hidden" id="MAX_FILE_SIZE" name="MAX_FILE_SIZE" value="300000" />

		<div style="padding-top: 20px;">
			<label for="fileselect">Files to upload:</label>
			<input type="file" id="fileselect" name="fileselect[]" multiple="multiple" />
		
		
			<div id="filedrag"><p>Or drag the file to this <p/></div>
			
				<div id="dropContainer" ondrop="dropHandler(event);" ondragover="dragOverHandler(event);" style="background-color:#696969;">
	  				<p style="text-align: center; vertical-align: middle; padding-top: 50px;"> <i><br>DROP <br> ZONE</i></p>
				</div>
				<div id="status"></div>
			</div>
	</fieldset>
	<p/>
    <div id="output"></div>
    
    
    <script type="text/javascript">
        var file = new File([""], "filename");

		function dragOverHandler(ev) {
			 ev.preventDefault();
			 ev.dataTransfer.dropEffect = "move";
		 }
			 
		function dropHandler(ev) {
			 ev.preventDefault();
			 console.log('File dropped');
			
			 if (ev.dataTransfer.items) {
				 for (let i=0; i<ev.dataTransfer.items.length; i++) {
					if (ev.dataTransfer.items[i].kind === 'file') {
						file = ev.dataTransfer.items[i].getAsFile();
						console.log(file.name);
					}
				 }
			 } 
			 
			 fileUpload(file);
			 
			 // else {
				 //for(let i=0; i<ev.dataTransfer.files.length; i++) {
					 //console.log(`… file[${i}].name = ${ev.dataTransfer.files[i].name}`);
				 //}
			 // }
		}
			 
		 //var reader = new FileReader();
		 //var fileContent;
		 
		 //reader.onload = function(readerev, test){
			// fileContent = btoa(readerev.target.result);
		 //}
		 
		 //reader.readAsBinaryString(file);
		 
		 function fileUpload(ev) {
		 	document.getElementById("status").innerHTML = "Uploading" + file.name;
		 	
		 	var formData = new FormData();
			formData.append('file', file);
			
			var xhr = new XMLHttpRequest();
			xhr.upload.addEventListener("progress", fileUploadProgress, false);
			xhr.open("POST", "/App_src/depot", true);
			//xhr.onloadend = function() {
			    //if(xhr.status == 404) 
			        //throw new Error(url + ' replied 404');
				//}
			xhr.send(formData);	 
		 }
		 
		 function fileUploadProgress(ev) {
             var progress = Math.round(ev.loaded / ev.total * 100);
             document.getElementById("status").innerHTML = "Progress " + progress + "%";
         }
		 
		 function fileUploadComplete(ev) {
             document.getElementById("status").innerHTML = ev.target.responseText;
         }
		 
	</script>

</body>
</html>