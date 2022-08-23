<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<script>
function dragOverHandler(ev) {
		 ev.preventDefault();
		 ev.dataTransfer.dropEffect = "move";
	 }
	 
	 function dropHandler(ev) {
		 ev.preventDefault();
		 
		 const data = ev.dataTransfer.getData("text/plain");
		 ev.target.appendChild(document.getElementById(data));
	 }
		 
	 function dropHandler(ev) {
		 console.log('File dropped');
		 ev.preventDefault();
		 
		 if (ev.dataTransfer.items) {
			 for (let i=0; i<ev.dataTransfer.items.length; i++) {
				if (ev.dataTransfer.items[i].kind === 'file') {
					var file = ev.dataTransfer.items[i].getAsFile();
					console.log(file.name);
					//console.log(`file[].name = ev.dataTransfer.file.name`);
				} 
			 }
		 } else {
			 for(let i=0; i<ev.dataTransfer.files.length; i++) {
				 console.log(`… file[${i}].name = ${ev.dataTransfer.files[i].name}`);
			 }
		 }
	 
	 }
	 
	 function getPageText(pageNum, PDFDocumentInstance) {
			return new Promise(function (resolve, reject) {
				PDFDocumentInstance.getPage(pageNum).then(function (pdfPage) {
					pdfPage.getTextContent().then(function (textContent) {
						var textItems = textContent.items;
						var finalString = "";
						
						for (var i = 0; i < textItems.length; i++) {
							var item = textItems[i];
							
							finalString += item.str + "";
						}
						
						resolve(finalString);
						console.log(finalString);
					});
				});
			});
		}


		var PDF_URL  = '/App_src/WEB-INF/Depot.jsp/file';;

		jsPDF.getDocument(PDF_URL).then(function (PDFDocumentInstance) {
			
			var totalPages = PDFDocumentInstance.pdfInfo.numPages;
			var pageNumber = 1;
		}, function (reason) {
			console.error(reason);
		});
</script>
<title>Depot</title>

	  <style>
         #droppable { 
            width: 60px; height: 60px; padding: 0.5em; float: center; 
            margin: ; 	color: black;
         }
         .dropzone {
         	vertical-align: middle;
         	background-color: #FAF0E6;
			border: 4px solid #2F4F4F;
			width: 100px;
			height:100px;
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
	<fieldset id="importzone" style="padding-left: 30px; margin: 50px; border: 2px solid black; background-color: #F5F5F5;">
		<legend style="font-weight: bold; ">Import your resume here</legend>

		<input type="hidden" id="MAX_FILE_SIZE" name="MAX_FILE_SIZE" value="300000" />

		<div style="padding-top: 20px;">
			<label for="fileselect">Files to upload:</label>
			<input type="file" id="fileselect" name="fileselect[]" multiple="multiple" />
		
		
			<div id="filedrag"><p>Or drag the file to this <p/></div>
			
				<div class="dropzone" ondrop="dropHandler(event);" ondragover="dragOverHandler(event);">
	  				<p style="text-align: center; vertical-align: middle;"> <i><br>DROP <br> ZONE</i></p>
				</div>
			</div>

	</fieldset>
	<p/>


</body>
</html>