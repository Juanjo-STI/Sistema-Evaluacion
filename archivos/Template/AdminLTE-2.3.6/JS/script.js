function evaluar(idEvaluado){

	console.log("idEvaluado "+idEvaluado);
 
	$.ajax({

url: "PHP/evaluacion.php",
data: "idEvaluado="+idEvaluado,
type: "POST",
//timeout: 6000,

success: function(data){
    setTimeout(function(){
	console.log("Datos enviados con éxito");
    $(".content").load("PHP/evaluacion.php", {idEvaluado: idEvaluado}, function(responseTxt, statusTxt, xhr){
    if(statusTxt == "success"){
        console.log("Archivo evaluacion cargado con éxito!");
        $('form').garlic(); //Recarga Garlic
    	$(".evaluador").append(idEvaluado);
        eventoclick();      // Luego del ajax, reestablezco los 
                            //escuchas (opcional?)
	}
	
    if(statusTxt == "error")
        alert("Error: " + xhr.status + ": " + xhr.statusText);
    })
},500)
},
complete: function(data){
    $(".content").load("PHP/fichasbd.php", {idEvaluado: idEvaluado});

	//Agregar algo que demuestre que se está cargando 
	console.log("Cargando. . .");
},
error : function(xhr, status) {
    alert('Surgió un problema');
},

})
}


function eventoclick(){
$(':radio').change(function(){
    var btn = $(this).attr("name");
    var btnid = $(this).attr("id");
    var btn = btn + "-" + btnid;
    console.log("Se hizo click en el radio: "+btn);

    var res = btn.split("-") ;
    console.log("Comp literal: "+ res[0]);
    console.log("Item n°: "+ res[1]);
    console.log("Puntuación item: "+ res[2]);

/*
    $.ajax({

    url: "PHP/descripjson.php",
    data: "btn ="+ btn,
    type: POST,




    })*/
})
}