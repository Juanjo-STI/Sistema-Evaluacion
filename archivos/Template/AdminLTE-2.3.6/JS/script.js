//Llamados desde index.php

//Luego de clickear el boton para evaluar en index.php se evalua si 
//los items están contenidos en el localStorage
$('#btnIndex').one("click",function(){
        if (localStorage.getItem('itemsLS') != null){
            siLS = true;
            console.log("Items en LS :"+siLS);
        }else{
            //Si localStorage está vacío se llama a la función locstor
            siLS = false;
            console.log("Items en LS :"+siLS);
            locstor(siLS);
        }
        //redirige a la lista de agentes a evaluar
        setTimeout(function(){
            window.location.href = "agentes.php";
        },200)
})

//Envia si están los items en el LS o no (string)
//En base a esto los items se cargan o no en el LS
function locstor(siLS){
    $.ajax({
        url: 'PHP/cargarEnLS.php',
        data: {"siLS":siLS},
        type: 'post',
        success: function(data){
            console.log("Se cargarán los items en el localStorage");
            //data recibe los items cargados desde la base de datos, pasados a un arreglo
            try{
                localStorage.setItem('itemsLS', data);
                console.log('Todos los items guardados en localStorage');
            }
            catch(err){
                console.log('Hubo un problema en el guardado de items al localStorage. '+err);
            }
        },

        error : function(xhr, status) {
            console.log('Surgió un problema en locstor'+xhr.status);
        },

        complete: function(data){
 
                console.log("Fin de ajax locstor");

        }
    })
}



//Llamados desde agentes.php

//Envia todos los items contenidos en localStorage para luego ser decodificados en evaluacion.php
function evaluar(idEvaluado){

    //Envia los datos de la evaluacion
    console.log("Id del Evaluado: "+idEvaluado);
    var itemsLS = localStorage.getItem('itemsLS');
    $.ajax({
        url: "PHP/evaluacion.php?idEvaluado="+idEvaluado,
        data: itemsLS,
        type: 'POST',
        success: function(data){
            console.log("items enviados con éxito");
            console.log(data);
            //redirigir
        },
        error: function(){
            console.log("Error enviando items");
        }
    })
}



/*
Implementar para que salte la descripción de cada puntuación y haga un insert/update
function radioclick(){
$(':radio').change(function(){
    var btn = $(this).attr("name");
    var btnid = $(this).attr("id");
    var btn = btn + "-" + btnid;
    console.log("Se hizo click en el radio: "+btn);

    var res = btn.split("-") ;
    console.log("Tipo item: "+ res[0]);
    console.log("Item n°: "+ res[1]);
    console.log("Puntuación item: "+ res[2]);

    $.ajax({

    url: "PHP/descripjson.php",
    data: "btn ="+ btn,
    type: POST,




    })
})
}
*/