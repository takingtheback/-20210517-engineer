 function sendMail() {
   
    	 var emailElement = {};
    	 emailElement.email = document.getElementById("email").value;
    	 emailElement.title = document.getElementById("title").value;
    	 emailElement.mobile = document.getElementById("mobile").value;
    	 emailElement.contents = document.getElementById("contents").value;
    	 
    	 //emailjs 발송
    	 
         emailjs.init("user_irTOcdicOfCi1q3ar3yJT");
         emailjs.send("Side-On","template_l0b43za", emailElement)
         .then(function(response) {
             console.log("SUCCESS. status=%d, text=%s", response.status, response.text);
             
            location.href="/board/contactResult";
        }, function(err) {
             console.log("FAILED. error=", err);
             alert('EmailJs Service Error');
             return false;
          });
     };