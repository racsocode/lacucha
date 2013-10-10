// JavaScript Document
$(document).ready( function(){

	$("#listadoul").sortable({
      handle : '.handle',
      update : function () {
					var order = $('#listadoul').sortable('serialize');
					pintar();
					$.get("ajax.php?"+order,{action:'ordenarCatProd'},function(data){
				});
      }
	});
	
	function pintar(){
		$("#listadoul li").each(function(x) {
			$(this).removeClass("fila1").removeClass("fila2");
			var w = 0;
			if(x%2==0){ w = 2;}else{ w = 1;}
			$(this).addClass("fila"+w);
		});
	}
	
	$('.clearField').clearField({
		blurClass: 'myBlurredClass',
		activeClass: 'myActiveClass'
	});

	$('.tooltip').tipsy({gravity: 'n',fade: true});
							   
	$("#images a").click( function(){
		var title = $(this).attr("title");
		$("#imgp").hide();
		$("#imgp").attr("src", title).fadeIn('slow'); 
	});	  
 
	$("#contrasena").click(function(){
		popup();
	});
	
	$("#enviar").click(function(){
		if(document.frmc.txtemail.value == ""){
			alert("Error : por favor ingrese su email");
			return false;
		}else{
			document.frmc.submit();
			return true;
		}
	});
	
	$(".date").datepicker({
		showOn: "button",
		buttonImage: "../aplication/webroot/imgs/calendar.png",
		buttonImageOnly: true,
		dateFormat: 'dd/mm/yy',
		yearRange: '1900:2010'
	});
	
	var dates = $('#fechai, #fechaf').datepicker({
		showOn: "button",
		buttonImage: "aplication/webroot/imgs/calendar.png",
		buttonImageOnly: true,
		maxDate: '+3M',
		dateFormat: 'dd/mm/yy',
		onSelect: function(selectedDate) {
			var option = this.id == "fechai" ? "minDate" : "maxDate";
			var instance = $(this).data("datepicker");
			var date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
			dates.not(this).datepicker("option", option, date);
		}
	});
	
}); 

valor=true;
function recuperar_acceso(){
		location.replace('index.php?action=recuperar');
}
function eliminar_sesion(){
	location.replace('salir.php');
}


function mantenimiento(url,id,opcion){
	if(opcion!="delete"){ 
		location.replace(url+'?action='+opcion+'&id='+id);			
	}else if(opcion=="delete"){
		if(!confirm("Esta Seguro que desea Eliminar el Registro")){
			return false;	
		}else{
			location.replace(url+'?action='+opcion+'&id='+id);			
		}		
	}
}


function mantenimiento_cat(url,id,opcion){
	if(!confirm("Esta Seguro que desea Eliminar el Registro")){
		return false;	
	}else{
		location.replace(url+'?actioncat='+opcion+'&id='+id);			
	}		
}

function mantenimiento_det(url, id1){	
	location.replace(url+'?id1='+id1);			
}


function validar_delete(){
	if(!confirm("Esta Seguro que desea Eliminar el Registro")){
		return false;	
	}else{
		return true;	
	}	
}


function validnum(e) { 
	tecla = (document.all) ? e.keyCode : e.which; 
	//alert(tecla)
    if (tecla == 8 || tecla == 46 || tecla == 0) return true; //Tecla de retroceso (para poder borrar) 
    // dejar la l�nea de patron que se necesite y borrar el resto 
    //patron =/[A-Za-z]/; // Solo acepta letras 
    patron = /\d/; // Solo acepta n�meros
    //patron = /\w/; // Acepta n�meros y letras 
    //patron = /\D/; // No acepta n�meros 
    // patron = /[\d.-]/; numeros el punto y el signo -
    te = String.fromCharCode(tecla); 
    return patron.test(te);  
	// uso  onKeyPress="return validnum(event)"
}

function removerDiv(HijoE){
	$("#"+HijoE).fadeOut('slow', function() { $(this).remove();}); 
}

function delete_imagen(opcion){
	var f1 = eval("document.f1");
	$("#msg_delete").hide();
	if(f1.chkimag.length > 0){
		for(var i=0; i < f1.chkimag.length; i++){
			if(f1.chkimag[i].checked == 1){			
				var id = f1.chkimag[i].value;
				$(".imagen" + id).fadeOut('slow');
				$("#msg_delete").load("delete_imagen.php?id="+id+"&opcion="+opcion).fadeIn("slow");
				$("#imgp").fadeOut("slow");
			}
		}
	}else{
		if(f1.chkimag.checked == 1){			
			var id = f1.chkimag.value;
			$(".imagen" + id).fadeOut('slow');
			$("#msg_delete").load("delete_imagen.php?id="+id+"&opcion="+opcion).fadeIn("slow");
			$("#imgp").fadeOut("slow");
		}	
	}	 			
}


function pasarEmail(repositorio, destinatarios){
		
		var rep = repositorio;
		var emails;
		var coincidencias = 0;
		for(var i=0; i < rep.length; i++){
				
			if(rep.options[i].selected == 1){
				
				if(destinatarios.value == ""){
					destinatarios.value = rep.options[i].value;	
				}else{
					emails = destinatarios.value.split(",")
					coincidencias = 0;
					for(var x = 0; x < emails.length; x++){
						if(rep.options[i].value == emails[x]){
							coincidencias++;
						}	
					}
					if(coincidencias == 0){
						destinatarios.value += "," + rep.options[i].value;		
					}								
				}
			}
		}	
}

function validar_boletin(){
		if(document.f1.destinatarios.value==""){
			alert("ERROR: por favor ingrese los destinatarios");
			document.f1.destinatarios.focus();
			return false
		}else if(document.f1.asunto.value==""){
			alert("ERROR: por favor ingrese el asunto");
			document.f1.asunto.focus();
			return false
		}else if(document.f1.mensaje.value==""){
			alert("ERROR: por favor ingrese el mensaje");
			document.f1.mensaje.focus();
			return false
		}else{
			return true
		}
	}

function valida_categorias(opcion, id){
	if(document.categorias.nombre_categoria.value == ""){ alert("Ingrese el nombre de la categoria"); return false;}
	document.categorias.action="productos.php?actioncat="+opcion+"&id="+id;
	document.categorias.submit();
}	

function valida_dias(opcion, id){
	if(document.dias.nombre_dia.value == ""){ alert("Ingrese el nombre del registro"); return false;}
	document.dias.action="musica.php?actioncat="+opcion+"&id="+id;
	document.dias.submit();
}	