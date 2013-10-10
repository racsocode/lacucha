// form validation function //
function validate(form, val) {
  var name = form.name.value;
  var email = form.email.value;
  //var gender = form.gender.value;
  var message = form.message.value;
  var nameRegex = /^[a-zA-Z������]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*$/;
  var emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
  var messageRegex = new RegExp(/<\/?\w+((\s+\w+(\s*=\s*(?:".*?"|'.*?'|[^'">\s]+))?)+\s*|\s*)\/?>/gim);
  
  if(val==1){
	  if(name == "") {
		inlineMsg('name','Usted debe ingresar su nombre.',2);
		return false;
	  }
	  if(!name.match(nameRegex)) {
		inlineMsg('name','Ha introducido un nombre no v&aacute;lido.',2);
		return false;
	  }
	  if(email == "") {
		inlineMsg('email','<strong>Error</strong><br />Usted debe ingresar su correo electr&oacute;nico.',2);
		return false;
	  }
	  if(!email.match(emailRegex)) {
		inlineMsg('email','<strong>Error</strong><br />Ha introducido una direcci&oacute;n de correo electr&oacute;nico no v&aacute;lida.',2);
		return false;
	  }
	  if(message == "") {
		inlineMsg('message','Debe introducir un mensaje.');
		return false;
	  }
	  if(message.match(messageRegex)) {
		inlineMsg('message','Ha introducido un mensaje no v&aacute;lido.');
		return false;
	  }
  
	}/*else{
	  if(name == "") {
		inlineMsg('name','You must enter your name.',2);
		return false;
	  }
	  if(!name.match(nameRegex)) {
		inlineMsg('name','You entered an invalid name.',2);
		return false;
	  }
	  if(email == "") {
		inlineMsg('email','<strong> Error </strong> <br/> You must enter your email.',2);
		return false;
	  }
	  if(!email.match(emailRegex)) {
		inlineMsg('email','<strong> Error </strong> <br/> You have entered an email address is not valid.',2);
		return false;
	  }
	  if(message == "") {
		inlineMsg('message','You must enter a message.');
		return false;
	  }
	  if(message.match(messageRegex)) {
		inlineMsg('message','You entered an invalid message.');
		return false;
	  }

	}*/
	
	var interval;
	$.ajax({
		  type: "POST",
  		  url: "enviar.php",
		  data : "name="+$('#name').val()+"&direccion="+$('#direccion').val()+"&telefono="+$('#telefono').val()+"&email="+$('#email').val()+"&message="+$('#message').val(),	 
		beforeSend: function(objeto){
			$(".loadingn").text('Enviando el Formulario');
			var point = ($(".loadingn").text()).length + 3;
            interval = window.setInterval(function(){
				var text = $(".loadingn").text();
				if (text.length < point){
					$(".loadingn").text(text + '.');	
				} else {
					$(".loadingn").text('Enviando el Formulario');				
				}
			}, 200);
        },
  		 success: function(msg){
   		  window.clearInterval(interval);
		  $("#formulario").slideUp("fast");
		  $("#confirmacion").slideDown("slow");
  		 },
		 complete:function(){
			
		 }
	});
  return false;
}

// START OF MESSAGE SCRIPT //

var MSGTIMER = 20;
var MSGSPEED = 5;
var MSGOFFSET = 3;
var MSGHIDE = 3;

// build out the divs, set attributes and call the fade function //
function inlineMsg(target,string,autohide) {
  var msg;
  var msgcontent;
  if(!document.getElementById('msg')) {
    msg = document.createElement('div');
    msg.id = 'msg';
    msgcontent = document.createElement('div');
    msgcontent.id = 'msgcontent';
    document.body.appendChild(msg);
    msg.appendChild(msgcontent);
    msg.style.filter = 'alpha(opacity=0)';
    msg.style.opacity = 0;
    msg.alpha = 0;
  } else {
    msg = document.getElementById('msg');
    msgcontent = document.getElementById('msgcontent');
  }
  msgcontent.innerHTML = string;
  msg.style.display = 'block';
  var msgheight = msg.offsetHeight;
  var targetdiv = document.getElementById(target);
  targetdiv.focus();
  var targetheight = targetdiv.offsetHeight;
  var targetwidth = targetdiv.offsetWidth;
  var topposition = topPosition(targetdiv) - ((msgheight - targetheight) / 2);
  var leftposition = leftPosition(targetdiv) + targetwidth + MSGOFFSET;
  msg.style.top = topposition + 'px';
  msg.style.left = leftposition + 'px';
  clearInterval(msg.timer);
  msg.timer = setInterval("fadeMsg(1)", MSGTIMER);
  if(!autohide) {
    autohide = MSGHIDE;  
  }
  window.setTimeout("hideMsg()", (autohide * 1000));
}

// hide the form alert //
function hideMsg(msg) {
  var msg = document.getElementById('msg');
  if(!msg.timer) {
    msg.timer = setInterval("fadeMsg(0)", MSGTIMER);
  }
}

// face the message box //
function fadeMsg(flag) {
  if(flag == null) {
    flag = 1;
  }
  var msg = document.getElementById('msg');
  var value;
  if(flag == 1) {
    value = msg.alpha + MSGSPEED;
  } else {
    value = msg.alpha - MSGSPEED;
  }
  msg.alpha = value;
  msg.style.opacity = (value / 100);
  msg.style.filter = 'alpha(opacity=' + value + ')';
  if(value >= 99) {
    clearInterval(msg.timer);
    msg.timer = null;
  } else if(value <= 1) {
    msg.style.display = "none";
    clearInterval(msg.timer);
  }
}

// calculate the position of the element in relation to the left of the browser //
function leftPosition(target) {
  var left = 10;
  if(target.offsetParent) {
    while(1) {
      left += target.offsetLeft;
      if(!target.offsetParent) {
        break;
      }
      target = target.offsetParent;
    }
  } else if(target.x) {
    left += target.x;
  }
  return left;
}

// calculate the position of the element in relation to the top of the browser window //
function topPosition(target) {
  var top = 0;
  if(target.offsetParent) {
    while(1) {
      top += target.offsetTop;
      if(!target.offsetParent) {
        break;
      }
      target = target.offsetParent;
    }
  } else if(target.y) {
    top += target.y;
  }
  return top;
}

// preload the arrow //
if(document.images) {
  arrow = new Image(7,80); 
  arrow.src = "../imgs/msg_arrow_blue.gif"; 
}