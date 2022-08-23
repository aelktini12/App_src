/**
 * Extraire le texte du pdf
 */
 
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

PDFJS.getDocument(PDF_URL).then(function (PDFDocumentInstance) {
	
	var totalPages = PDFDocumentInstance.pdfInfo.numPages;
	var pageNumber = 1;
}, function (reason) {
	console.error(reason);
});