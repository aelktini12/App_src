/**
 * Recuperer le fichier pdf
 */
 
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
	  	 