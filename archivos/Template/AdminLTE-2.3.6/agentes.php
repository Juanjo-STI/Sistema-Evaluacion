<!DOCTYPE html><html><head><meta charset="UTF-8"/></head><body>
<?php 
require_once("inicio.php");
?>

<section class="content">
<?php   
  //Variable que indica si los items están en el localStorage   	
  $siLS = $_POST['siLS'];

  //Verificar la conexión
  $conex = datosConex();
  if ($conex==true){
    //Comprobar si es necesario guardar los items en el LS
    if($siLS == 'true'){
     listarAgentesSec();
     var_dump($siLS);
     echo "TrUE";
    }else{
      echo "FALSE";
           var_dump($siLS);
      cargarItems();
      listarAgentesSec();
    }
  }


  //Muestra datos de los agentes y permite evaluarlos
  function listarAgentesSec(){
    //Variables
    global $conexion;
    $sector = $_SESSION['sector'];

    //Obtener agentes correspondientes al sector del evaluador, incluyéndolo
    $consulta = "SELECT idAgente, nombre, apellido FROM agente WHERE sector = '$sector' ";
    $datos = mysqli_query($conexion, $consulta) ;
    if (mysqli_num_rows($datos) > 0) {

      echo "<div class='tabla'>
      <table class='table table-bordered table-hover table-responsive'>
      <thead>
      <tr>
      <th class='col-xs-1'>Id</th>
      <th class='col-xs-3'>Apellido</th>
      <th class='col-xs-3'>Nombre</th>
      <th class='col-xs-4'>Acciones</th>
      </thead>";
      echo "<tbody>";
      while($fila = mysqli_fetch_assoc($datos)) {

        $arrayEvaluados = $fila['idAgente'];
        $_SESSION['idEvaluados'] = $arrayEvaluados;


        echo "<tr>";
        echo "<td>".$fila['idAgente']."</td>";
        echo "<td class'active'>".$fila['apellido']."</td>";
        echo "<td>".$fila['nombre']."</td>";
        echo "<td ><button id=".$fila['idAgente']." onclick='evaluar(this.id)' class='btn btn-success col-xs-6'>Evaluar</button>
        <button  class='btn btn-primary col-xs-6'>2</button>

        </td>";
        echo "</tr>";
      }

      echo "</tbody>
      </table></div>";

    }else{
     echo "<p>Sin resultados</p>";
    }
  } 


  //Carga los items de la base de datos y los guarda en el LocalStorage
  function cargarItems(){
    //Variables
    global $conexion;

    $arrayFinal = [];


    $consulta = "SELECT * FROM item";
    $datos = mysqli_query($conexion, $consulta);

    if (mysqli_num_rows($datos) > 0) {
      while($fila = mysqli_fetch_assoc($datos)) {

        //Inserta todos los items con sus datos al arreglo
        array_push($arrayFinal, [
          'tipoItem' => $fila['tipoItem'],
          'nroItem' => $fila['nroItem'],
          'nomb' => $fila['nombre'],
          'desc' => $fila['descripcion']
        ]);
     }
    }

    //Arreglo con los items en formato JSON
    $arrayJsoneado = json_encode($arrayFinal, JSON_UNESCAPED_UNICODE);

    //Guarda los items en el localStorage
    echo "<script>";
    echo "
        try{
          localStorage.setItem('itemsLS', JSON.stringify($arrayJsoneado));
          console.log('Todos los items guardados en localStorage');
        }
          catch(err){
          console.log('Hubo un problema en el guardado de items al localStorage');
        }";
    echo "</script>";
  }
?>

<?php
include "fin.php";
?>