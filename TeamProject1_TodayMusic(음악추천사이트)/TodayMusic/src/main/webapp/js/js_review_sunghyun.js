/**
 * 
 */


function writeLengthCheck(takeData) {
	var writeLengthElement = document.getElementById("writeLength");
	writeLengthElement.innerHTML = takeData.length;
	}

function createDiv() {
	 var textarea = document.getElementById('write').value;
	 const newDiv = document.createElement('div');
	  
	 const newText = document.createTextNode(textarea);
	 newDiv.appendChild(newText);
	 document.body.appendChild(newDiv);
	} 