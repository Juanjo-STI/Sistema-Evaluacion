function evaluar(idEvaluado){

    //Envia los datos de la evaluacion
    console.log("Id del Evaluado: "+idEvaluado);

    $.ajax({

        url: "PHP/evaluacion.php",
        beforeSend: function (){
            itemsJson(itemsLS);
            console.log("Cargando. . ");
        },
        success: function(data){
            setTimeout(function(){


                //Carga la página
                $(".content").load("PHP/evaluacion.php", {idEvaluado: idEvaluado}, function(responseTxt, statusTxt, xhr){
                    if(statusTxt == "success"){
                        console.log("Datos enviados con éxito");
                        eventoclick();      // Luego del ajax, reestablezco los 
                        //escuchas (opcional?)
                    }

                    if(statusTxt == "error")
                        console.log("Error: " + xhr.status + ": " + xhr.statusText);
                })
            },200)
            },
            complete: function(data){
            setTimeout(function(){
            console.log("Fin de AJAX");
            },100)

            },
            error : function(xhr, status) {
            console.log('Surgió un problema(itemsLS)');
        },


    })
}

//Envia el arreglo de todos los items en formado string contenidos en LS para luego ser decodificado(JSON)
function itemsJson(itemsLS){
    var itemsLS = localStorage.getItem('itemsLS');
    $.ajax({
        url: "fichasbd.php",
        type: 'post',
        data: JSON.stringify(itemsLS),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function(msg){
            console.log("JSON: "+msg);
        },
        complete: function(data){
            setTimeout(function(){
                console.log("Fin de Json");
            },100)

        },
        error : function(xhr, status) {
            console.log('Surgió un problema Json');
        },
    })
}



//Envia si están los items en el LS o no (string)
function locstor(siLS){
    $.ajax({
        url: 'agentes.php',
        data: "siLS ="+siLS,
        type: 'post',
        success: function(msg){
            console.log("siLS: "+ siLS);
            $.load('listaAgentes.php',{siLS:siLS})
        },
        complete: function(data){
          setTimeout(function(){
                console.log("Fin de ajax");
            },100)
        },
        error : function(xhr, status) {
            console.log('Surgió un problema(LS)'+xhr.status);
        },
    })
}

//click index, verifica LS
function clickIndex(){
$('#btnIndex').click(function(){
        if (localStorage.getItem('itemsLS') != null){
            siLS = true;
            console.log("Items en LS :"+siLS);
            locstor(siLS);
                
        }else{
            siLS = false;
            console.log("Items en LS :"+siLS);
        }

    })
}


//Implementar para que salte la descripción de cada puntuación y haga un insert/update
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

/*
    $.ajax({

    url: "PHP/descripjson.php",
    data: "btn ="+ btn,
    type: POST,




    })*/
})
}